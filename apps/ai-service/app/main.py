"""Hainan Dialect AI Service — FastAPI entrypoint.

Exposes:
  - GET  /health                  service health + ASR engine status
  - POST /v1/asr/offline          offline transcription (multipart file upload)
  - POST /v1/asr/offline-base64   offline transcription (JSON base64 payload — easier CORS)
  - WS   /v1/asr/stream           streaming transcription
  - POST /v1/translate            legacy text-translation stub (kept for backend compat)
  - POST /v1/pronunciation/score  legacy scoring stub
  - POST /v1/recommendations      legacy recs stub
  - GET  /v1/vocab                curated Hainanese dictionary preview for UI autocomplete

The ASR model path is auto-discovered from the repo layout; override with
`HAINAN_ASR_MODEL_DIR`. Device is `cpu` by default; set `HAINAN_ASR_DEVICE=cuda:0`
for GPU.
"""

from __future__ import annotations

import asyncio
import base64
import binascii
import json
import logging
import os
from pathlib import Path
from typing import Literal

import numpy as np
from fastapi import FastAPI, File, HTTPException, UploadFile, WebSocket, WebSocketDisconnect
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel, Field

from .asr_engine import ASREngine, StreamDecoder, decode_wav_bytes
from . import hainan_dict


logging.basicConfig(
    level=os.environ.get("LOG_LEVEL", "INFO"),
    format="%(asctime)s | %(levelname)s | %(name)s | %(message)s",
)
_LOG = logging.getLogger("ai-service")


# Locate the monorepo root by walking up until we find a directory that has `apps/`.
def _find_project_root() -> Path:
    here = Path(__file__).resolve()
    for parent in [here.parent, *here.parents]:
        if (parent / "apps").is_dir() or (parent / "hainan_asr").is_dir():
            return parent
    return here.parent


PROJECT_ROOT = Path(os.environ.get("HAINAN_PROJECT_ROOT", _find_project_root())).resolve()


app = FastAPI(
    title="Hainan Dialect AI Service",
    version="0.2.0",
    description=(
        "Hainanese speech recognition powered by a fine-tuned SenseVoice-Small model. "
        "Also serves legacy translation / scoring stubs for backward compatibility."
    ),
)

# The Vue dev server runs at :5173 by default; allow any origin in dev so CORS is a
# non-issue for this single-purpose service. Tighten in production.
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=False,
    allow_methods=["*"],
    allow_headers=["*"],
)


_engine: ASREngine | None = None


@app.on_event("startup")
def _startup() -> None:
    global _engine
    try:
        _engine = ASREngine(PROJECT_ROOT)
    except Exception as exc:
        _LOG.exception("ASR engine failed to load: %s", exc)
        _engine = None


# ---------------------- /health ----------------------

@app.get("/health")
def health() -> dict[str, object]:
    return {
        "status": "ok" if _engine is not None else "degraded",
        "service": "ai-service",
        "asr_engine": {
            "loaded": _engine is not None,
            "model_dir": str(_engine.model_dir) if _engine else None,
            "device": _engine.device if _engine else None,
        },
        "project_root": str(PROJECT_ROOT),
    }


# ---------------------- helpers ----------------------

def _require_engine() -> ASREngine:
    if _engine is None:
        raise HTTPException(status_code=503, detail="ASR engine is not loaded")
    return _engine


def _enrich(text: str) -> dict[str, object]:
    lookup = hainan_dict.lookup(text)
    return {
        "mandarin": text,
        "hainan_char": lookup["hainan_char"],
        "hainan_pinyin": lookup["hainan_pinyin"],
        "representation_source": lookup["source"],
        "in_dict": lookup["in_dict"],
    }


# ---------------------- offline ASR (multipart) ----------------------

class ASRResponse(BaseModel):
    mandarin: str
    hainan_char: str
    hainan_pinyin: str
    representation_source: str
    in_dict: bool
    language_detected: str | None = None
    duration_ms: int
    inference_ms: int
    raw_token_text: str


@app.post("/v1/asr/offline", response_model=ASRResponse)
async def asr_offline(
    audio: UploadFile = File(..., description="WAV/WEBM/MP3/FLAC audio file"),
    language: Literal["auto", "zh", "yue", "en", "ja", "ko"] = "auto",
) -> ASRResponse:
    engine = _require_engine()
    data = await audio.read()
    if not data:
        raise HTTPException(status_code=400, detail="Empty audio payload")

    try:
        wav, sr = decode_wav_bytes(data)
    except Exception as exc:
        raise HTTPException(status_code=400, detail=f"Could not decode audio: {exc}") from exc

    try:
        result = engine.transcribe_wav(wav, sr, language=language)
    except Exception as exc:
        _LOG.exception("ASR failed")
        raise HTTPException(status_code=500, detail=f"ASR failed: {exc}") from exc

    enriched = _enrich(result.text)
    return ASRResponse(
        **enriched,
        language_detected=result.language,
        duration_ms=result.duration_ms,
        inference_ms=result.inference_ms,
        raw_token_text=result.raw,
    )


# ---------------------- offline ASR (base64 JSON) ----------------------

class ASRBase64Request(BaseModel):
    audio_base64: str = Field(..., description="base64-encoded audio bytes; any wave/webm/mp3 that libsndfile can read")
    language: Literal["auto", "zh", "yue", "en", "ja", "ko"] = "auto"


@app.post("/v1/asr/offline-base64", response_model=ASRResponse)
async def asr_offline_base64(payload: ASRBase64Request) -> ASRResponse:
    engine = _require_engine()
    try:
        data = base64.b64decode(payload.audio_base64, validate=True)
    except binascii.Error as exc:
        raise HTTPException(status_code=400, detail=f"Invalid base64: {exc}") from exc
    if not data:
        raise HTTPException(status_code=400, detail="Empty audio payload")

    try:
        wav, sr = decode_wav_bytes(data)
    except Exception as exc:
        raise HTTPException(status_code=400, detail=f"Could not decode audio: {exc}") from exc

    result = engine.transcribe_wav(wav, sr, language=payload.language)
    enriched = _enrich(result.text)
    return ASRResponse(
        **enriched,
        language_detected=result.language,
        duration_ms=result.duration_ms,
        inference_ms=result.inference_ms,
        raw_token_text=result.raw,
    )


# ---------------------- streaming ASR (WebSocket) ----------------------

@app.websocket("/v1/asr/stream")
async def asr_stream(websocket: WebSocket) -> None:
    """Bidirectional streaming ASR.

    Client protocol:
      - initial JSON message `{"sample_rate": 16000, "language": "auto"}` (optional).
      - subsequent binary messages: raw PCM 16-bit little-endian mono samples at
        `sample_rate` (we resample internally if != 16000).
      - optional text message `{"event": "eos"}` to flush.

    Server emits JSON `{"type": "partial"|"final", "mandarin": ..., "hainan_char": ..., ...}`.
    """
    await websocket.accept()
    try:
        engine = _require_engine()
    except HTTPException as exc:
        await websocket.send_text(json.dumps({"type": "error", "detail": exc.detail}))
        await websocket.close()
        return

    sample_rate = 16000
    language = "auto"
    # Try to read the initial config message, but don't block if the client goes straight to audio.
    try:
        msg = await asyncio.wait_for(websocket.receive(), timeout=1.0)
        if "text" in msg and msg["text"]:
            try:
                cfg = json.loads(msg["text"])
                sample_rate = int(cfg.get("sample_rate", 16000))
                language = str(cfg.get("language", "auto"))
            except Exception:
                pass
        elif "bytes" in msg and msg["bytes"]:
            # they started streaming immediately; stash this chunk for processing
            pending_first_chunk = msg["bytes"]
        else:
            pending_first_chunk = None
    except asyncio.TimeoutError:
        pending_first_chunk = None
    else:
        pending_first_chunk = None if "text" in msg else msg.get("bytes")

    decoder = StreamDecoder(engine, sample_rate=16000)

    async def process_bytes(b: bytes) -> None:
        if not b:
            return
        # Client sends int16 PCM. Convert.
        arr = np.frombuffer(b, dtype=np.int16).astype(np.float32) / 32768.0
        if sample_rate != 16000:
            from .asr_engine import _resample_linear
            arr = _resample_linear(arr, sample_rate, 16000)
        partial = decoder.feed(arr)
        if partial is None:
            return
        out = _enrich(partial) if partial else {"mandarin": "", "hainan_char": "", "hainan_pinyin": "", "representation_source": "silence", "in_dict": False}
        await websocket.send_text(json.dumps({"type": "partial", **out}, ensure_ascii=False))

    try:
        if pending_first_chunk:
            await process_bytes(pending_first_chunk)

        while True:
            msg = await websocket.receive()
            if msg.get("type") == "websocket.disconnect":
                break
            if "bytes" in msg and msg["bytes"]:
                await process_bytes(msg["bytes"])
            elif "text" in msg and msg["text"]:
                try:
                    cmd = json.loads(msg["text"])
                except Exception:
                    continue
                if cmd.get("event") == "eos":
                    final_text = decoder.finalise()
                    out = _enrich(final_text) if final_text else {"mandarin": "", "hainan_char": "", "hainan_pinyin": "", "representation_source": "silence", "in_dict": False}
                    await websocket.send_text(json.dumps({"type": "final", **out}, ensure_ascii=False))
                    break
    except WebSocketDisconnect:
        pass
    except Exception as exc:
        _LOG.exception("Stream ASR failed")
        try:
            await websocket.send_text(json.dumps({"type": "error", "detail": str(exc)}))
        except Exception:
            pass
    finally:
        try:
            await websocket.close()
        except Exception:
            pass


# ---------------------- vocabulary endpoint ----------------------

@app.get("/v1/vocab")
def vocab() -> dict[str, object]:
    entries = hainan_dict.known_entries()
    return {"count": len(entries), "entries": entries}


# ---------------------- legacy stubs (kept for backend compat) ----------------------

class TranslateRequest(BaseModel):
    source_language: str = Field(..., min_length=2)
    target_language: str = Field(..., min_length=2)
    text: str = Field(..., min_length=1)


class TranslateResponse(BaseModel):
    source_language: str
    target_language: str
    source_text: str
    translated_text: str
    confidence: float
    strategy: str


@app.post("/v1/translate", response_model=TranslateResponse)
def translate(payload: TranslateRequest) -> TranslateResponse:
    """Lightweight text-level translation that now leverages the curated dictionary.

    Flow:
      - if source→target is zh-CN→nan-hn, look up Hainanese char form
      - if source→target is nan-hn→zh-CN, attempt reverse lookup
      - otherwise return a placeholder (same as the original scaffold)
    """
    direction = (payload.source_language.lower(), payload.target_language.lower())
    if direction == ("zh-cn", "nan-hn"):
        entry = hainan_dict.lookup(payload.text)
        if entry["in_dict"] or entry["source"] == "character_compose":
            return TranslateResponse(
                source_language=payload.source_language,
                target_language=payload.target_language,
                source_text=payload.text,
                translated_text=entry["hainan_char"],
                confidence=0.9 if entry["in_dict"] else 0.6,
                strategy="curated_dict" if entry["in_dict"] else "char_compose",
            )
    elif direction == ("nan-hn", "zh-cn"):
        for entry in hainan_dict.known_entries():
            if entry["hainan_char"] == payload.text.strip():
                return TranslateResponse(
                    source_language=payload.source_language,
                    target_language=payload.target_language,
                    source_text=payload.text,
                    translated_text=entry["mandarin"],
                    confidence=0.88,
                    strategy="reverse_dict",
                )

    return TranslateResponse(
        source_language=payload.source_language,
        target_language=payload.target_language,
        source_text=payload.text,
        translated_text=f"[placeholder] {payload.text}",
        confidence=0.45,
        strategy="placeholder_fallback",
    )


class PronunciationRequest(BaseModel):
    target_text: str = Field(..., min_length=1)
    transcript_text: str = Field(..., min_length=1)
    audio_url: str | None = None


class PronunciationResponse(BaseModel):
    overall_score: float
    fluency_score: float
    accuracy_score: float
    hints: list[str]


@app.post("/v1/pronunciation/score", response_model=PronunciationResponse)
def score_pronunciation(payload: PronunciationRequest) -> PronunciationResponse:
    target = payload.target_text.strip()
    transcript = payload.transcript_text.strip()
    diff = abs(len(target) - len(transcript))
    accuracy = max(45.0, 100.0 - (diff * 8.0))
    fluency = max(50.0, 96.0 - (diff * 5.0))
    overall = round((accuracy + fluency) / 2.0, 2)
    return PronunciationResponse(
        overall_score=overall,
        fluency_score=round(fluency, 2),
        accuracy_score=round(accuracy, 2),
        hints=[
            "Replace scoring with phoneme alignment once an acoustic GOP model is trained.",
            "Store approved recordings so they can seed future fine-tune rounds.",
        ],
    )


class RecommendationRequest(BaseModel):
    level: Literal["beginner", "intermediate", "advanced"]
    weak_tags: list[str] = Field(default_factory=list)


class RecommendationResponse(BaseModel):
    level: str
    recommendations: list[str]


@app.post("/v1/recommendations", response_model=RecommendationResponse)
def recommend(payload: RecommendationRequest) -> RecommendationResponse:
    pool = {
        "beginner": [
            "Daily greetings",
            "Travel essentials",
            "Food ordering phrases",
        ],
        "intermediate": [
            "Longer shopping dialogue",
            "Pronunciation correction drills",
            "Culture-linked vocabulary",
        ],
        "advanced": [
            "Regional variant comparison",
            "Government service vocabulary",
            "Corpus contribution and review",
        ],
    }
    recommendations = pool[payload.level]
    if payload.weak_tags:
        recommendations = recommendations + [f"Focused review for: {', '.join(payload.weak_tags)}"]
    return RecommendationResponse(level=payload.level, recommendations=recommendations)

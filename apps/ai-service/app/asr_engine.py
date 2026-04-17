"""SenseVoice ASR engine wrapper.

Loads the fine-tuned SenseVoice-Small checkpoint once at startup and exposes:
  - `transcribe(wav_np, sample_rate)` for offline inference
  - `StreamDecoder` for sliding-window streaming inference

Works on CPU by default. Set `HAINAN_ASR_DEVICE=cuda:0` to move onto GPU.

Model path is configured via `HAINAN_ASR_MODEL_DIR`. When unset, falls back to a
list of candidates so the service Just Works in this monorepo layout.
"""

from __future__ import annotations

import logging
import os
import re
import threading
import time
import wave
from dataclasses import dataclass
from pathlib import Path
from typing import Any

import numpy as np


_LOG = logging.getLogger(__name__)
_RICH_RE = re.compile(r"<\|([^|]+)\|>")


# Sensible defaults that match this repo's layout. First match wins.
_DEFAULT_CANDIDATES = (
    # Co-deployed model inside this repo (standard drop-in after download_model.sh).
    "models/sensevoice_hainan_best_deploy",
    # Fall back to the sibling training repo when we are running directly from a
    # developer checkout that has FunASRfinetune-c next to it.
    "hainan_asr/outputs/sensevoice_hainan_run1_noSynth/best_deploy",
    "hainan_asr/outputs/sensevoice_hainan_run2_synth/best_deploy",
    # Upstream baseline — lets the service boot for health checks even without
    # the fine-tuned weights. Practically unusable for Hainanese.
    "models/iic/SenseVoiceSmall",
)


def _resolve_model_dir(project_root: Path) -> Path:
    override = os.environ.get("HAINAN_ASR_MODEL_DIR")
    if override:
        p = Path(override).expanduser()
        if not p.is_absolute():
            p = (project_root / p).resolve()
        if not p.exists():
            raise RuntimeError(
                f"HAINAN_ASR_MODEL_DIR={override!r} but {p} does not exist"
            )
        return p
    for rel in _DEFAULT_CANDIDATES:
        p = (project_root / rel).resolve()
        if p.exists():
            _LOG.warning("Using default model_dir=%s", p)
            return p
    raise RuntimeError(
        "No SenseVoice model directory found. Set HAINAN_ASR_MODEL_DIR or "
        f"place a model under one of: {_DEFAULT_CANDIDATES}"
    )


def _strip_rich(text: str) -> dict[str, Any]:
    """Split SenseVoice output into the clean transcript and the detected meta tokens."""
    meta: dict[str, str] = {}
    for m in _RICH_RE.finditer(text):
        token = m.group(1)
        if token in {"Speech", "BGM", "Music"}:
            meta["event"] = token
        elif token in {"NEUTRAL", "HAPPY", "SAD", "ANGRY", "FEARFUL", "SURPRISED", "DISGUSTED", "EMO_UNKNOWN"}:
            meta["emotion"] = token
        elif token in {"woitn", "withitn"}:
            meta["itn"] = token
        else:
            meta.setdefault("language", token)
    clean = _RICH_RE.sub("", text).strip()
    return {"text": clean, "meta": meta}


@dataclass
class TranscribeResult:
    text: str
    raw: str
    language: str | None
    duration_ms: int
    inference_ms: int


class ASREngine:
    def __init__(self, project_root: Path) -> None:
        self.project_root = project_root
        self.model_dir = _resolve_model_dir(project_root)
        self.device = os.environ.get("HAINAN_ASR_DEVICE", "cpu")
        self._model = None
        self._lock = threading.Lock()  # funasr pipeline isn't guaranteed thread-safe
        self._load()

    def _load(self) -> None:
        from funasr import AutoModel

        _LOG.warning("Loading SenseVoice from %s on %s", self.model_dir, self.device)
        self._model = AutoModel(
            model=str(self.model_dir),
            device=self.device,
            disable_update=True,
        )
        _LOG.warning("SenseVoice ready")

    def transcribe_wav(self, wav: np.ndarray, sample_rate: int, language: str = "auto") -> TranscribeResult:
        """Transcribe a numpy mono float32 waveform. Resamples if sample_rate != 16k."""
        if wav.ndim > 1:
            wav = wav.mean(axis=-1)
        wav = wav.astype(np.float32, copy=False)
        if sample_rate != 16000:
            wav = _resample_linear(wav, sample_rate, 16000)
            sample_rate = 16000
        duration_ms = int(round(1000.0 * wav.shape[-1] / sample_rate))

        t0 = time.time()
        with self._lock:
            res = self._model.generate(
                input=wav,
                cache={},
                language=language,
                use_itn=True,
            )
        inference_ms = int((time.time() - t0) * 1000)
        raw = (res[0].get("text") or "") if res else ""
        parsed = _strip_rich(raw)
        return TranscribeResult(
            text=parsed["text"],
            raw=raw,
            language=parsed["meta"].get("language"),
            duration_ms=duration_ms,
            inference_ms=inference_ms,
        )


def _resample_linear(wav: np.ndarray, src_sr: int, tgt_sr: int) -> np.ndarray:
    """A small, dependency-free linear resampler. Fine for 16k↔48k conversion quality
    needed by an ASR front-end; not a production audio library.
    """
    if src_sr == tgt_sr:
        return wav
    n_src = wav.shape[-1]
    n_tgt = int(round(n_src * tgt_sr / src_sr))
    if n_tgt <= 1:
        return wav
    x_src = np.linspace(0.0, 1.0, num=n_src, endpoint=False, dtype=np.float64)
    x_tgt = np.linspace(0.0, 1.0, num=n_tgt, endpoint=False, dtype=np.float64)
    return np.interp(x_tgt, x_src, wav).astype(np.float32)


def decode_wav_bytes(wav_bytes: bytes) -> tuple[np.ndarray, int]:
    """Decode WAV header + PCM to a float32 numpy mono array. Returns (wav, sr).

    Deliberately avoids adding librosa/scipy to the ai-service dependency list. For
    non-WAV uploads the frontend will convert to WAV via MediaRecorder-to-WAV on the
    browser side (or the server falls back to soundfile if present).
    """
    from io import BytesIO
    try:
        with wave.open(BytesIO(wav_bytes), "rb") as wf:
            n_channels = wf.getnchannels()
            sampwidth = wf.getsampwidth()
            framerate = wf.getframerate()
            nframes = wf.getnframes()
            frames = wf.readframes(nframes)
    except wave.Error:
        return _decode_via_soundfile(wav_bytes)

    if sampwidth == 2:
        arr = np.frombuffer(frames, dtype=np.int16).astype(np.float32) / 32768.0
    elif sampwidth == 4:
        arr = np.frombuffer(frames, dtype=np.int32).astype(np.float32) / 2147483648.0
    elif sampwidth == 1:
        arr = (np.frombuffer(frames, dtype=np.uint8).astype(np.float32) - 128.0) / 128.0
    else:
        raise ValueError(f"Unsupported sample width: {sampwidth}")

    if n_channels > 1:
        arr = arr.reshape(-1, n_channels).mean(axis=1)
    return arr, framerate


def _decode_via_soundfile(audio_bytes: bytes) -> tuple[np.ndarray, int]:
    """Fallback for non-WAV uploads (webm/opus, mp3). Requires soundfile (libsndfile)."""
    try:
        import soundfile as sf  # type: ignore
    except Exception as exc:  # pragma: no cover - only hit if libsndfile missing
        raise RuntimeError(
            "Non-WAV audio requires the soundfile library; install with "
            "'pip install soundfile'."
        ) from exc
    from io import BytesIO

    data, sr = sf.read(BytesIO(audio_bytes), dtype="float32", always_2d=False)
    if data.ndim > 1:
        data = data.mean(axis=-1)
    return data.astype(np.float32), int(sr)


class StreamDecoder:
    """Sliding-window streaming decoder for the WebSocket endpoint.

    Strategy:
      - accumulate a rolling 10s buffer of 16k float32 samples
      - every `hop_seconds` emit a "partial" transcription from the latest `window_seconds`
      - when the client signals EOS, emit a "final" using everything received
    """

    def __init__(
        self,
        engine: ASREngine,
        sample_rate: int = 16000,
        window_seconds: float = 6.0,
        hop_seconds: float = 0.8,
        max_buffer_seconds: float = 30.0,
    ) -> None:
        self.engine = engine
        self.sr = sample_rate
        self.window_n = int(window_seconds * sample_rate)
        self.hop_n = int(hop_seconds * sample_rate)
        self.max_buffer_n = int(max_buffer_seconds * sample_rate)
        self._buf = np.zeros(0, dtype=np.float32)
        self._samples_since_last_emit = 0

    def feed(self, chunk: np.ndarray) -> str | None:
        if chunk.size == 0:
            return None
        chunk = chunk.astype(np.float32, copy=False)
        if chunk.ndim > 1:
            chunk = chunk.mean(axis=-1)
        self._buf = np.concatenate([self._buf, chunk])
        if self._buf.size > self.max_buffer_n:
            self._buf = self._buf[-self.max_buffer_n :]
        self._samples_since_last_emit += int(chunk.size)

        if self._samples_since_last_emit < self.hop_n:
            return None
        if self._buf.size < int(1.2 * self.sr):  # need at least ~1.2s before first emit
            return None
        self._samples_since_last_emit = 0
        window = self._buf[-self.window_n :] if self._buf.size > self.window_n else self._buf
        rms = float(np.sqrt(np.mean(window.astype(np.float32) ** 2) + 1e-12))
        if rms < 2e-3:
            return ""  # silence
        return self.engine.transcribe_wav(window, self.sr).text

    def finalise(self) -> str:
        if self._buf.size < self.sr * 0.2:
            return ""
        return self.engine.transcribe_wav(self._buf, self.sr).text

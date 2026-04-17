# AI Service (Hainan Dialect ASR)

FastAPI service that hosts the fine-tuned **SenseVoice-Small** Hainanese speech
recogniser and serves legacy translation / pronunciation stubs.

## Endpoints

| Method | Path | Purpose |
|---|---|---|
| GET | `/health` | Service + ASR engine status |
| POST | `/v1/asr/offline` | Multipart file upload → transcription + dialect annotation |
| POST | `/v1/asr/offline-base64` | JSON payload with base64 audio → same as above |
| WebSocket | `/v1/asr/stream` | Streaming recognition: client sends int16 PCM, gets partial/final transcripts |
| GET | `/v1/vocab` | Curated Hainanese-word dictionary preview (for UI autocomplete) |
| POST | `/v1/translate` | Mandarin ↔ Hainanese text translation (dictionary-backed) |
| POST | `/v1/pronunciation/score` | Length-heuristic score (legacy stub) |
| POST | `/v1/recommendations` | Static recommendation stub |

### Response shape for `/v1/asr/offline*`

```json
{
  "mandarin": "苹果。",
  "hainan_char": "苹果",
  "hainan_pinyin": "pêng-kó",
  "representation_source": "curated",   // "curated" | "character_compose" | "mandarin_pinyin_fallback"
  "in_dict": true,
  "language_detected": "zh",
  "duration_ms": 1835,
  "inference_ms": 131,
  "raw_token_text": "<|zh|><|NEUTRAL|><|Speech|><|withitn|>苹果。"
}
```

### WebSocket protocol (`/v1/asr/stream`)

Client → server:
1. (optional) JSON text frame: `{"sample_rate": 16000, "language": "auto"}`
2. Binary frames: raw int16 PCM mono, at `sample_rate` (server resamples to 16k if needed)
3. (optional) JSON text frame: `{"event": "eos"}` to flush — server responds with a `final`
   message and then closes the connection.

Server → client (JSON text frames):
```
{ "type": "partial", "mandarin": "...", "hainan_char": "...", ... }
{ "type": "final",   "mandarin": "...", "hainan_char": "...", ... }
{ "type": "error",   "detail": "..." }
```

## Run it

Recommended: reuse the `hainan_asr` conda env that trained the model — it already has
`funasr`, `torch`, etc. Only add the extra deps from `requirements.txt`:

```bash
conda activate hainan_asr
pip install -r apps/ai-service/requirements.txt

# Easiest: the root package.json has a prebuilt script
npm run dev:ai                                # port 8001

# Or use the helper script (reads HAINAN_* env vars if you want to override)
./apps/ai-service/start.sh

# Or direct uvicorn:
python -m uvicorn app.main:app --app-dir apps/ai-service --port 8001 --reload
```

### Environment variables

| Name | Default | Purpose |
|---|---|---|
| `HAINAN_ASR_MODEL_DIR` | auto-discover in project root | Path to a SenseVoice-compatible model folder (needs `model.pt`, `config.yaml`, `am.mvn`, tokenizer files) |
| `HAINAN_ASR_DEVICE` | `cpu` | Torch device (`cpu`, `cuda:0`, ...) |
| `HAINAN_PROJECT_ROOT` | derived from `apps/` parent | Used to resolve default model dirs |
| `LOG_LEVEL` | `INFO` | Python logging level |

### Sanity-check

```bash
curl -s http://localhost:8001/health | jq
curl -s -F "audio=@dataset/wav/1_pingguo.wav" http://localhost:8001/v1/asr/offline | jq
```

## Model choice

The loader tries these paths in order (first existing wins):

1. `hainan_asr/outputs/sensevoice_hainan_run1_noSynth/best_deploy` – recommended
   default: best held-out CER (0.47, 36% exact on 56 unseen words).
2. `hainan_asr/outputs/sensevoice_hainan_run2_synth/best_deploy` – v2 with concat-
   synthesis: best training-vocabulary recall (90% exact on 50 seen words), slight
   regression on unseen (CER 0.49).
3. `models/iic/SenseVoiceSmall` – upstream baseline fallback (unusable for Hainanese
   but lets the service at least start for health checks).

Override with `HAINAN_ASR_MODEL_DIR` to point at any SenseVoice-compatible directory.

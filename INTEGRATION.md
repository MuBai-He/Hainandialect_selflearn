# Hainan Dialect Self-Learn — ASR integration

This document explains the changes made to wire the newly fine-tuned Hainanese
SenseVoice-Small model into the existing Spring Boot + Vue monorepo. Applies on top
of the previous commit that had only placeholder ASR stubs.

## TL;DR

- `apps/ai-service/app/main.py` is no longer a demo scaffold. It now loads the
  real fine-tuned SenseVoice model and exposes **offline + streaming** recognition
  plus a curated **Mandarin ↔ Hainanese dictionary** endpoint.
- `apps/web` gained a new page `/recognize` (`DialectRecognizerView.vue`) with both
  real-time microphone streaming and offline record / upload flows. Results show
  the simplified-Chinese transcript, the Hainanese character rendering, and the
  Peng'im pinyin — side by side.
- The Java backend (`apps/api`) was **not** touched. Speech payloads go directly
  from the browser to the Python ai-service; the Java side is still responsible
  for auth / text-translation / user data.

## New / modified files

```
Hainandialect_selflearn/
├─ apps/
│  ├─ ai-service/
│  │  ├─ app/
│  │  │  ├─ main.py            # rewritten: real ASR + WS stream + legacy stubs
│  │  │  ├─ asr_engine.py      # NEW: SenseVoice loader + sliding-window stream decoder
│  │  │  └─ hainan_dict.py     # NEW: Mandarin→Hainanese char+pinyin dictionary
│  │  ├─ requirements.txt      # adds torch / funasr / soundfile / pypinyin / tiktoken
│  │  ├─ start.sh              # NEW: one-liner launcher with HAINAN_* env vars
│  │  └─ README.md             # NEW: full service reference
│  └─ web/
│     ├─ src/
│     │  ├─ api/asr.js                       # NEW: offline + WebSocket stream client
│     │  ├─ lib/wav-recorder.js              # NEW: Web-Audio-worklet mic → PCM16/WAV
│     │  ├─ views/DialectRecognizerView.vue  # NEW: the recognition page
│     │  ├─ router/index.js                  # + route `/recognize`
│     │  └─ App.vue                          # + nav link "语音识别"
│     └─ .env.example                        # NEW: documents VITE_AI_SERVICE_URL
└─ INTEGRATION.md                            # this file
```

## How to run the full stack

```bash
# 0) MySQL (only if you use the Java API for auth/history)
docker compose up -d mysql

# 1) Python ai-service — the only thing that needs the trained model
conda activate hainan_asr                 # has torch + funasr
pip install -r apps/ai-service/requirements.txt
npm run dev:ai                            # binds 0.0.0.0:8001

# 2) Java backend (legacy features: learning, user, text-translate)
npm run dev:api                           # binds 0.0.0.0:8080

# 3) Vue frontend
cd apps/web && cp .env.example .env.local
npm run dev                               # binds 0.0.0.0:5173
```

Visit `http://localhost:5173/recognize` to try the new page.

## Environment variables

| Variable | Used by | Default | Purpose |
|---|---|---|---|
| `VITE_API_BASE_URL` | Vue | `http://localhost:8080` | Spring Boot gateway |
| `VITE_AI_SERVICE_URL` | Vue | `http://localhost:8001` | FastAPI ai-service |
| `HAINAN_ASR_MODEL_DIR` | ai-service | auto-discovers `hainan_asr/outputs/...` in the sibling `FunASRfinetune-c` repo | Override ASR model path |
| `HAINAN_ASR_DEVICE` | ai-service | `cpu` | `cpu` / `cuda:0` |
| `HAINAN_PROJECT_ROOT` | ai-service | inferred | Used to resolve the default model dir |

## What the recogniser returns

```json
{
  "mandarin": "葡萄。",
  "hainan_char": "葡萄",
  "hainan_pinyin": "phû-tô",
  "representation_source": "curated",
  "in_dict": true,
  "language_detected": "zh",
  "duration_ms": 1771,
  "inference_ms": 129,
  "raw_token_text": "<|zh|><|NEUTRAL|><|Speech|><|withitn|>葡萄。"
}
```

`representation_source` tells the UI how confident the Hainanese rendering is:
- `curated` — whole string matched a hand-vetted dictionary entry
- `character_compose` — at least one character hit the dictionary; the rest was pasted through
- `mandarin_pinyin_fallback` — nothing in the dictionary; we generated Mandarin
  pinyin as a visual placeholder so the UI still has something to show

The WebSocket stream endpoint yields the same payload with a wrapping
`{"type": "partial"|"final", ...}`.

## Expected quality

Straight from the fine-tune report (`hainan_asr/outputs/final_report.md`):

| Scenario | CER | Exact match |
|---|---|---|
| Known vocabulary (seen during fine-tune) | **0.05–0.09** | **86–90%** |
| Unseen Hainanese words | 0.47 | 36% |
| Continuous-speech long MP3 | poor | — |

Short isolated words work well; long continuous speech is still out of scope until
more data is collected. The UI surfaces the `duration_ms` and `inference_ms` fields
so users can tell when the input is too long and the result becomes unreliable.

## Remote / LAN access

To let others on the same network (or a remote client) use the page:

1. **Bind all interfaces** (already done by default now):
   - `vite.config.js` sets `server.host: "0.0.0.0"` → frontend reachable on LAN.
   - `apps/ai-service/start.sh` defaults `HAINAN_AI_HOST=0.0.0.0` → ai-service reachable.
   - Spring Boot's `application.yml` doesn't set `server.address`, so it also listens
     on `0.0.0.0` by default.

2. **Frontend auto-discovers the ai-service host**: `apps/web/src/api/asr.js` falls
   back to `http://${window.location.hostname}:8001` when `VITE_AI_SERVICE_URL` is
   unset, so a remote browser hitting `http://SERVER_IP:5173/recognize` will also
   post to `http://SERVER_IP:8001`. No extra env-var needed for the simple case.

3. **Firewall**: open TCP ports `5173` (Vite), `8001` (ai-service), and optionally
   `8080` (Spring Boot). Example for ufw:
   ```bash
   sudo ufw allow 5173/tcp
   sudo ufw allow 8001/tcp
   sudo ufw allow 8080/tcp
   ```

4. **Find the server's LAN IP**: `hostname -I | awk '{print $1}'`.

5. **HTTPS + WebSocket**: if the page is served over HTTPS, browsers require the
   WebSocket endpoint to be WSS as well. Put a reverse proxy (nginx/Caddy) in front
   of both services and set `VITE_AI_SERVICE_URL=https://your.domain/ai` in
   `.env.production.local`; the client code rewrites `/v1/asr/stream` to `wss:` for
   you automatically.

### Microphone caveat for non-localhost

The Web Audio APIs (`getUserMedia`) require a **secure context** (HTTPS) for any
origin other than `localhost`/`127.0.0.1`. If you access the page via a raw IP
(`http://192.168.x.y:5173`), Chrome will refuse to grant microphone permission.
Options:

- Run the app behind HTTPS via a reverse proxy (recommended for anything beyond
  a single-machine demo).
- In Chrome flags, add the IP to
  `chrome://flags/#unsafely-treat-insecure-origin-as-secure` and restart.
- Use an SSH tunnel: `ssh -L 5173:localhost:5173 -L 8001:localhost:8001 user@host`
  and open `http://localhost:5173` — localhost stays a secure context.

## Extending the Hainanese dictionary

Edit the `_SEED` table in `apps/ai-service/app/hainan_dict.py`. Keys are simplified
Mandarin phrases; values are `(hainan_char, hainan_pinyin)` tuples. Changes take
effect on ai-service restart.

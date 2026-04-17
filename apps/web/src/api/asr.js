// ASR API client for the FastAPI ai-service.
// This deliberately talks to the AI service directly (separate origin) rather than
// routing through the Spring Boot gateway. Speech payloads are audio blobs — relaying
// them through the Java layer adds latency and needs multipart+memory handling for no
// win here. Swap to a gateway later if auth/ACL ever become real requirements.

// Resolves the AI service base URL in this order:
//  1. VITE_AI_SERVICE_URL env var (recommended in production)
//  2. Same host the page is served from, port 8001 (works for LAN/remote access
//     without any env configuration — as long as the ai-service binds 0.0.0.0)
//  3. Hard-coded localhost:8001 fallback (last resort, SSR or file:// contexts)
function resolveAiServiceUrl() {
  const fromEnv = import.meta.env.VITE_AI_SERVICE_URL;
  if (fromEnv) return String(fromEnv).replace(/\/$/, "");
  if (typeof window !== "undefined" && window.location?.hostname) {
    const host = window.location.hostname;
    // page is https → the ai-service reverse-proxy should also be https; in that
    // case set VITE_AI_SERVICE_URL explicitly. For plain dev we assume http.
    const proto = window.location.protocol === "https:" ? "https:" : "http:";
    return `${proto}//${host}:8001`;
  }
  return "http://localhost:8001";
}

export const AI_SERVICE_URL = resolveAiServiceUrl();

function wsUrl(path) {
  // Convert http(s) → ws(s) preserving host/port.
  const url = new URL(path, AI_SERVICE_URL);
  url.protocol = url.protocol === "https:" ? "wss:" : "ws:";
  return url.toString();
}

export async function checkAiServiceHealth() {
  const r = await fetch(`${AI_SERVICE_URL}/health`);
  if (!r.ok) throw new Error(`ai-service /health ${r.status}`);
  return r.json();
}

export async function fetchVocab() {
  const r = await fetch(`${AI_SERVICE_URL}/v1/vocab`);
  if (!r.ok) throw new Error(`ai-service /v1/vocab ${r.status}`);
  return r.json();
}

/** Offline recognition via multipart upload. Returns the enriched result. */
export async function recognizeOffline(blob, { language = "auto" } = {}) {
  const fd = new FormData();
  const filename = `upload_${Date.now()}.${blob.type?.includes("webm") ? "webm" : "wav"}`;
  fd.append("audio", blob, filename);
  const url = `${AI_SERVICE_URL}/v1/asr/offline?language=${encodeURIComponent(language)}`;
  const r = await fetch(url, { method: "POST", body: fd });
  if (!r.ok) {
    let msg;
    try {
      msg = (await r.json())?.detail;
    } catch {
      msg = await r.text();
    }
    throw new Error(msg || `ASR failed (${r.status})`);
  }
  return r.json();
}

/**
 * Open a streaming-ASR WebSocket. Returns an object with `sendPCM(int16Array)`,
 * `sendEOS()`, `close()`, and an EventTarget interface.
 */
export function openStreamSocket({ sampleRate = 16000, language = "auto" } = {}) {
  const ws = new WebSocket(wsUrl("/v1/asr/stream"));
  const events = new EventTarget();
  let opened = false;

  ws.binaryType = "arraybuffer";
  ws.addEventListener("open", () => {
    opened = true;
    ws.send(JSON.stringify({ sample_rate: sampleRate, language }));
    events.dispatchEvent(new CustomEvent("open"));
  });
  ws.addEventListener("message", (ev) => {
    try {
      const data = JSON.parse(ev.data);
      events.dispatchEvent(new CustomEvent(data.type || "message", { detail: data }));
    } catch {
      // ignore malformed frames
    }
  });
  ws.addEventListener("error", (ev) => {
    events.dispatchEvent(new CustomEvent("error", { detail: ev }));
  });
  ws.addEventListener("close", (ev) => {
    events.dispatchEvent(new CustomEvent("close", { detail: ev }));
  });

  return {
    events,
    isOpen: () => ws.readyState === WebSocket.OPEN,
    sendPCM(int16) {
      if (ws.readyState === WebSocket.OPEN) {
        ws.send(int16.buffer.slice(int16.byteOffset, int16.byteOffset + int16.byteLength));
      }
    },
    sendEOS() {
      if (ws.readyState === WebSocket.OPEN) {
        ws.send(JSON.stringify({ event: "eos" }));
      }
    },
    close() {
      try { ws.close(); } catch {}
    },
    _waitOpen: () =>
      new Promise((resolve, reject) => {
        if (opened) return resolve();
        ws.addEventListener("open", () => resolve(), { once: true });
        ws.addEventListener("error", (e) => reject(e), { once: true });
      }),
  };
}

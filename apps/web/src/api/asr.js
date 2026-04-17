// ASR API client for the FastAPI ai-service.
// This deliberately talks to the AI service directly (separate origin) rather than
// routing through the Spring Boot gateway. Speech payloads are audio blobs — relaying
// them through the Java layer adds latency and needs multipart+memory handling for no
// win here. Swap to a gateway later if auth/ACL ever become real requirements.

// Resolves the AI service base URL in this order:
//   1. VITE_AI_SERVICE_URL env var — use when the service lives on a different
//      origin than the page (e.g. cross-origin dev setup without Vite proxy).
//   2. Same-origin, prefixed `/ai` — the default that works with the Vite dev
//      server's built-in proxy and with a production reverse proxy that routes
//      `/ai/*` to the FastAPI service.
function resolveAiServiceUrl() {
  const fromEnv = import.meta.env.VITE_AI_SERVICE_URL;
  if (fromEnv) return String(fromEnv).replace(/\/$/, "");
  if (typeof window !== "undefined" && window.location?.origin) {
    return window.location.origin + "/ai";
  }
  return "/ai";
}

export const AI_SERVICE_URL = resolveAiServiceUrl();

function wsUrl(path) {
  // Concatenate (don't use `new URL(path, base)` — absolute paths would strip
  // the `/ai` mount prefix). Convert http(s) → ws(s) preserving host/port.
  let base = AI_SERVICE_URL;
  if (!/^https?:/i.test(base) && typeof window !== "undefined") {
    base = window.location.origin + (base.startsWith("/") ? base : "/" + base);
  }
  const full = base.replace(/\/$/, "") + path;
  return full.replace(/^http(s?):/i, (_m, s) => "ws" + s + ":");
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

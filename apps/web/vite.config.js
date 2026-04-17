import { defineConfig } from "vite";
import vue from "@vitejs/plugin-vue";

// Vite dev server also acts as a reverse-proxy for the two backend services so
// deployments only need to point a single port (5173) behind a CDN / nginx.
//
//   GET  /api/*           -> Spring Boot gateway on :8080
//   *    /ai/*            -> FastAPI ai-service on :8001 (WebSocket for streaming)
//   GET  /*               -> served by Vite itself (SPA + HMR)
//
// This lets the frontend call same-origin URLs like `/api/v1/translate` and
// `/ai/v1/asr/offline`, so VITE_API_BASE_URL / VITE_AI_SERVICE_URL can stay
// empty in `.env.local`.

const SPRING_BOOT = process.env.VITE_PROXY_API ?? "http://127.0.0.1:8080";
const FASTAPI_AI = process.env.VITE_PROXY_AI ?? "http://127.0.0.1:8001";

export default defineConfig({
  plugins: [vue()],
  server: {
    host: "0.0.0.0",
    port: 5173,
    strictPort: false,
    // Vite 5.x blocks requests with unknown Host headers (DNS rebinding guard).
    // List hostnames / wildcards that can reach this dev server.
    allowedHosts: [
      "localhost",
      ".localhost",
      ".mubai.website",
      "hnnu.mubai.website",
      ...(process.env.VITE_ALLOWED_HOSTS?.split(",").map((s) => s.trim()).filter(Boolean) ?? []),
    ],
    proxy: {
      // Spring Boot — pass the full path through unchanged.
      "/api": {
        target: SPRING_BOOT,
        changeOrigin: true,
      },
      // FastAPI — strip the leading `/ai` so upstream sees `/health`, `/v1/...`.
      "/ai": {
        target: FASTAPI_AI,
        changeOrigin: true,
        ws: true,        // required for /ai/v1/asr/stream WebSocket
        rewrite: (path) => path.replace(/^\/ai/, ""),
      },
    },
  },
});

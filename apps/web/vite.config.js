import { defineConfig } from "vite";
import vue from "@vitejs/plugin-vue";

export default defineConfig({
  plugins: [vue()],
  server: {
    host: "0.0.0.0",   // listen on all interfaces so LAN/remote clients can reach the dev server
    port: 5173,
    strictPort: false,
  },
});

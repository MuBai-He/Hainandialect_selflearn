import { clearSession, getAuthHeader } from "../lib/session";

// Default to same-origin so the Vite dev-server proxy (or a production reverse
// proxy) can route `/api/*` to the Spring Boot gateway. Override with
// VITE_API_BASE_URL="http://foo:8080" when calling a different origin.
export const API_BASE_URL = (import.meta.env.VITE_API_BASE_URL ?? "").replace(/\/$/, "");

export async function apiRequest(path, options = {}) {
  const {
    method = "GET",
    body,
    auth = false,
    headers = {},
  } = options;

  const response = await fetch(`${API_BASE_URL}${path}`, {
    method,
    headers: {
      "Content-Type": "application/json",
      ...(auth ? getAuthHeader() : {}),
      ...headers,
    },
    body: body ? JSON.stringify(body) : undefined,
  });

  let payload = null;
  try {
    payload = await response.json();
  } catch {
    payload = null;
  }

  if (!response.ok || (payload && payload.code !== 0)) {
    const message =
      payload?.message || `请求失败，状态码 ${response.status}`;
    if (response.status === 401 || payload?.code === 4003) {
      clearSession();
    }
    throw new Error(message);
  }

  return payload?.data ?? null;
}

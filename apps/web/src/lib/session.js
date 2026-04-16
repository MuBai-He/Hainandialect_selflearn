import { reactive } from "vue";

const STORAGE_KEY = "hainan-dialect-web-session";

function loadStoredSession() {
  try {
    const raw = window.localStorage.getItem(STORAGE_KEY);
    return raw ? JSON.parse(raw) : {};
  } catch {
    return {};
  }
}

const stored = loadStoredSession();

export const sessionState = reactive({
  token: stored.token ?? "",
  user: stored.user ?? null,
});

function persist() {
  window.localStorage.setItem(
    STORAGE_KEY,
    JSON.stringify({
      token: sessionState.token,
      user: sessionState.user,
    }),
  );
}

export function setSession(payload) {
  sessionState.token = payload.token;
  sessionState.user = payload.user;
  persist();
}

export function clearSession() {
  sessionState.token = "";
  sessionState.user = null;
  window.localStorage.removeItem(STORAGE_KEY);
}

export function getAuthHeader() {
  return sessionState.token
    ? {
        Authorization: `Bearer ${sessionState.token}`,
      }
    : {};
}

export function isAuthenticated() {
  return Boolean(sessionState.token);
}

import { apiRequest } from "./client";

export function translateText(payload, authenticated = false) {
  return apiRequest("/api/v1/translate", {
    method: "POST",
    body: payload,
    auth: authenticated,
  });
}

export function fetchTranslationHistory(page = 0, size = 10) {
  return apiRequest(`/api/v1/translate/history?page=${page}&size=${size}`, {
    auth: true,
  });
}

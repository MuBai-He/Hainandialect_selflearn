import { apiRequest } from "./client";

export function fetchDictionaryEntries({ q = "", page = 0, size = 24 } = {}) {
  const params = new URLSearchParams();
  if (q) params.set("q", q);
  params.set("page", String(page));
  params.set("size", String(size));
  return apiRequest(`/api/v1/dictionary/entries?${params.toString()}`);
}

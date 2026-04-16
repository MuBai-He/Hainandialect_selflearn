import { apiRequest } from "./client";

export function login(payload) {
  return apiRequest("/api/v1/auth/login", {
    method: "POST",
    body: payload,
  });
}

export function register(payload) {
  return apiRequest("/api/v1/auth/register", {
    method: "POST",
    body: payload,
  });
}

export function logout() {
  return apiRequest("/api/v1/auth/logout", {
    method: "POST",
    auth: true,
  });
}

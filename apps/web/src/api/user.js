import { apiRequest } from "./client";

export function fetchCurrentUser() {
  return apiRequest("/api/v1/users/me", {
    auth: true,
  });
}

export function fetchLearningProgress() {
  return apiRequest("/api/v1/users/me/progress", {
    auth: true,
  });
}

export function fetchFavorites(favoriteType = "") {
  const query = favoriteType
    ? `?favoriteType=${encodeURIComponent(favoriteType)}`
    : "";
  return apiRequest(`/api/v1/users/me/favorites${query}`, {
    auth: true,
  });
}

export function addFavorite(payload) {
  return apiRequest("/api/v1/favorites", {
    method: "POST",
    auth: true,
    body: payload,
  });
}

export function deleteFavorite(favoriteId) {
  return apiRequest(`/api/v1/favorites/${favoriteId}`, {
    method: "DELETE",
    auth: true,
  });
}

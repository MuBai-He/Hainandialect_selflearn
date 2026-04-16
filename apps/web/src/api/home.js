import { apiRequest } from "./client";

export function fetchHomeOverview() {
  return apiRequest("/api/v1/home/overview");
}

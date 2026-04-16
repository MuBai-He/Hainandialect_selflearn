import { apiRequest } from "./client";

export function fetchAudioSamples() {
  return apiRequest("/api/v1/audio/samples");
}

export function fetchAudioSampleDetail(sampleId) {
  return apiRequest(`/api/v1/audio/samples/${sampleId}`);
}

export function recognizeAudioSample(sampleId, authenticated = false) {
  return apiRequest(`/api/v1/audio/samples/${sampleId}/recognize`, {
    method: "POST",
    auth: authenticated,
  });
}

export function fetchAudioRecognitionHistory(page = 0, size = 10) {
  return apiRequest(`/api/v1/audio/recognitions/history?page=${page}&size=${size}`, {
    auth: true,
  });
}

import { apiRequest } from "./client";

export function fetchLearningModules(authenticated = false) {
  return apiRequest("/api/v1/learning/modules", {
    auth: authenticated,
  });
}

export function fetchLearningModuleDetail(moduleId, authenticated = false) {
  return apiRequest(`/api/v1/learning/modules/${moduleId}`, {
    auth: authenticated,
  });
}

export function fetchLessonDetail(lessonId, authenticated = false) {
  return apiRequest(`/api/v1/learning/lessons/${lessonId}`, {
    auth: authenticated,
  });
}

export function completeLesson(lessonId) {
  return apiRequest(`/api/v1/learning/lessons/${lessonId}/complete`, {
    method: "POST",
    auth: true,
    body: {
      status: "completed",
    },
  });
}

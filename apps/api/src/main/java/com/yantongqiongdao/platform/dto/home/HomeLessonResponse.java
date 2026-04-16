package com.yantongqiongdao.platform.dto.home;

public record HomeLessonResponse(
        Long id,
        Long moduleId,
        String title,
        String summary,
        Integer estimatedMinutes
) {
}

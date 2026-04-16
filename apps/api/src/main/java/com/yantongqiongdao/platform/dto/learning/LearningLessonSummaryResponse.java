package com.yantongqiongdao.platform.dto.learning;

public record LearningLessonSummaryResponse(
        Long id,
        String title,
        String summary,
        String difficulty,
        Integer estimatedMinutes,
        String status
) {
}

package com.yantongqiongdao.platform.dto.learning;

public record LearningModuleSummaryResponse(
        Long id,
        String title,
        String description,
        String level,
        long lessonCount,
        long completedLessonCount
) {
}

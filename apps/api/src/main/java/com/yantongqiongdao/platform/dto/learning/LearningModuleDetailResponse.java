package com.yantongqiongdao.platform.dto.learning;

import java.util.List;

public record LearningModuleDetailResponse(
        Long id,
        String title,
        String description,
        String level,
        List<LearningLessonSummaryResponse> lessons
) {
}

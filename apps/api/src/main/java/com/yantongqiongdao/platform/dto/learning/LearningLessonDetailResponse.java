package com.yantongqiongdao.platform.dto.learning;

import java.util.List;

public record LearningLessonDetailResponse(
        Long id,
        Long moduleId,
        String title,
        String summary,
        String difficulty,
        Integer estimatedMinutes,
        String status,
        List<LessonTermResponse> terms,
        List<LessonSentenceResponse> sentences
) {
}

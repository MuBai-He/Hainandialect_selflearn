package com.yantongqiongdao.platform.dto.learning;

public record LessonSentenceResponse(
        Long id,
        String mandarinText,
        String hainanText,
        String meaningNote
) {
}

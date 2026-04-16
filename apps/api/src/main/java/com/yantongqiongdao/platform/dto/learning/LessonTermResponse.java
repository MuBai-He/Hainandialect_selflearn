package com.yantongqiongdao.platform.dto.learning;

public record LessonTermResponse(
        Long id,
        String mandarinText,
        String hainanText,
        String pinyinNote,
        String meaningNote
) {
}

package com.yantongqiongdao.platform.dto.learning;

import java.time.LocalDateTime;

public record RecentLessonResponse(
        Long lessonId,
        String lessonTitle,
        String status,
        LocalDateTime updatedAt
) {
}

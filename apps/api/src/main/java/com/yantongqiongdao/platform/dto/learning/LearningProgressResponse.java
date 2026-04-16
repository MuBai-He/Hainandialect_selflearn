package com.yantongqiongdao.platform.dto.learning;

import java.util.List;

public record LearningProgressResponse(
        long completedLessons,
        long inProgressLessons,
        List<RecentLessonResponse> recentLessons
) {
}

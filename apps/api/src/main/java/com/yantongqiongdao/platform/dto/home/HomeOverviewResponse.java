package com.yantongqiongdao.platform.dto.home;

import java.util.List;

public record HomeOverviewResponse(
        BannerResponse banner,
        List<HomeModuleResponse> recommendedModules,
        List<HomeLessonResponse> recommendedLessons,
        List<CommonPhraseResponse> commonPhrases
) {
}

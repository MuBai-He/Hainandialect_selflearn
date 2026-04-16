package com.yantongqiongdao.platform.dto.translate;

import java.time.LocalDateTime;

public record TranslationHistoryItemResponse(
        Long id,
        String sourceLang,
        String targetLang,
        String sourceText,
        String targetText,
        LocalDateTime createdAt
) {
}

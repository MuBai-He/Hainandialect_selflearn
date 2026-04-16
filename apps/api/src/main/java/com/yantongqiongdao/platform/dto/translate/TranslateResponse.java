package com.yantongqiongdao.platform.dto.translate;

public record TranslateResponse(
        Long recordId,
        String sourceLang,
        String targetLang,
        String sourceText,
        String targetText,
        String note
) {
}

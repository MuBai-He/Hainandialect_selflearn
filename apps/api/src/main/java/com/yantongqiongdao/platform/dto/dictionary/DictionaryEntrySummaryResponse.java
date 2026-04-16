package com.yantongqiongdao.platform.dto.dictionary;

public record DictionaryEntrySummaryResponse(
        Long id,
        String sampleKey,
        String pronunciation,
        String fileName,
        String mandarinText,
        String audioUrl
) {
}

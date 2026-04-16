package com.yantongqiongdao.platform.dto.dictionary;

import java.util.List;

public record DictionaryEntriesResponse(
        long total,
        int page,
        int size,
        List<String> hotTerms,
        List<DictionaryEntrySummaryResponse> items
) {
}

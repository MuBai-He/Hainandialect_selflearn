package com.yantongqiongdao.platform.dto.translate;

import java.util.List;

public record TranslationHistoryResponse(
        long total,
        List<TranslationHistoryItemResponse> items
) {
}

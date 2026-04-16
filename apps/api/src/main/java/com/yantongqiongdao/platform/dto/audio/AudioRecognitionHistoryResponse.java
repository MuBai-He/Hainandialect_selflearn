package com.yantongqiongdao.platform.dto.audio;

import java.util.List;

public record AudioRecognitionHistoryResponse(
        long total,
        List<AudioRecognitionHistoryItemResponse> items
) {
}

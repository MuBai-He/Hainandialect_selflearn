package com.yantongqiongdao.platform.dto.audio;

import java.time.LocalDateTime;

public record AudioRecognitionHistoryItemResponse(
        Long recordId,
        Long sampleId,
        String sampleKey,
        String fileName,
        String recognizedText,
        String translatedText,
        double confidence,
        String engine,
        LocalDateTime createdAt
) {
}

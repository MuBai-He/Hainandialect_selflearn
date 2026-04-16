package com.yantongqiongdao.platform.dto.audio;

import java.time.LocalDateTime;

public record AudioRecognitionResponse(
        Long recordId,
        Long sampleId,
        String sampleKey,
        String fileName,
        String audioUrl,
        String recognizedText,
        String translatedText,
        double confidence,
        String engine,
        String note,
        LocalDateTime createdAt
) {
}

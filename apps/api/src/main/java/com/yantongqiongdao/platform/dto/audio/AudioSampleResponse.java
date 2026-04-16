package com.yantongqiongdao.platform.dto.audio;

public record AudioSampleResponse(
        Long id,
        String sampleKey,
        String fileName,
        String audioUrl,
        String transcriptText,
        String translatedText
) {
}

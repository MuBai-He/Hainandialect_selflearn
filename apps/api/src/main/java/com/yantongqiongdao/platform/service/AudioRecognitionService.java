package com.yantongqiongdao.platform.service;

import com.yantongqiongdao.platform.common.ApiException;
import com.yantongqiongdao.platform.domain.entity.AudioRecognitionRecord;
import com.yantongqiongdao.platform.domain.entity.AudioSample;
import com.yantongqiongdao.platform.domain.entity.UserAccount;
import com.yantongqiongdao.platform.dto.audio.AudioRecognitionHistoryItemResponse;
import com.yantongqiongdao.platform.dto.audio.AudioRecognitionHistoryResponse;
import com.yantongqiongdao.platform.dto.audio.AudioRecognitionResponse;
import com.yantongqiongdao.platform.repository.AudioRecognitionRecordRepository;
import com.yantongqiongdao.platform.repository.AudioSampleRepository;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

@Service
public class AudioRecognitionService {

    private static final BigDecimal DEMO_CONFIDENCE = new BigDecimal("0.9800");
    private static final String DEMO_ENGINE = "demo_dataset_lookup";

    private final AudioSampleRepository audioSampleRepository;
    private final AudioRecognitionRecordRepository audioRecognitionRecordRepository;
    private final String audioPublicBaseUrl;

    public AudioRecognitionService(
            AudioSampleRepository audioSampleRepository,
            AudioRecognitionRecordRepository audioRecognitionRecordRepository,
            @Value("${audio.public-base-url:http://localhost:8080/media/audio/}") String audioPublicBaseUrl
    ) {
        this.audioSampleRepository = audioSampleRepository;
        this.audioRecognitionRecordRepository = audioRecognitionRecordRepository;
        this.audioPublicBaseUrl = audioPublicBaseUrl.endsWith("/")
                ? audioPublicBaseUrl
                : audioPublicBaseUrl + "/";
    }

    public AudioRecognitionResponse recognizeSample(Optional<UserAccount> currentUser, Long sampleId) {
        AudioSample sample = audioSampleRepository.findById(sampleId)
                .orElseThrow(() -> new ApiException(4004, "音频样本不存在", HttpStatus.NOT_FOUND));

        String translatedText = sample.getTranslatedText() == null || sample.getTranslatedText().isBlank()
                ? sample.getTranscriptText()
                : sample.getTranslatedText();

        AudioRecognitionRecord record = new AudioRecognitionRecord();
        record.setUserId(currentUser.map(UserAccount::getId).orElse(null));
        record.setSampleId(sample.getId());
        record.setSampleKey(sample.getSampleKey());
        record.setFileName(sample.getFileName());
        record.setRecognizedText(sample.getTranscriptText());
        record.setTranslatedText(translatedText);
        record.setEngine(DEMO_ENGINE);
        record.setConfidence(DEMO_CONFIDENCE);
        AudioRecognitionRecord savedRecord = audioRecognitionRecordRepository.save(record);

        return new AudioRecognitionResponse(
                savedRecord.getId(),
                sample.getId(),
                sample.getSampleKey(),
                sample.getFileName(),
                audioPublicBaseUrl + sample.getFileName(),
                savedRecord.getRecognizedText(),
                savedRecord.getTranslatedText(),
                savedRecord.getConfidence().setScale(4, RoundingMode.HALF_UP).doubleValue(),
                savedRecord.getEngine(),
                "当前为样本音频识别演示版，结果直接来自已标注数据集，可用于完整展示链路。",
                savedRecord.getCreatedAt()
        );
    }

    public AudioRecognitionHistoryResponse getHistory(UserAccount user, int page, int size) {
        int safePage = Math.max(page, 0);
        int safeSize = Math.min(Math.max(size, 1), 50);
        Page<AudioRecognitionRecord> resultPage = audioRecognitionRecordRepository.findByUserIdOrderByCreatedAtDesc(
                user.getId(),
                PageRequest.of(safePage, safeSize)
        );

        return new AudioRecognitionHistoryResponse(
                resultPage.getTotalElements(),
                resultPage.getContent().stream()
                        .map(record -> new AudioRecognitionHistoryItemResponse(
                                record.getId(),
                                record.getSampleId(),
                                record.getSampleKey(),
                                record.getFileName(),
                                record.getRecognizedText(),
                                record.getTranslatedText(),
                                record.getConfidence().setScale(4, RoundingMode.HALF_UP).doubleValue(),
                                record.getEngine(),
                                record.getCreatedAt()
                        ))
                        .toList()
        );
    }
}

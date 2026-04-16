package com.yantongqiongdao.platform.service;

import com.yantongqiongdao.platform.common.ApiException;
import com.yantongqiongdao.platform.domain.entity.AudioSample;
import com.yantongqiongdao.platform.dto.audio.AudioSampleResponse;
import com.yantongqiongdao.platform.repository.AudioSampleRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

@Service
public class AudioSampleService {

    private final AudioSampleRepository audioSampleRepository;
    private final String audioPublicBaseUrl;

    public AudioSampleService(
            AudioSampleRepository audioSampleRepository,
            @Value("${audio.public-base-url:http://localhost:8080/media/audio/}") String audioPublicBaseUrl
    ) {
        this.audioSampleRepository = audioSampleRepository;
        this.audioPublicBaseUrl = audioPublicBaseUrl.endsWith("/")
                ? audioPublicBaseUrl
                : audioPublicBaseUrl + "/";
    }

    public List<AudioSampleResponse> getSamples() {
        return audioSampleRepository.findTop50ByOrderByIdAsc()
                .stream()
                .map(this::toResponse)
                .toList();
    }

    public AudioSampleResponse getSampleDetail(Long sampleId) {
        AudioSample sample = audioSampleRepository.findById(sampleId)
                .orElseThrow(() -> new ApiException(4004, "音频样本不存在", HttpStatus.NOT_FOUND));
        return toResponse(sample);
    }

    private AudioSampleResponse toResponse(AudioSample sample) {
        return new AudioSampleResponse(
                sample.getId(),
                sample.getSampleKey(),
                sample.getFileName(),
                audioPublicBaseUrl + sample.getFileName(),
                sample.getTranscriptText(),
                sample.getTranslatedText()
        );
    }
}

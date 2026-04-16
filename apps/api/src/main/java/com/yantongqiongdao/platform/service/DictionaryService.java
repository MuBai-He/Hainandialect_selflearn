package com.yantongqiongdao.platform.service;

import com.yantongqiongdao.platform.domain.entity.AudioSample;
import com.yantongqiongdao.platform.dto.dictionary.DictionaryEntriesResponse;
import com.yantongqiongdao.platform.dto.dictionary.DictionaryEntrySummaryResponse;
import com.yantongqiongdao.platform.repository.AudioSampleRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

@Service
public class DictionaryService {

    private final AudioSampleRepository audioSampleRepository;
    private final String audioPublicBaseUrl;

    public DictionaryService(
            AudioSampleRepository audioSampleRepository,
            @Value("${audio.public-base-url:http://localhost:8080/media/audio/}") String audioPublicBaseUrl
    ) {
        this.audioSampleRepository = audioSampleRepository;
        this.audioPublicBaseUrl = audioPublicBaseUrl.endsWith("/")
                ? audioPublicBaseUrl
                : audioPublicBaseUrl + "/";
    }

    public DictionaryEntriesResponse getEntries(String query, int page, int size) {
        int safePage = Math.max(page, 0);
        int safeSize = Math.min(Math.max(size, 1), 60);
        PageRequest pageRequest = PageRequest.of(safePage, safeSize, Sort.by(Sort.Direction.ASC, "id"));

        Page<AudioSample> resultPage;
        String trimmedQuery = query == null ? "" : query.trim();
        if (trimmedQuery.isEmpty()) {
            resultPage = audioSampleRepository.findAll(pageRequest);
        } else {
            resultPage = audioSampleRepository
                    .findByTranscriptTextContainingIgnoreCaseOrTranslatedTextContainingIgnoreCaseOrSampleKeyContainingIgnoreCaseOrFileNameContainingIgnoreCaseOrderByIdAsc(
                            trimmedQuery,
                            trimmedQuery,
                            trimmedQuery,
                            trimmedQuery,
                            pageRequest
                    );
        }

        List<String> hotTerms = audioSampleRepository.findTop50ByOrderByIdAsc().stream()
                .map(this::displayText)
                .filter(term -> term != null && !term.isBlank())
                .distinct()
                .limit(8)
                .toList();

        return new DictionaryEntriesResponse(
                resultPage.getTotalElements(),
                safePage,
                safeSize,
                hotTerms,
                resultPage.getContent().stream().map(this::toSummary).toList()
        );
    }

    private DictionaryEntrySummaryResponse toSummary(AudioSample sample) {
        return new DictionaryEntrySummaryResponse(
                sample.getId(),
                sample.getSampleKey(),
                formatPronunciation(sample.getSampleKey()),
                sample.getFileName(),
                displayText(sample),
                audioPublicBaseUrl + sample.getFileName()
        );
    }

    private String displayText(AudioSample sample) {
        String translated = translatedText(sample);
        return translated == null || translated.isBlank() ? sample.getTranscriptText() : translated;
    }

    private String translatedText(AudioSample sample) {
        return sample.getTranslatedText() == null || sample.getTranslatedText().isBlank()
                ? sample.getTranscriptText()
                : sample.getTranslatedText();
    }

    private String formatPronunciation(String sampleKey) {
        if (sampleKey == null || sampleKey.isBlank()) {
            return "";
        }

        return sampleKey
                .replaceFirst("^\\d+[_-]?", "")
                .replace('_', ' ')
                .replace('-', ' ')
                .trim();
    }
}

package com.yantongqiongdao.platform.repository;

import com.yantongqiongdao.platform.domain.entity.AudioSample;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AudioSampleRepository extends JpaRepository<AudioSample, Long> {

    List<AudioSample> findTop50ByOrderByIdAsc();

    Page<AudioSample> findByTranscriptTextContainingIgnoreCaseOrTranslatedTextContainingIgnoreCaseOrSampleKeyContainingIgnoreCaseOrFileNameContainingIgnoreCaseOrderByIdAsc(
            String transcriptText,
            String translatedText,
            String sampleKey,
            String fileName,
            Pageable pageable
    );
}

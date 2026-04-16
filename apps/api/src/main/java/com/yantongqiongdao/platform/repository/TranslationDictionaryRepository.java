package com.yantongqiongdao.platform.repository;

import com.yantongqiongdao.platform.domain.entity.TranslationDictionaryEntry;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TranslationDictionaryRepository extends JpaRepository<TranslationDictionaryEntry, Long> {

    Optional<TranslationDictionaryEntry> findTopBySourceLangAndTargetLangAndSourceTextOrderByIdAsc(
            String sourceLang,
            String targetLang,
            String sourceText
    );

    List<TranslationDictionaryEntry> findTop5BySourceLangAndTargetLangOrderByIdAsc(String sourceLang, String targetLang);
}

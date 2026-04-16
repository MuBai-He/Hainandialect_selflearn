package com.yantongqiongdao.platform.service;

import com.yantongqiongdao.platform.common.ApiException;
import com.yantongqiongdao.platform.domain.entity.TranslationDictionaryEntry;
import com.yantongqiongdao.platform.domain.entity.TranslationRecord;
import com.yantongqiongdao.platform.domain.entity.UserAccount;
import com.yantongqiongdao.platform.dto.translate.TranslateRequest;
import com.yantongqiongdao.platform.dto.translate.TranslateResponse;
import com.yantongqiongdao.platform.dto.translate.TranslationHistoryItemResponse;
import com.yantongqiongdao.platform.dto.translate.TranslationHistoryResponse;
import com.yantongqiongdao.platform.repository.TranslationDictionaryRepository;
import com.yantongqiongdao.platform.repository.TranslationRecordRepository;
import java.util.Optional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

@Service
public class TranslationService {

    private final TranslationDictionaryRepository translationDictionaryRepository;
    private final TranslationRecordRepository translationRecordRepository;

    public TranslationService(
            TranslationDictionaryRepository translationDictionaryRepository,
            TranslationRecordRepository translationRecordRepository
    ) {
        this.translationDictionaryRepository = translationDictionaryRepository;
        this.translationRecordRepository = translationRecordRepository;
    }

    public TranslateResponse translate(Optional<UserAccount> currentUser, TranslateRequest request) {
        if (request.sourceLang().equalsIgnoreCase(request.targetLang())) {
            throw new ApiException(4001, "源语言和目标语言不能相同", HttpStatus.BAD_REQUEST);
        }

        Optional<TranslationDictionaryEntry> matchedEntry = translationDictionaryRepository
                .findTopBySourceLangAndTargetLangAndSourceTextOrderByIdAsc(
                        request.sourceLang().trim(),
                        request.targetLang().trim(),
                        request.text().trim()
                );

        String targetText = matchedEntry
                .map(TranslationDictionaryEntry::getTargetText)
                .orElse("[暂未收录] " + request.text().trim());
        String note = matchedEntry
                .map(entry -> entry.getNote() == null ? "结果仅供参考" : entry.getNote())
                .orElse("当前词库暂未收录该表达，返回占位结果，仅供参考");

        TranslationRecord record = new TranslationRecord();
        record.setUserId(currentUser.map(UserAccount::getId).orElse(null));
        record.setSourceLang(request.sourceLang().trim());
        record.setTargetLang(request.targetLang().trim());
        record.setSourceText(request.text().trim());
        record.setTargetText(targetText);
        TranslationRecord savedRecord = translationRecordRepository.save(record);

        return new TranslateResponse(
                savedRecord.getId(),
                savedRecord.getSourceLang(),
                savedRecord.getTargetLang(),
                savedRecord.getSourceText(),
                savedRecord.getTargetText(),
                note
        );
    }

    public TranslationHistoryResponse getHistory(UserAccount user, int page, int size) {
        int safePage = Math.max(page, 0);
        int safeSize = Math.min(Math.max(size, 1), 50);
        Page<TranslationRecord> resultPage = translationRecordRepository.findByUserIdOrderByCreatedAtDesc(
                user.getId(),
                PageRequest.of(safePage, safeSize)
        );

        return new TranslationHistoryResponse(
                resultPage.getTotalElements(),
                resultPage.getContent().stream()
                        .map(record -> new TranslationHistoryItemResponse(
                                record.getId(),
                                record.getSourceLang(),
                                record.getTargetLang(),
                                record.getSourceText(),
                                record.getTargetText(),
                                record.getCreatedAt()
                        ))
                        .toList()
        );
    }
}

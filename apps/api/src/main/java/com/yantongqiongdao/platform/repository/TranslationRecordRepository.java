package com.yantongqiongdao.platform.repository;

import com.yantongqiongdao.platform.domain.entity.TranslationRecord;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TranslationRecordRepository extends JpaRepository<TranslationRecord, Long> {

    Page<TranslationRecord> findByUserIdOrderByCreatedAtDesc(Long userId, Pageable pageable);
}

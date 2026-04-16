package com.yantongqiongdao.platform.repository;

import com.yantongqiongdao.platform.domain.entity.AudioRecognitionRecord;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AudioRecognitionRecordRepository extends JpaRepository<AudioRecognitionRecord, Long> {

    Page<AudioRecognitionRecord> findByUserIdOrderByCreatedAtDesc(Long userId, Pageable pageable);
}

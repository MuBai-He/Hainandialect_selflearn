package com.yantongqiongdao.platform.repository;

import com.yantongqiongdao.platform.domain.entity.LessonSentence;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LessonSentenceRepository extends JpaRepository<LessonSentence, Long> {

    List<LessonSentence> findByLessonIdOrderBySortOrderAsc(Long lessonId);
}

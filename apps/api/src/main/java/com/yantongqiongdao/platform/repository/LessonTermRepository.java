package com.yantongqiongdao.platform.repository;

import com.yantongqiongdao.platform.domain.entity.LessonTerm;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LessonTermRepository extends JpaRepository<LessonTerm, Long> {

    List<LessonTerm> findByLessonIdOrderBySortOrderAsc(Long lessonId);
}

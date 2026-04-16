package com.yantongqiongdao.platform.repository;

import com.yantongqiongdao.platform.domain.entity.LearningLesson;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LearningLessonRepository extends JpaRepository<LearningLesson, Long> {

    List<LearningLesson> findByModuleIdAndStatusOrderBySortOrderAsc(Long moduleId, String status);

    List<LearningLesson> findTop5ByStatusOrderBySortOrderAsc(String status);

    long countByModuleIdAndStatus(Long moduleId, String status);
}

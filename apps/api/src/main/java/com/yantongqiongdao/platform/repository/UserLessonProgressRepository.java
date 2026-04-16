package com.yantongqiongdao.platform.repository;

import com.yantongqiongdao.platform.domain.entity.UserLessonProgress;
import java.util.Collection;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserLessonProgressRepository extends JpaRepository<UserLessonProgress, Long> {

    Optional<UserLessonProgress> findByUserIdAndLessonId(Long userId, Long lessonId);

    List<UserLessonProgress> findByUserIdAndLessonIdIn(Long userId, Collection<Long> lessonIds);

    List<UserLessonProgress> findTop5ByUserIdOrderByUpdatedAtDesc(Long userId);

    long countByUserIdAndStatus(Long userId, String status);
}

package com.yantongqiongdao.platform.service;

import com.yantongqiongdao.platform.common.ApiException;
import com.yantongqiongdao.platform.domain.entity.LearningLesson;
import com.yantongqiongdao.platform.domain.entity.LearningModule;
import com.yantongqiongdao.platform.domain.entity.LessonSentence;
import com.yantongqiongdao.platform.domain.entity.LessonTerm;
import com.yantongqiongdao.platform.domain.entity.UserAccount;
import com.yantongqiongdao.platform.domain.entity.UserLessonProgress;
import com.yantongqiongdao.platform.dto.learning.CompleteLessonResponse;
import com.yantongqiongdao.platform.dto.learning.LearningLessonDetailResponse;
import com.yantongqiongdao.platform.dto.learning.LearningLessonSummaryResponse;
import com.yantongqiongdao.platform.dto.learning.LearningModuleDetailResponse;
import com.yantongqiongdao.platform.dto.learning.LearningModuleSummaryResponse;
import com.yantongqiongdao.platform.dto.learning.LearningProgressResponse;
import com.yantongqiongdao.platform.dto.learning.LessonSentenceResponse;
import com.yantongqiongdao.platform.dto.learning.LessonTermResponse;
import com.yantongqiongdao.platform.dto.learning.RecentLessonResponse;
import com.yantongqiongdao.platform.repository.LearningLessonRepository;
import com.yantongqiongdao.platform.repository.LearningModuleRepository;
import com.yantongqiongdao.platform.repository.LessonSentenceRepository;
import com.yantongqiongdao.platform.repository.LessonTermRepository;
import com.yantongqiongdao.platform.repository.UserLessonProgressRepository;
import java.time.LocalDateTime;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.function.Function;
import java.util.stream.Collectors;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class LearningService {

    private final LearningModuleRepository learningModuleRepository;
    private final LearningLessonRepository learningLessonRepository;
    private final LessonTermRepository lessonTermRepository;
    private final LessonSentenceRepository lessonSentenceRepository;
    private final UserLessonProgressRepository userLessonProgressRepository;

    public LearningService(
            LearningModuleRepository learningModuleRepository,
            LearningLessonRepository learningLessonRepository,
            LessonTermRepository lessonTermRepository,
            LessonSentenceRepository lessonSentenceRepository,
            UserLessonProgressRepository userLessonProgressRepository
    ) {
        this.learningModuleRepository = learningModuleRepository;
        this.learningLessonRepository = learningLessonRepository;
        this.lessonTermRepository = lessonTermRepository;
        this.lessonSentenceRepository = lessonSentenceRepository;
        this.userLessonProgressRepository = userLessonProgressRepository;
    }

    public List<LearningModuleSummaryResponse> getModules(Optional<UserAccount> currentUser) {
        List<LearningModule> modules = learningModuleRepository.findByStatusOrderBySortOrderAsc("published");

        return modules.stream()
                .map(module -> {
                    List<LearningLesson> lessons = learningLessonRepository
                            .findByModuleIdAndStatusOrderBySortOrderAsc(module.getId(), "published");
                    long completedCount = 0;
                    if (currentUser.isPresent() && !lessons.isEmpty()) {
                        List<Long> lessonIds = lessons.stream().map(LearningLesson::getId).toList();
                        completedCount = userLessonProgressRepository
                                .findByUserIdAndLessonIdIn(currentUser.get().getId(), lessonIds)
                                .stream()
                                .filter(progress -> "completed".equals(progress.getStatus()))
                                .count();
                    }
                    return new LearningModuleSummaryResponse(
                            module.getId(),
                            module.getTitle(),
                            module.getDescription(),
                            module.getLevel(),
                            lessons.size(),
                            completedCount
                    );
                })
                .toList();
    }

    public LearningModuleDetailResponse getModuleDetail(Long moduleId, Optional<UserAccount> currentUser) {
        LearningModule module = learningModuleRepository.findById(moduleId)
                .filter(item -> "published".equals(item.getStatus()))
                .orElseThrow(() -> new ApiException(4004, "学习模块不存在", HttpStatus.NOT_FOUND));

        List<LearningLesson> lessons = learningLessonRepository.findByModuleIdAndStatusOrderBySortOrderAsc(moduleId, "published");
        Map<Long, String> progressMap = buildProgressMap(currentUser, lessons);

        List<LearningLessonSummaryResponse> lessonResponses = lessons.stream()
                .map(lesson -> new LearningLessonSummaryResponse(
                        lesson.getId(),
                        lesson.getTitle(),
                        lesson.getSummary(),
                        lesson.getDifficulty(),
                        lesson.getEstimatedMinutes(),
                        progressMap.getOrDefault(lesson.getId(), "not_started")
                ))
                .toList();

        return new LearningModuleDetailResponse(
                module.getId(),
                module.getTitle(),
                module.getDescription(),
                module.getLevel(),
                lessonResponses
        );
    }

    public LearningLessonDetailResponse getLessonDetail(Long lessonId, Optional<UserAccount> currentUser) {
        LearningLesson lesson = learningLessonRepository.findById(lessonId)
                .filter(item -> "published".equals(item.getStatus()))
                .orElseThrow(() -> new ApiException(4004, "课程不存在", HttpStatus.NOT_FOUND));

        String status = currentUser
                .flatMap(user -> userLessonProgressRepository.findByUserIdAndLessonId(user.getId(), lessonId))
                .map(UserLessonProgress::getStatus)
                .orElse("not_started");

        List<LessonTermResponse> terms = lessonTermRepository.findByLessonIdOrderBySortOrderAsc(lessonId).stream()
                .map(term -> new LessonTermResponse(
                        term.getId(),
                        term.getMandarinText(),
                        term.getHainanText(),
                        term.getPinyinNote(),
                        term.getMeaningNote()
                ))
                .toList();

        List<LessonSentenceResponse> sentences = lessonSentenceRepository.findByLessonIdOrderBySortOrderAsc(lessonId).stream()
                .map(sentence -> new LessonSentenceResponse(
                        sentence.getId(),
                        sentence.getMandarinText(),
                        sentence.getHainanText(),
                        sentence.getMeaningNote()
                ))
                .toList();

        return new LearningLessonDetailResponse(
                lesson.getId(),
                lesson.getModuleId(),
                lesson.getTitle(),
                lesson.getSummary(),
                lesson.getDifficulty(),
                lesson.getEstimatedMinutes(),
                status,
                terms,
                sentences
        );
    }

    @Transactional
    public CompleteLessonResponse completeLesson(UserAccount user, Long lessonId, String rawStatus) {
        LearningLesson lesson = learningLessonRepository.findById(lessonId)
                .filter(item -> "published".equals(item.getStatus()))
                .orElseThrow(() -> new ApiException(4004, "课程不存在", HttpStatus.NOT_FOUND));

        String status = normalizeStatus(rawStatus);
        UserLessonProgress progress = userLessonProgressRepository
                .findByUserIdAndLessonId(user.getId(), lesson.getId())
                .orElseGet(UserLessonProgress::new);

        progress.setUserId(user.getId());
        progress.setLessonId(lesson.getId());
        progress.setStatus(status);
        progress.setCompletedAt("completed".equals(status) ? LocalDateTime.now() : null);

        UserLessonProgress saved = userLessonProgressRepository.save(progress);
        return new CompleteLessonResponse(saved.getLessonId(), saved.getStatus());
    }

    public LearningProgressResponse getProgress(UserAccount user) {
        long completedLessons = userLessonProgressRepository.countByUserIdAndStatus(user.getId(), "completed");
        long inProgressLessons = userLessonProgressRepository.countByUserIdAndStatus(user.getId(), "in_progress");

        List<RecentLessonResponse> recentLessons = userLessonProgressRepository
                .findTop5ByUserIdOrderByUpdatedAtDesc(user.getId())
                .stream()
                .map(progress -> {
                    String lessonTitle = learningLessonRepository.findById(progress.getLessonId())
                            .map(LearningLesson::getTitle)
                            .orElse("未知课程");
                    return new RecentLessonResponse(
                            progress.getLessonId(),
                            lessonTitle,
                            progress.getStatus(),
                            progress.getUpdatedAt()
                    );
                })
                .toList();

        return new LearningProgressResponse(completedLessons, inProgressLessons, recentLessons);
    }

    private Map<Long, String> buildProgressMap(Optional<UserAccount> currentUser, List<LearningLesson> lessons) {
        if (currentUser.isEmpty() || lessons.isEmpty()) {
            return Collections.emptyMap();
        }
        List<Long> lessonIds = lessons.stream().map(LearningLesson::getId).toList();
        return userLessonProgressRepository.findByUserIdAndLessonIdIn(currentUser.get().getId(), lessonIds)
                .stream()
                .collect(Collectors.toMap(UserLessonProgress::getLessonId, UserLessonProgress::getStatus, (left, right) -> right));
    }

    private String normalizeStatus(String rawStatus) {
        if ("completed".equals(rawStatus) || "in_progress".equals(rawStatus) || "not_started".equals(rawStatus)) {
            return rawStatus;
        }
        throw new ApiException(4001, "学习状态不合法", HttpStatus.BAD_REQUEST);
    }
}

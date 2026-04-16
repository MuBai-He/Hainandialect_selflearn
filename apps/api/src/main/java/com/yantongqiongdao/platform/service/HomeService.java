package com.yantongqiongdao.platform.service;

import com.yantongqiongdao.platform.domain.entity.LearningLesson;
import com.yantongqiongdao.platform.domain.entity.LearningModule;
import com.yantongqiongdao.platform.domain.entity.TranslationDictionaryEntry;
import com.yantongqiongdao.platform.dto.home.BannerResponse;
import com.yantongqiongdao.platform.dto.home.CommonPhraseResponse;
import com.yantongqiongdao.platform.dto.home.HomeLessonResponse;
import com.yantongqiongdao.platform.dto.home.HomeModuleResponse;
import com.yantongqiongdao.platform.dto.home.HomeOverviewResponse;
import com.yantongqiongdao.platform.repository.LearningLessonRepository;
import com.yantongqiongdao.platform.repository.LearningModuleRepository;
import com.yantongqiongdao.platform.repository.TranslationDictionaryRepository;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class HomeService {

    private final LearningModuleRepository learningModuleRepository;
    private final LearningLessonRepository learningLessonRepository;
    private final TranslationDictionaryRepository translationDictionaryRepository;

    public HomeService(
            LearningModuleRepository learningModuleRepository,
            LearningLessonRepository learningLessonRepository,
            TranslationDictionaryRepository translationDictionaryRepository
    ) {
        this.learningModuleRepository = learningModuleRepository;
        this.learningLessonRepository = learningLessonRepository;
        this.translationDictionaryRepository = translationDictionaryRepository;
    }

    public HomeOverviewResponse getOverview() {
        List<HomeModuleResponse> modules = learningModuleRepository.findTop3ByStatusOrderBySortOrderAsc("published")
                .stream()
                .map(this::toHomeModuleResponse)
                .toList();

        List<HomeLessonResponse> lessons = learningLessonRepository.findTop5ByStatusOrderBySortOrderAsc("published")
                .stream()
                .map(this::toHomeLessonResponse)
                .toList();

        List<CommonPhraseResponse> phrases = translationDictionaryRepository
                .findTop5BySourceLangAndTargetLangOrderByIdAsc("mandarin", "hainan")
                .stream()
                .map(this::toCommonPhraseResponse)
                .toList();

        return new HomeOverviewResponse(
                new BannerResponse("海南方言智能传播与学习平台", "学得会、查得到、记得住"),
                modules,
                lessons,
                phrases
        );
    }

    private HomeModuleResponse toHomeModuleResponse(LearningModule module) {
        return new HomeModuleResponse(
                module.getId(),
                module.getTitle(),
                module.getDescription(),
                module.getLevel()
        );
    }

    private HomeLessonResponse toHomeLessonResponse(LearningLesson lesson) {
        return new HomeLessonResponse(
                lesson.getId(),
                lesson.getModuleId(),
                lesson.getTitle(),
                lesson.getSummary(),
                lesson.getEstimatedMinutes()
        );
    }

    private CommonPhraseResponse toCommonPhraseResponse(TranslationDictionaryEntry entry) {
        return new CommonPhraseResponse(
                entry.getSourceText(),
                entry.getTargetText(),
                entry.getNote()
        );
    }
}

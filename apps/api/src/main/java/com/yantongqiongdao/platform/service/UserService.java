package com.yantongqiongdao.platform.service;

import com.yantongqiongdao.platform.common.ApiException;
import com.yantongqiongdao.platform.domain.entity.AudioSample;
import com.yantongqiongdao.platform.domain.entity.LearningLesson;
import com.yantongqiongdao.platform.domain.entity.LessonSentence;
import com.yantongqiongdao.platform.domain.entity.LessonTerm;
import com.yantongqiongdao.platform.domain.entity.TranslationRecord;
import com.yantongqiongdao.platform.domain.entity.UserAccount;
import com.yantongqiongdao.platform.domain.entity.UserFavorite;
import com.yantongqiongdao.platform.domain.entity.UserProfile;
import com.yantongqiongdao.platform.dto.user.FavoriteRequest;
import com.yantongqiongdao.platform.dto.user.FavoriteResponse;
import com.yantongqiongdao.platform.dto.user.UserProfileResponse;
import com.yantongqiongdao.platform.repository.AudioSampleRepository;
import com.yantongqiongdao.platform.repository.LearningLessonRepository;
import com.yantongqiongdao.platform.repository.LessonSentenceRepository;
import com.yantongqiongdao.platform.repository.LessonTermRepository;
import com.yantongqiongdao.platform.repository.TranslationRecordRepository;
import com.yantongqiongdao.platform.repository.UserFavoriteRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserService {

    private final AuthService authService;
    private final UserFavoriteRepository userFavoriteRepository;
    private final AudioSampleRepository audioSampleRepository;
    private final LearningLessonRepository learningLessonRepository;
    private final LessonTermRepository lessonTermRepository;
    private final LessonSentenceRepository lessonSentenceRepository;
    private final TranslationRecordRepository translationRecordRepository;
    private final String audioPublicBaseUrl;

    public UserService(
            AuthService authService,
            UserFavoriteRepository userFavoriteRepository,
            AudioSampleRepository audioSampleRepository,
            LearningLessonRepository learningLessonRepository,
            LessonTermRepository lessonTermRepository,
            LessonSentenceRepository lessonSentenceRepository,
            TranslationRecordRepository translationRecordRepository,
            @Value("${audio.public-base-url:http://localhost:8080/media/audio/}") String audioPublicBaseUrl
    ) {
        this.authService = authService;
        this.userFavoriteRepository = userFavoriteRepository;
        this.audioSampleRepository = audioSampleRepository;
        this.learningLessonRepository = learningLessonRepository;
        this.lessonTermRepository = lessonTermRepository;
        this.lessonSentenceRepository = lessonSentenceRepository;
        this.translationRecordRepository = translationRecordRepository;
        this.audioPublicBaseUrl = audioPublicBaseUrl.endsWith("/")
                ? audioPublicBaseUrl
                : audioPublicBaseUrl + "/";
    }

    public UserProfileResponse getCurrentUserProfile(UserAccount user) {
        UserProfile profile = authService.getUserProfile(user.getId());
        return new UserProfileResponse(
                user.getId(),
                user.getUsername(),
                profile == null ? user.getUsername() : profile.getNickname(),
                user.getEmail(),
                profile == null ? null : profile.getAvatarUrl(),
                profile == null ? null : profile.getBio()
        );
    }

    @Transactional
    public FavoriteResponse addFavorite(UserAccount user, FavoriteRequest request) {
        validateFavoriteType(request.favoriteType());
        ensureTargetExists(request.favoriteType(), request.targetId());

        if (userFavoriteRepository.existsByUserIdAndFavoriteTypeAndTargetId(
                user.getId(),
                request.favoriteType(),
                request.targetId()
        )) {
            throw new ApiException(4001, "该内容已收藏", HttpStatus.BAD_REQUEST);
        }

        UserFavorite favorite = new UserFavorite();
        favorite.setUserId(user.getId());
        favorite.setFavoriteType(request.favoriteType());
        favorite.setTargetId(request.targetId());

        return toFavoriteResponse(userFavoriteRepository.save(favorite));
    }

    public List<FavoriteResponse> getFavorites(UserAccount user, String favoriteType) {
        List<UserFavorite> favorites = (favoriteType == null || favoriteType.isBlank())
                ? userFavoriteRepository.findByUserIdOrderByCreatedAtDesc(user.getId())
                : userFavoriteRepository.findByUserIdAndFavoriteTypeOrderByCreatedAtDesc(user.getId(), favoriteType);

        return favorites.stream().map(this::toFavoriteResponse).toList();
    }

    @Transactional
    public void deleteFavorite(UserAccount user, Long favoriteId) {
        UserFavorite favorite = userFavoriteRepository.findByIdAndUserId(favoriteId, user.getId())
                .orElseThrow(() -> new ApiException(4004, "收藏记录不存在", HttpStatus.NOT_FOUND));
        userFavoriteRepository.delete(favorite);
    }

    private FavoriteResponse toFavoriteResponse(UserFavorite favorite) {
        return switch (favorite.getFavoriteType()) {
            case "lesson" -> {
                LearningLesson lesson = learningLessonRepository.findById(favorite.getTargetId()).orElse(null);
                yield new FavoriteResponse(
                        favorite.getId(),
                        favorite.getFavoriteType(),
                        favorite.getTargetId(),
                        lesson == null ? "课程不存在" : lesson.getTitle(),
                        lesson == null ? null : lesson.getSummary(),
                        favorite.getCreatedAt()
                );
            }
            case "term" -> {
                LessonTerm term = lessonTermRepository.findById(favorite.getTargetId()).orElse(null);
                yield new FavoriteResponse(
                        favorite.getId(),
                        favorite.getFavoriteType(),
                        favorite.getTargetId(),
                        term == null ? "词汇不存在" : term.getMandarinText(),
                        term == null ? null : term.getHainanText(),
                        favorite.getCreatedAt()
                );
            }
            case "sentence" -> {
                LessonSentence sentence = lessonSentenceRepository.findById(favorite.getTargetId()).orElse(null);
                yield new FavoriteResponse(
                        favorite.getId(),
                        favorite.getFavoriteType(),
                        favorite.getTargetId(),
                        sentence == null ? "短句不存在" : sentence.getMandarinText(),
                        sentence == null ? null : sentence.getHainanText(),
                        favorite.getCreatedAt()
                );
            }
            case "translation_record" -> {
                TranslationRecord record = translationRecordRepository.findById(favorite.getTargetId()).orElse(null);
                yield new FavoriteResponse(
                        favorite.getId(),
                        favorite.getFavoriteType(),
                        favorite.getTargetId(),
                        record == null ? "翻译记录不存在" : record.getSourceText(),
                        record == null ? null : record.getTargetText(),
                        favorite.getCreatedAt()
                );
            }
            case "dictionary_entry" -> {
                AudioSample sample = audioSampleRepository.findById(favorite.getTargetId()).orElse(null);
                yield new FavoriteResponse(
                        favorite.getId(),
                        favorite.getFavoriteType(),
                        favorite.getTargetId(),
                        sample == null ? "词典词条不存在" : displayText(sample),
                        sample == null ? null : "样本拼写 · " + formatPronunciation(sample.getSampleKey()),
                        favorite.getCreatedAt()
                );
            }
            default -> new FavoriteResponse(
                    favorite.getId(),
                    favorite.getFavoriteType(),
                    favorite.getTargetId(),
                    "未知收藏",
                    null,
                    favorite.getCreatedAt()
            );
        };
    }

    private void validateFavoriteType(String favoriteType) {
        if (!"lesson".equals(favoriteType)
                && !"term".equals(favoriteType)
                && !"sentence".equals(favoriteType)
                && !"translation_record".equals(favoriteType)
                && !"dictionary_entry".equals(favoriteType)) {
            throw new ApiException(4001, "收藏类型不支持", HttpStatus.BAD_REQUEST);
        }
    }

    private void ensureTargetExists(String favoriteType, Long targetId) {
        boolean exists = switch (favoriteType) {
            case "lesson" -> learningLessonRepository.existsById(targetId);
            case "term" -> lessonTermRepository.existsById(targetId);
            case "sentence" -> lessonSentenceRepository.existsById(targetId);
            case "translation_record" -> translationRecordRepository.existsById(targetId);
            case "dictionary_entry" -> audioSampleRepository.existsById(targetId);
            default -> false;
        };
        if (!exists) {
            throw new ApiException(4004, "收藏目标不存在", HttpStatus.NOT_FOUND);
        }
    }

    private String displayText(AudioSample sample) {
        String translated = sample.getTranslatedText() == null || sample.getTranslatedText().isBlank()
                ? sample.getTranscriptText()
                : sample.getTranslatedText();
        return translated == null || translated.isBlank() ? sample.getTranscriptText() : translated;
    }

    private String formatPronunciation(String sampleKey) {
        if (sampleKey == null || sampleKey.isBlank()) {
            return "";
        }

        return sampleKey
                .replaceFirst("^\\d+[_-]?", "")
                .replace('_', ' ')
                .replace('-', ' ')
                .trim();
    }
}

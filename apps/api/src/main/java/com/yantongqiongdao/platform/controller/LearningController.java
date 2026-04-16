package com.yantongqiongdao.platform.controller;

import com.yantongqiongdao.platform.common.ApiResponse;
import com.yantongqiongdao.platform.domain.entity.UserAccount;
import com.yantongqiongdao.platform.dto.learning.CompleteLessonRequest;
import com.yantongqiongdao.platform.dto.learning.CompleteLessonResponse;
import com.yantongqiongdao.platform.dto.learning.LearningLessonDetailResponse;
import com.yantongqiongdao.platform.dto.learning.LearningModuleDetailResponse;
import com.yantongqiongdao.platform.dto.learning.LearningModuleSummaryResponse;
import com.yantongqiongdao.platform.service.AuthService;
import com.yantongqiongdao.platform.service.LearningService;
import jakarta.validation.Valid;
import java.util.List;
import java.util.Optional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/learning")
public class LearningController {

    private final AuthService authService;
    private final LearningService learningService;

    public LearningController(AuthService authService, LearningService learningService) {
        this.authService = authService;
        this.learningService = learningService;
    }

    @GetMapping("/modules")
    public ApiResponse<List<LearningModuleSummaryResponse>> getModules(
            @RequestHeader(value = "Authorization", required = false) String authorizationHeader
    ) {
        Optional<UserAccount> currentUser = authService.getCurrentUser(authorizationHeader);
        return ApiResponse.success(learningService.getModules(currentUser));
    }

    @GetMapping("/modules/{moduleId}")
    public ApiResponse<LearningModuleDetailResponse> getModuleDetail(
            @PathVariable Long moduleId,
            @RequestHeader(value = "Authorization", required = false) String authorizationHeader
    ) {
        Optional<UserAccount> currentUser = authService.getCurrentUser(authorizationHeader);
        return ApiResponse.success(learningService.getModuleDetail(moduleId, currentUser));
    }

    @GetMapping("/lessons/{lessonId}")
    public ApiResponse<LearningLessonDetailResponse> getLessonDetail(
            @PathVariable Long lessonId,
            @RequestHeader(value = "Authorization", required = false) String authorizationHeader
    ) {
        Optional<UserAccount> currentUser = authService.getCurrentUser(authorizationHeader);
        return ApiResponse.success(learningService.getLessonDetail(lessonId, currentUser));
    }

    @PostMapping("/lessons/{lessonId}/complete")
    public ApiResponse<CompleteLessonResponse> completeLesson(
            @PathVariable Long lessonId,
            @Valid @RequestBody CompleteLessonRequest request,
            @RequestHeader("Authorization") String authorizationHeader
    ) {
        UserAccount currentUser = authService.requireCurrentUser(authorizationHeader);
        return ApiResponse.success(learningService.completeLesson(currentUser, lessonId, request.status()));
    }
}

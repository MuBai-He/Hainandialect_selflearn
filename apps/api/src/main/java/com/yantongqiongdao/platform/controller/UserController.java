package com.yantongqiongdao.platform.controller;

import com.yantongqiongdao.platform.common.ApiResponse;
import com.yantongqiongdao.platform.domain.entity.UserAccount;
import com.yantongqiongdao.platform.dto.learning.LearningProgressResponse;
import com.yantongqiongdao.platform.dto.user.FavoriteResponse;
import com.yantongqiongdao.platform.dto.user.UserProfileResponse;
import com.yantongqiongdao.platform.service.AuthService;
import com.yantongqiongdao.platform.service.LearningService;
import com.yantongqiongdao.platform.service.UserService;
import java.util.List;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/users/me")
public class UserController {

    private final AuthService authService;
    private final UserService userService;
    private final LearningService learningService;

    public UserController(
            AuthService authService,
            UserService userService,
            LearningService learningService
    ) {
        this.authService = authService;
        this.userService = userService;
        this.learningService = learningService;
    }

    @GetMapping
    public ApiResponse<UserProfileResponse> getCurrentUser(
            @RequestHeader("Authorization") String authorizationHeader
    ) {
        UserAccount currentUser = authService.requireCurrentUser(authorizationHeader);
        return ApiResponse.success(userService.getCurrentUserProfile(currentUser));
    }

    @GetMapping("/progress")
    public ApiResponse<LearningProgressResponse> getProgress(
            @RequestHeader("Authorization") String authorizationHeader
    ) {
        UserAccount currentUser = authService.requireCurrentUser(authorizationHeader);
        return ApiResponse.success(learningService.getProgress(currentUser));
    }

    @GetMapping("/favorites")
    public ApiResponse<List<FavoriteResponse>> getFavorites(
            @RequestHeader("Authorization") String authorizationHeader,
            @RequestParam(required = false) String favoriteType
    ) {
        UserAccount currentUser = authService.requireCurrentUser(authorizationHeader);
        return ApiResponse.success(userService.getFavorites(currentUser, favoriteType));
    }
}

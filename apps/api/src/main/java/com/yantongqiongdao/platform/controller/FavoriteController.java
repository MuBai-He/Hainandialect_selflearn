package com.yantongqiongdao.platform.controller;

import com.yantongqiongdao.platform.common.ApiResponse;
import com.yantongqiongdao.platform.domain.entity.UserAccount;
import com.yantongqiongdao.platform.dto.user.FavoriteRequest;
import com.yantongqiongdao.platform.dto.user.FavoriteResponse;
import com.yantongqiongdao.platform.service.AuthService;
import com.yantongqiongdao.platform.service.UserService;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/favorites")
public class FavoriteController {

    private final AuthService authService;
    private final UserService userService;

    public FavoriteController(AuthService authService, UserService userService) {
        this.authService = authService;
        this.userService = userService;
    }

    @PostMapping
    public ApiResponse<FavoriteResponse> addFavorite(
            @Valid @RequestBody FavoriteRequest request,
            @RequestHeader("Authorization") String authorizationHeader
    ) {
        UserAccount currentUser = authService.requireCurrentUser(authorizationHeader);
        return ApiResponse.success(userService.addFavorite(currentUser, request));
    }

    @DeleteMapping("/{favoriteId}")
    public ApiResponse<Void> deleteFavorite(
            @PathVariable Long favoriteId,
            @RequestHeader("Authorization") String authorizationHeader
    ) {
        UserAccount currentUser = authService.requireCurrentUser(authorizationHeader);
        userService.deleteFavorite(currentUser, favoriteId);
        return ApiResponse.success();
    }
}

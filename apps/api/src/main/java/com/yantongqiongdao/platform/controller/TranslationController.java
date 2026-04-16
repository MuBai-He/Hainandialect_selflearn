package com.yantongqiongdao.platform.controller;

import com.yantongqiongdao.platform.common.ApiResponse;
import com.yantongqiongdao.platform.domain.entity.UserAccount;
import com.yantongqiongdao.platform.dto.translate.TranslateRequest;
import com.yantongqiongdao.platform.dto.translate.TranslateResponse;
import com.yantongqiongdao.platform.dto.translate.TranslationHistoryResponse;
import com.yantongqiongdao.platform.service.AuthService;
import com.yantongqiongdao.platform.service.TranslationService;
import jakarta.validation.Valid;
import java.util.Optional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/translate")
public class TranslationController {

    private final AuthService authService;
    private final TranslationService translationService;

    public TranslationController(AuthService authService, TranslationService translationService) {
        this.authService = authService;
        this.translationService = translationService;
    }

    @PostMapping
    public ApiResponse<TranslateResponse> translate(
            @Valid @RequestBody TranslateRequest request,
            @RequestHeader(value = "Authorization", required = false) String authorizationHeader
    ) {
        Optional<UserAccount> currentUser = authService.getCurrentUser(authorizationHeader);
        return ApiResponse.success(translationService.translate(currentUser, request));
    }

    @GetMapping("/history")
    public ApiResponse<TranslationHistoryResponse> getHistory(
            @RequestHeader("Authorization") String authorizationHeader,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size
    ) {
        UserAccount currentUser = authService.requireCurrentUser(authorizationHeader);
        return ApiResponse.success(translationService.getHistory(currentUser, page, size));
    }
}

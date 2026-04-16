package com.yantongqiongdao.platform.controller;

import com.yantongqiongdao.platform.common.ApiResponse;
import com.yantongqiongdao.platform.domain.entity.UserAccount;
import com.yantongqiongdao.platform.dto.audio.AudioRecognitionHistoryResponse;
import com.yantongqiongdao.platform.dto.audio.AudioRecognitionResponse;
import com.yantongqiongdao.platform.service.AudioRecognitionService;
import com.yantongqiongdao.platform.service.AuthService;
import java.util.Optional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/audio")
public class AudioRecognitionController {

    private final AuthService authService;
    private final AudioRecognitionService audioRecognitionService;

    public AudioRecognitionController(
            AuthService authService,
            AudioRecognitionService audioRecognitionService
    ) {
        this.authService = authService;
        this.audioRecognitionService = audioRecognitionService;
    }

    @PostMapping("/samples/{sampleId}/recognize")
    public ApiResponse<AudioRecognitionResponse> recognizeSample(
            @PathVariable Long sampleId,
            @RequestHeader(value = "Authorization", required = false) String authorizationHeader
    ) {
        Optional<UserAccount> currentUser = authService.getCurrentUser(authorizationHeader);
        return ApiResponse.success(audioRecognitionService.recognizeSample(currentUser, sampleId));
    }

    @GetMapping("/recognitions/history")
    public ApiResponse<AudioRecognitionHistoryResponse> getRecognitionHistory(
            @RequestHeader("Authorization") String authorizationHeader,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size
    ) {
        UserAccount currentUser = authService.requireCurrentUser(authorizationHeader);
        return ApiResponse.success(audioRecognitionService.getHistory(currentUser, page, size));
    }
}

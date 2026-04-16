package com.yantongqiongdao.platform.controller;

import com.yantongqiongdao.platform.common.ApiResponse;
import com.yantongqiongdao.platform.dto.audio.AudioSampleResponse;
import com.yantongqiongdao.platform.service.AudioSampleService;
import java.util.List;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/audio/samples")
public class AudioSampleController {

    private final AudioSampleService audioSampleService;

    public AudioSampleController(AudioSampleService audioSampleService) {
        this.audioSampleService = audioSampleService;
    }

    @GetMapping
    public ApiResponse<List<AudioSampleResponse>> getSamples() {
        return ApiResponse.success(audioSampleService.getSamples());
    }

    @GetMapping("/{sampleId}")
    public ApiResponse<AudioSampleResponse> getSampleDetail(@PathVariable Long sampleId) {
        return ApiResponse.success(audioSampleService.getSampleDetail(sampleId));
    }
}

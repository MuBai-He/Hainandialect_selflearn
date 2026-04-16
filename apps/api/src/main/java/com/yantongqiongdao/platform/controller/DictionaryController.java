package com.yantongqiongdao.platform.controller;

import com.yantongqiongdao.platform.common.ApiResponse;
import com.yantongqiongdao.platform.dto.dictionary.DictionaryEntriesResponse;
import com.yantongqiongdao.platform.service.DictionaryService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/dictionary")
public class DictionaryController {

    private final DictionaryService dictionaryService;

    public DictionaryController(
            DictionaryService dictionaryService
    ) {
        this.dictionaryService = dictionaryService;
    }

    @GetMapping("/entries")
    public ApiResponse<DictionaryEntriesResponse> getEntries(
            @RequestParam(required = false) String q,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "24") int size
    ) {
        return ApiResponse.success(dictionaryService.getEntries(q, page, size));
    }
}

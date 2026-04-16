package com.yantongqiongdao.platform.dto.learning;

import jakarta.validation.constraints.NotBlank;

public record CompleteLessonRequest(
        @NotBlank(message = "学习状态不能为空")
        String status
) {
}

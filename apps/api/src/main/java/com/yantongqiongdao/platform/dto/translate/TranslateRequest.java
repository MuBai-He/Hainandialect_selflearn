package com.yantongqiongdao.platform.dto.translate;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record TranslateRequest(
        @NotBlank(message = "源语言不能为空")
        String sourceLang,
        @NotBlank(message = "目标语言不能为空")
        String targetLang,
        @NotBlank(message = "翻译内容不能为空")
        @Size(max = 255, message = "第一版仅支持255字以内的短词短句翻译")
        String text
) {
}

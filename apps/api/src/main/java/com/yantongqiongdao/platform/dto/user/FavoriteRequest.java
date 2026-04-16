package com.yantongqiongdao.platform.dto.user;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record FavoriteRequest(
        @NotBlank(message = "收藏类型不能为空")
        String favoriteType,
        @NotNull(message = "目标ID不能为空")
        Long targetId
) {
}

package com.yantongqiongdao.platform.dto.user;

import java.time.LocalDateTime;

public record FavoriteResponse(
        Long id,
        String favoriteType,
        Long targetId,
        String title,
        String subtitle,
        LocalDateTime createdAt
) {
}

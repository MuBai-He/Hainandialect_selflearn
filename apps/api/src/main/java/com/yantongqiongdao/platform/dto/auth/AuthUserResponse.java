package com.yantongqiongdao.platform.dto.auth;

public record AuthUserResponse(
        Long id,
        String username,
        String nickname,
        String email,
        String avatarUrl,
        String bio
) {
}

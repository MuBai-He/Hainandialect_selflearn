package com.yantongqiongdao.platform.dto.user;

public record UserProfileResponse(
        Long id,
        String username,
        String nickname,
        String email,
        String avatarUrl,
        String bio
) {
}

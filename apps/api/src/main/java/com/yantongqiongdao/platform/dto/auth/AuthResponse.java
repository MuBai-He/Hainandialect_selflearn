package com.yantongqiongdao.platform.dto.auth;

public record AuthResponse(
        String token,
        AuthUserResponse user
) {
}

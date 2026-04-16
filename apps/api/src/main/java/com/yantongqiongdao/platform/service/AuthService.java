package com.yantongqiongdao.platform.service;

import com.yantongqiongdao.platform.common.ApiException;
import com.yantongqiongdao.platform.domain.entity.UserAccount;
import com.yantongqiongdao.platform.domain.entity.UserProfile;
import com.yantongqiongdao.platform.dto.auth.AuthResponse;
import com.yantongqiongdao.platform.dto.auth.AuthUserResponse;
import com.yantongqiongdao.platform.dto.auth.LoginRequest;
import com.yantongqiongdao.platform.dto.auth.RegisterRequest;
import com.yantongqiongdao.platform.security.JwtTokenProvider;
import com.yantongqiongdao.platform.repository.UserAccountRepository;
import com.yantongqiongdao.platform.repository.UserProfileRepository;
import java.util.Optional;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AuthService {

    private final UserAccountRepository userAccountRepository;
    private final UserProfileRepository userProfileRepository;
    private final JwtTokenProvider jwtTokenProvider;
    private final PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    public AuthService(
            UserAccountRepository userAccountRepository,
            UserProfileRepository userProfileRepository,
            JwtTokenProvider jwtTokenProvider
    ) {
        this.userAccountRepository = userAccountRepository;
        this.userProfileRepository = userProfileRepository;
        this.jwtTokenProvider = jwtTokenProvider;
    }

    @Transactional
    public AuthResponse register(RegisterRequest request) {
        if (userAccountRepository.existsByUsername(request.username())) {
            throw new ApiException(4001, "用户名已存在", HttpStatus.BAD_REQUEST);
        }
        if (userAccountRepository.existsByEmail(request.email())) {
            throw new ApiException(4001, "邮箱已存在", HttpStatus.BAD_REQUEST);
        }

        UserAccount user = new UserAccount();
        user.setUsername(request.username().trim());
        user.setEmail(request.email().trim());
        user.setPasswordHash(passwordEncoder.encode(request.password()));
        user.setStatus("active");
        UserAccount savedUser = userAccountRepository.save(user);

        UserProfile profile = new UserProfile();
        profile.setUserId(savedUser.getId());
        profile.setNickname(savedUser.getUsername());
        UserProfile savedProfile = userProfileRepository.save(profile);

        return buildAuthResponse(savedUser, savedProfile);
    }

    public AuthResponse login(LoginRequest request) {
        UserAccount user = userAccountRepository
                .findByUsernameOrEmail(request.account().trim(), request.account().trim())
                .orElseThrow(() -> new ApiException(4002, "用户不存在或密码错误", HttpStatus.UNAUTHORIZED));

        if (!passwordEncoder.matches(request.password(), user.getPasswordHash())) {
            throw new ApiException(4002, "用户不存在或密码错误", HttpStatus.UNAUTHORIZED);
        }

        UserProfile profile = userProfileRepository.findByUserId(user.getId()).orElse(null);
        return buildAuthResponse(user, profile);
    }

    public void logout(String authorizationHeader) {
        extractToken(authorizationHeader);
    }

    public Optional<UserAccount> getCurrentUser(String authorizationHeader) {
        String token = extractToken(authorizationHeader);
        if (token == null) {
            return Optional.empty();
        }
        if (!jwtTokenProvider.isValid(token)) {
            return Optional.empty();
        }
        Long userId = jwtTokenProvider.parseUserId(token);
        return userAccountRepository.findById(userId);
    }

    public UserAccount requireCurrentUser(String authorizationHeader) {
        return getCurrentUser(authorizationHeader)
                .orElseThrow(() -> new ApiException(4003, "未登录或 token 无效", HttpStatus.UNAUTHORIZED));
    }

    public UserProfile getUserProfile(Long userId) {
        return userProfileRepository.findByUserId(userId).orElse(null);
    }

    public AuthUserResponse toAuthUserResponse(UserAccount user, UserProfile profile) {
        return new AuthUserResponse(
                user.getId(),
                user.getUsername(),
                profile == null ? user.getUsername() : profile.getNickname(),
                user.getEmail(),
                profile == null ? null : profile.getAvatarUrl(),
                profile == null ? null : profile.getBio()
        );
    }

    private AuthResponse buildAuthResponse(UserAccount user, UserProfile profile) {
        String token = jwtTokenProvider.createToken(user.getId(), user.getUsername());
        return new AuthResponse(token, toAuthUserResponse(user, profile));
    }

    private String extractToken(String authorizationHeader) {
        if (authorizationHeader == null || authorizationHeader.isBlank()) {
            return null;
        }
        if (authorizationHeader.startsWith("Bearer ")) {
            return authorizationHeader.substring(7).trim();
        }
        return authorizationHeader.trim();
    }
}

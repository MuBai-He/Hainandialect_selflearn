package com.yantongqiongdao.platform.repository;

import com.yantongqiongdao.platform.domain.entity.UserFavorite;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserFavoriteRepository extends JpaRepository<UserFavorite, Long> {

    boolean existsByUserIdAndFavoriteTypeAndTargetId(Long userId, String favoriteType, Long targetId);

    Optional<UserFavorite> findByUserIdAndFavoriteTypeAndTargetId(Long userId, String favoriteType, Long targetId);

    List<UserFavorite> findByUserIdOrderByCreatedAtDesc(Long userId);

    List<UserFavorite> findByUserIdAndFavoriteTypeOrderByCreatedAtDesc(Long userId, String favoriteType);

    Optional<UserFavorite> findByIdAndUserId(Long id, Long userId);
}

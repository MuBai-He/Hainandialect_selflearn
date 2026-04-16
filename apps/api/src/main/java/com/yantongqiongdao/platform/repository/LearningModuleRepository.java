package com.yantongqiongdao.platform.repository;

import com.yantongqiongdao.platform.domain.entity.LearningModule;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LearningModuleRepository extends JpaRepository<LearningModule, Long> {

    List<LearningModule> findByStatusOrderBySortOrderAsc(String status);

    List<LearningModule> findTop3ByStatusOrderBySortOrderAsc(String status);
}

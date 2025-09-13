package com.system.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.system.model.UserAccount;

public interface UserRepo extends JpaRepository<UserAccount, Integer> {
    UserAccount findByEmail(String keyword);
}

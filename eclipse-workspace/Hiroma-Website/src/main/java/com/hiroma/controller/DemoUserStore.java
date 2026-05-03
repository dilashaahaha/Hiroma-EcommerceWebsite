package com.hiroma.controller;

import com.hiroma.model.User;
import java.util.ArrayList;
import java.util.List;

/**
 * Shared in-memory user store for demo purposes.
 * Used by both LoginController and RegisterController.
 * DELETE this once the leader's real UserDAO is pulled from git.
 */
public class DemoUserStore {

    public static final List<User> USERS = new ArrayList<>();

    static {
        // Pre-seeded demo account
        User seed = new User();
        seed.setUserId(1);
        seed.setEmail("demo@hiroma.com");
        seed.setPasswordHash("demo123");
        seed.setFullName("Demo User");
        seed.setPhone("9800000000");
        seed.setRole("customer");
        seed.setActive(true);
        seed.setCreatedAt("2025-01-01");
        USERS.add(seed);
    }

    public static User findByEmailAndPassword(String email, String password) {
        for (User u : USERS) {
            if (u.getEmail().equalsIgnoreCase(email)
                    && u.getPasswordHash().equals(password)) {
                return u;
            }
        }
        return null;
    }

    public static boolean isEmailTaken(String email) {
        for (User u : USERS) {
            if (u.getEmail().equalsIgnoreCase(email)) return true;
        }
        return false;
    }
}

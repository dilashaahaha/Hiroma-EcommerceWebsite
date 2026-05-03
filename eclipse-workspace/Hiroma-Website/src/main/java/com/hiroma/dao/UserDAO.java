package com.hiroma.dao;

import com.hiroma.model.User;
import com.hiroma.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * UserDAO
 * Data Access Object for the `user` table in hiroma_db.
 * Handles all database operations related to users.
 */
public class UserDAO {

    /**
     * Find a user by email and plain-text password.
     * Password is stored as password_hash in DB —
     * for Milestone 1 we do a direct string comparison.
     * (In production, use BCrypt: BCrypt.checkpw(password, hash))
     *
     * @return User object if found, null if credentials are wrong
     */
    public User getUserByEmailAndPassword(String email, String password) {
        String sql = "SELECT * FROM user WHERE email = ? AND password_hash = ? AND is_active = 1";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapRow(rs);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Find a user by email only (used for registration checks etc.)
     *
     * @return User object if found, null otherwise
     */
    public User getUserByEmail(String email) {
        String sql = "SELECT * FROM user WHERE email = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapRow(rs);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Find a user by their user_id (used after session restore etc.)
     *
     * @return User object if found, null otherwise
     */
    public User getUserById(int userId) {
        String sql = "SELECT * FROM user WHERE user_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapRow(rs);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Register a new user.
     *
     * @return true if insert succeeded, false otherwise
     */
    public boolean registerUser(User user) {
        String sql = "INSERT INTO user (full_name, email, password_hash, phone, role) "
                   + "VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, user.getFullName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPasswordHash());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getRole() != null ? user.getRole() : "customer");

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Update user profile (full_name and phone only).
     *
     * @return true if update succeeded
     */
    public boolean updateUserProfile(int userId, String fullName, String phone) {
        String sql = "UPDATE user SET full_name = ?, phone = ? WHERE user_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, fullName);
            ps.setString(2, phone);
            ps.setInt(3, userId);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // ── Helper: map a ResultSet row to a User object ──────────────────────
    private User mapRow(ResultSet rs) throws SQLException {
        User user = new User();
        user.setUserId(rs.getInt("user_id"));
        user.setFullName(rs.getString("full_name"));
        user.setEmail(rs.getString("email"));
        user.setPasswordHash(rs.getString("password_hash"));
        user.setPhone(rs.getString("phone"));
        user.setRole(rs.getString("role"));
        user.setActive(rs.getInt("is_active") == 1);
        user.setCreatedAt(rs.getString("created_at"));
        return user;
    }
}

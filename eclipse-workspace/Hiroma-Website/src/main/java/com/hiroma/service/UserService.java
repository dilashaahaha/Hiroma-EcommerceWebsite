package com.hiroma.service;

import com.hiroma.model.User;
import com.hiroma.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserService {

public User getUserByEmailAndPassword(String email, String password) {
	User user = null;

    // SQL query — matches your database table structure
    String sql = "SELECT user_id, full_name, email, password, role "
               + "FROM users "
               + "WHERE email = ? AND password = ?";

    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setString(1, email);
        ps.setString(2, password);

        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setPasswordHash(rs.getString("password"));
                user.setRole(rs.getString("role"));
            }
        }

    } catch (SQLException e) {
        System.err.println("UserDAO.getUserByEmailAndPassword error: "
                           + e.getMessage());
        e.printStackTrace();
    }

    return user;
}

/**
 * Fetch a user by ID (used by other controllers).
 */
public User getUserById(int userId) {
    User user = null;

    String sql = "SELECT user_id, full_name, email, password, role "
               + "FROM users WHERE user_id = ?";

    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setInt(1, userId);

        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setPasswordHash(rs.getString("password"));
                user.setRole(rs.getString("role"));
            }
        }

    } catch (SQLException e) {
        System.err.println("UserDAO.getUserById error: "
                           + e.getMessage());
        e.printStackTrace();
    }

    return user;
}
}
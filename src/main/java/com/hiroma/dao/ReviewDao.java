package com.hiroma.dao;

import com.hiroma.util.DBConnection;
import java.sql.*;
import java.util.*;

public class ReviewDao {

    public List<Map<String, Object>> getReviewsByProduct(int productId) throws SQLException {
        List<Map<String, Object>> list = new ArrayList<>();
        String sql = "SELECT r.*, u.full_name FROM review r JOIN users u ON r.user_id = u.id WHERE r.product_id = ? ORDER BY r.created_at DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                row.put("id", rs.getInt("id"));
                row.put("fullName", rs.getString("full_name"));
                row.put("rating", rs.getInt("rating"));
                row.put("comment", rs.getString("comment"));
                row.put("createdAt", rs.getTimestamp("created_at"));
                list.add(row);
            }
        }
        return list;
    }

    public boolean addReview(int userId, int productId, int rating, String comment) throws SQLException {
        String sql = "INSERT INTO review (user_id, product_id, rating, comment) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ps.setInt(3, rating);
            ps.setString(4, comment);
            return ps.executeUpdate() > 0;
        }
    }
}
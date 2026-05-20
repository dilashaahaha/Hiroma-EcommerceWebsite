package com.hiroma.dao;

import com.hiroma.util.DBConnection;
import java.sql.*;
import java.util.*;

public class CategoryDAO {

    public List<Map<String, Object>> getAllCategories() throws SQLException {
        List<Map<String, Object>> list = new ArrayList<>();
        String sql = "SELECT c.*, COUNT(p.id) as product_count " +
                     "FROM category c LEFT JOIN product p ON p.category_id = c.id " +
                     "GROUP BY c.id ORDER BY c.name";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                row.put("id", rs.getInt("id"));
                row.put("name", rs.getString("name"));
                row.put("description", rs.getString("description"));
                row.put("productCount", rs.getInt("product_count"));
                list.add(row);
            }
        }
        return list;
    }

    public boolean addCategory(String name, String description) throws SQLException {
        String sql = "INSERT INTO category (name, description) VALUES (?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.setString(2, description);
            return ps.executeUpdate() > 0;
        }
    }

    public boolean updateCategory(int id, String name, String description) throws SQLException {
        String sql = "UPDATE category SET name=?, description=? WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.setString(2, description);
            ps.setInt(3, id);
            return ps.executeUpdate() > 0;
        }
    }

    public boolean deleteCategory(int id) throws SQLException {
        String sql = "DELETE FROM category WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        }
    }

    public Map<String, Object> getCategoryById(int id) throws SQLException {
        String sql = "SELECT * FROM category WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                row.put("id", rs.getInt("id"));
                row.put("name", rs.getString("name"));
                row.put("description", rs.getString("description"));
                return row;
            }
        }
        return null;
    }
}
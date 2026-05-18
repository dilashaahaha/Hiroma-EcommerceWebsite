package com.hiroma.dao;

import com.hiroma.model.CategoryModel;
import com.hiroma.util.DBConfig;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {

    public List<CategoryModel> getAllCategories() throws SQLException {
        List<CategoryModel> list = new ArrayList<>();
        String sql = "SELECT * FROM category ORDER BY name ASC";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                CategoryModel c = new CategoryModel();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setDescription(rs.getString("description"));
                list.add(c);
            }
        }
        return list;
    }

    public boolean addCategory(CategoryModel c) throws SQLException {
        String sql = "INSERT INTO category (name, description) VALUES (?, ?)";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, c.getName());
            ps.setString(2, c.getDescription());
            return ps.executeUpdate() > 0;
        }
    }

    public boolean updateCategory(CategoryModel c) throws SQLException {
        String sql = "UPDATE category SET name=?, description=? WHERE id=?";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, c.getName());
            ps.setString(2, c.getDescription());
            ps.setInt(3, c.getId());
            return ps.executeUpdate() > 0;
        }
    }

    public boolean deleteCategory(int id) throws SQLException {
        String sql = "DELETE FROM category WHERE id = ?";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        }
    }

    public CategoryModel getCategoryById(int id) throws SQLException {
        String sql = "SELECT * FROM category WHERE id = ?";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                CategoryModel c = new CategoryModel();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setDescription(rs.getString("description"));
                return c;
            }
        }
        return null;
    }
}
package com.hiroma.dao;

import com.hiroma.model.Category;
import com.hiroma.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDao {

    // ── GET ALL CATEGORIES ────────────────────────────────────────────────
    public List<Category> getAllCategories() {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT c.id, c.name, c.slug, c.description, c.image_url, "
                   + "COUNT(p.id) AS product_count "
                   + "FROM categories c "
                   + "LEFT JOIN products p ON p.category_id = c.id "
                   + "GROUP BY c.id, c.name, c.slug, c.description, c.image_url "
                   + "ORDER BY c.id ASC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(mapRow(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // ── GET CATEGORY BY ID ────────────────────────────────────────────────
    public Category getCategoryById(int id) {
        String sql = "SELECT c.id, c.name, c.slug, c.description, c.image_url, "
                   + "COUNT(p.id) AS product_count "
                   + "FROM categories c "
                   + "LEFT JOIN products p ON p.category_id = c.id "
                   + "WHERE c.id = ? "
                   + "GROUP BY c.id, c.name, c.slug, c.description, c.image_url";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
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

    // ── ADD CATEGORY ──────────────────────────────────────────────────────
    public boolean addCategory(Category category) {
        String sql = "INSERT INTO categories (name, slug, description, image_url) "
                   + "VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, category.getName());
            ps.setString(2, category.getSlug());
            ps.setString(3, category.getDescription());
            ps.setString(4, category.getImageUrl());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // ── UPDATE CATEGORY ───────────────────────────────────────────────────
    public boolean updateCategory(Category category) {
        String sql = "UPDATE categories SET name = ?, slug = ?, description = ?, "
                   + "image_url = ? WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, category.getName());
            ps.setString(2, category.getSlug());
            ps.setString(3, category.getDescription());
            ps.setString(4, category.getImageUrl());
            ps.setInt   (5, category.getId());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // ── DELETE CATEGORY ───────────────────────────────────────────────────
    public boolean deleteCategory(int id) {
        String sql = "DELETE FROM categories WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // ── COUNT ALL CATEGORIES ──────────────────────────────────────────────
    public int countAllCategories() {
        String sql = "SELECT COUNT(*) FROM categories";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) return rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // ── MAP ROW TO CATEGORY ───────────────────────────────────────────────
    private Category mapRow(ResultSet rs) throws SQLException {
        Category c = new Category();
        c.setId          (rs.getInt   ("id"));
        c.setName        (rs.getString("name"));
        c.setSlug        (rs.getString("slug"));
        c.setDescription (rs.getString("description"));
        c.setImageUrl    (rs.getString("image_url"));
        c.setProductCount(rs.getInt   ("product_count"));
        return c;
    }
}

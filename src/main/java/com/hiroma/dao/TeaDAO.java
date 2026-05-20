package com.hiroma.dao;

import com.hiroma.model.TeaModel;
import com.hiroma.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TeaDAO {

    // Get all products with category and brand names
    public List<TeaModel> getAllTeas() throws SQLException {
        List<TeaModel> teas = new ArrayList<>();
        String sql = "SELECT p.*, c.name as category_name, b.name as brand_name " +
                     "FROM product p " +
                     "LEFT JOIN category c ON p.category_id = c.id " +
                     "LEFT JOIN brand b ON p.brand_id = b.id " +
                     "ORDER BY p.created_at DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                teas.add(mapResultSet(rs));
            }
        }
        return teas;
    }

    // Get single product by ID
    public TeaModel getTeaById(int id) throws SQLException {
        String sql = "SELECT p.*, c.name as category_name, b.name as brand_name " +
                     "FROM product p " +
                     "LEFT JOIN category c ON p.category_id = c.id " +
                     "LEFT JOIN brand b ON p.brand_id = b.id " +
                     "WHERE p.id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return mapResultSet(rs);
        }
        return null;
    }

    // Search products by name
    public List<TeaModel> searchTeas(String keyword) throws SQLException {
        List<TeaModel> teas = new ArrayList<>();
        String sql = "SELECT p.*, c.name as category_name, b.name as brand_name " +
                     "FROM product p " +
                     "LEFT JOIN category c ON p.category_id = c.id " +
                     "LEFT JOIN brand b ON p.brand_id = b.id " +
                     "WHERE p.name LIKE ? OR c.name LIKE ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) teas.add(mapResultSet(rs));
        }
        return teas;
    }

    // Get products by category
    public List<TeaModel> getTeasByCategory(int categoryId) throws SQLException {
        List<TeaModel> teas = new ArrayList<>();
        String sql = "SELECT p.*, c.name as category_name, b.name as brand_name " +
                     "FROM product p " +
                     "LEFT JOIN category c ON p.category_id = c.id " +
                     "LEFT JOIN brand b ON p.brand_id = b.id " +
                     "WHERE p.category_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) teas.add(mapResultSet(rs));
        }
        return teas;
    }

    // Add new product
    public boolean addTea(TeaModel tea) throws SQLException {
        String sql = "INSERT INTO product (name, description, price, stock, image_path, category_id, brand_id) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, tea.getName());
            ps.setString(2, tea.getDescription());
            ps.setDouble(3, tea.getPrice());
            ps.setInt(4, tea.getStock());
            ps.setString(5, tea.getImagePath());
            ps.setInt(6, tea.getCategoryId());
            ps.setInt(7, tea.getBrandId());
            return ps.executeUpdate() > 0;
        }
    }

    // Update product
    public boolean updateTea(TeaModel tea) throws SQLException {
        String sql = "UPDATE product SET name=?, description=?, price=?, stock=?, " +
                     "image_path=?, category_id=?, brand_id=? WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, tea.getName());
            ps.setString(2, tea.getDescription());
            ps.setDouble(3, tea.getPrice());
            ps.setInt(4, tea.getStock());
            ps.setString(5, tea.getImagePath());
            ps.setInt(6, tea.getCategoryId());
            ps.setInt(7, tea.getBrandId());
            ps.setInt(8, tea.getId());
            return ps.executeUpdate() > 0;
        }
    }

    // Delete product
    public boolean deleteTea(int id) throws SQLException {
        String sql = "DELETE FROM product WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        }
    }

    // Get featured/latest teas for home page
    public List<TeaModel> getFeaturedTeas() throws SQLException {
        List<TeaModel> teas = new ArrayList<>();
        String sql = "SELECT p.*, c.name as category_name, b.name as brand_name " +
                     "FROM product p " +
                     "LEFT JOIN category c ON p.category_id = c.id " +
                     "LEFT JOIN brand b ON p.brand_id = b.id " +
                     "ORDER BY p.created_at DESC LIMIT 5";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) teas.add(mapResultSet(rs));
        }
        return teas;
    }

    private TeaModel mapResultSet(ResultSet rs) throws SQLException {
        TeaModel tea = new TeaModel();
        tea.setId(rs.getInt("id"));
        tea.setName(rs.getString("name"));
        tea.setDescription(rs.getString("description"));
        tea.setPrice(rs.getDouble("price"));
        tea.setStock(rs.getInt("stock"));
        tea.setImagePath(rs.getString("image_path"));
        tea.setCategoryId(rs.getInt("category_id"));
        tea.setBrandId(rs.getInt("brand_id"));
        tea.setCategoryName(rs.getString("category_name"));
        tea.setBrandName(rs.getString("brand_name"));
        return tea;
    }
}
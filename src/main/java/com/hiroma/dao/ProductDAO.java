package com.hiroma.dao;

import com.hiroma.model.ProductModel;
import com.hiroma.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    // Get all products with category and brand names
    public List<ProductModel> getAllProducts() throws SQLException {
        List<ProductModel> list = new ArrayList<>();
        String sql = "SELECT p.*, c.name AS category_name, b.name AS brand_name " +
                     "FROM product p " +
                     "LEFT JOIN category c ON p.category_id = c.id " +
                     "LEFT JOIN brand b ON p.brand_id = b.id " +
                     "ORDER BY p.created_at DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(mapResultSet(rs));
            }
        }
        return list;
    }

    // Search/filter products
    public List<ProductModel> searchProducts(String keyword, int categoryId, int brandId) throws SQLException {
        List<ProductModel> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder(
            "SELECT p.*, c.name AS category_name, b.name AS brand_name " +
            "FROM product p " +
            "LEFT JOIN category c ON p.category_id = c.id " +
            "LEFT JOIN brand b ON p.brand_id = b.id WHERE 1=1");

        if (keyword != null && !keyword.trim().isEmpty()) {
            sql.append(" AND p.name LIKE ?");
        }
        if (categoryId > 0) {
            sql.append(" AND p.category_id = ?");
        }
        if (brandId > 0) {
            sql.append(" AND p.brand_id = ?");
        }
        sql.append(" ORDER BY p.created_at DESC");

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString())) {
            int idx = 1;
            if (keyword != null && !keyword.trim().isEmpty()) {
                ps.setString(idx++, "%" + keyword.trim() + "%");
            }
            if (categoryId > 0) ps.setInt(idx++, categoryId);
            if (brandId > 0) ps.setInt(idx++, brandId);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapResultSet(rs));
            }
        }
        return list;
    }

    // Get single product by ID
    public ProductModel getProductById(int id) throws SQLException {
        String sql = "SELECT p.*, c.name AS category_name, b.name AS brand_name " +
                     "FROM product p " +
                     "LEFT JOIN category c ON p.category_id = c.id " +
                     "LEFT JOIN brand b ON p.brand_id = b.id WHERE p.id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return mapResultSet(rs);
        }
        return null;
    }

    // Add new product
    public boolean addProduct(ProductModel p) throws SQLException {
        String sql = "INSERT INTO product (name, description, price, stock, image_path, category_id, brand_id) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, p.getName());
            ps.setString(2, p.getDescription());
            ps.setDouble(3, p.getPrice());
            ps.setInt(4, p.getStock());
            ps.setString(5, p.getImagePath());
            ps.setInt(6, p.getCategoryId());
            ps.setInt(7, p.getBrandId());
            return ps.executeUpdate() > 0;
        }
    }

    // Update product
    public boolean updateProduct(ProductModel p) throws SQLException {
        String sql = "UPDATE product SET name=?, description=?, price=?, stock=?, " +
                     "category_id=?, brand_id=?" +
                     (p.getImagePath() != null ? ", image_path=?" : "") +
                     " WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, p.getName());
            ps.setString(2, p.getDescription());
            ps.setDouble(3, p.getPrice());
            ps.setInt(4, p.getStock());
            ps.setInt(5, p.getCategoryId());
            ps.setInt(6, p.getBrandId());
            if (p.getImagePath() != null) {
                ps.setString(7, p.getImagePath());
                ps.setInt(8, p.getId());
            } else {
                ps.setInt(7, p.getId());
            }
            return ps.executeUpdate() > 0;
        }
    }

    // Delete product
    public boolean deleteProduct(int id) throws SQLException {
        String sql = "DELETE FROM product WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        }
    }

    // Helper: map ResultSet to ProductModel
    private ProductModel mapResultSet(ResultSet rs) throws SQLException {
        ProductModel p = new ProductModel();
        p.setId(rs.getInt("id"));
        p.setName(rs.getString("name"));
        p.setDescription(rs.getString("description"));
        p.setPrice(rs.getDouble("price"));
        p.setStock(rs.getInt("stock"));
        p.setImagePath(rs.getString("image_path"));
        p.setCategoryId(rs.getInt("category_id"));
        p.setBrandId(rs.getInt("brand_id"));
        p.setCategoryName(rs.getString("category_name"));
        p.setBrandName(rs.getString("brand_name"));
        p.setCreatedAt(rs.getTimestamp("created_at"));
        return p;
    }
}
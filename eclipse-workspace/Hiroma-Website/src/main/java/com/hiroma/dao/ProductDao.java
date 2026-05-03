package com.hiroma.dao;

import com.hiroma.model.Product;
import com.hiroma.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {

    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT p.id, p.product_name, p.description, p.category_id, "
                   + "c.name AS category_name, p.brand_id, b.name AS brand_name, "
                   + "p.price, p.weight_grams, p.stock_quantity, p.low_stock_alert, "
                   + "p.image_url, p.status "
                   + "FROM products p "
                   + "LEFT JOIN categories c ON p.category_id = c.id "
                   + "LEFT JOIN brands b ON p.brand_id = b.id "
                   + "ORDER BY p.id DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                products.add(mapRow(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public Product getProductById(int id) {
        String sql = "SELECT p.id, p.product_name, p.description, p.category_id, "
                   + "c.name AS category_name, p.brand_id, b.name AS brand_name, "
                   + "p.price, p.weight_grams, p.stock_quantity, p.low_stock_alert, "
                   + "p.image_url, p.status "
                   + "FROM products p "
                   + "LEFT JOIN categories c ON p.category_id = c.id "
                   + "LEFT JOIN brands b ON p.brand_id = b.id "
                   + "WHERE p.id = ?";

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

    public boolean addProduct(Product product) {
        String sql = "INSERT INTO products "
                   + "(product_name, description, category_id, brand_id, price, "
                   + "weight_grams, stock_quantity, low_stock_alert, image_url, status) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 'ACTIVE')";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, product.getProductName());
            ps.setString(2, product.getDescription());
            ps.setInt   (3, product.getCategoryId());
            ps.setInt   (4, product.getBrandId());
            ps.setDouble(5, product.getPrice());
            ps.setString(6, product.getWeightGrams());
            ps.setInt   (7, product.getStockQuantity());
            ps.setInt   (8, product.getLowStockAlert());
            ps.setString(9, product.getImageUrl());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // ── UPDATE PRODUCT ──
    public boolean updateProduct(Product product) {
        String sql = "UPDATE products SET "
                   + "product_name = ?, description = ?, category_id = ?, brand_id = ?, "
                   + "price = ?, weight_grams = ?, stock_quantity = ?, "
                   + "low_stock_alert = ?, image_url = ? "
                   + "WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, product.getProductName());
            ps.setString(2, product.getDescription());
            ps.setInt   (3, product.getCategoryId());
            ps.setInt   (4, product.getBrandId());
            ps.setDouble(5, product.getPrice());
            ps.setString(6, product.getWeightGrams());
            ps.setInt   (7, product.getStockQuantity());
            ps.setInt   (8, product.getLowStockAlert());
            ps.setString(9, product.getImageUrl());
            ps.setInt   (10, product.getId());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // ── DELETE PRODUCT ──
    public boolean deleteProduct(int id) {
        String sql = "DELETE FROM products WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // ── COUNT PRODUCTS ──
    public int countAllProducts() {
        String sql = "SELECT COUNT(*) FROM products";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) return rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // ── MAP ROW TO PRODUCT ──
    private Product mapRow(ResultSet rs) throws SQLException {
        Product p = new Product();
        p.setId           (rs.getInt   ("id"));
        p.setProductName  (rs.getString("product_name"));
        p.setDescription  (rs.getString("description"));
        p.setCategoryId   (rs.getInt   ("category_id"));
        p.setCategoryName (rs.getString("category_name"));
        p.setBrandId      (rs.getInt   ("brand_id"));
        p.setBrandName    (rs.getString("brand_name"));
        p.setPrice        (rs.getDouble("price"));
        p.setWeightGrams  (rs.getString("weight_grams"));
        p.setStockQuantity(rs.getInt   ("stock_quantity"));
        p.setLowStockAlert(rs.getInt   ("low_stock_alert"));
        p.setImageUrl     (rs.getString("image_url"));
        p.setStatus       (rs.getString("status"));
        return p;
    }
}

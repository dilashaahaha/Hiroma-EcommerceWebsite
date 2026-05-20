package com.hiroma.dao;

import com.hiroma.model.Product;
import com.hiroma.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    // Get all products
    public List<Product> getAllProducts() {
        return getProductsByCategory("all", "featured");
    }

    // Get products by category with sort
    public List<Product> getProductsByCategory(String category, String sort) {
        List<Product> products = new ArrayList<>();

        String sql = "SELECT p.*, b.brand_name, b.origin_district, c.category_name " +
                     "FROM product p " +
                     "JOIN brand b ON p.brand_id = b.brand_id " +
                     "JOIN category c ON p.category_id = c.category_id " +
                     "WHERE p.is_available = 1";

        if (category != null && !category.equals("all") && !category.isEmpty()) {
            sql += " AND LOWER(c.category_name) LIKE ?";
        }

        if (sort != null) {
            switch (sort) {
                case "price_asc":  sql += " ORDER BY p.price ASC";  break;
                case "price_desc": sql += " ORDER BY p.price DESC"; break;
                case "newest":     sql += " ORDER BY p.created_at DESC"; break;
                default:           sql += " ORDER BY p.product_id ASC";  break;
            }
        }

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            if (category != null && !category.equals("all") && !category.isEmpty()) {
                ps.setString(1, "%" + category.toLowerCase() + "%");
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                products.add(mapProduct(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    // Get single product by ID
    public Product getProductById(int productId) {
        Product product = null;
        String sql = "SELECT p.*, b.brand_name, b.origin_district, c.category_name " +
                     "FROM product p " +
                     "JOIN brand b ON p.brand_id = b.brand_id " +
                     "JOIN category c ON p.category_id = c.category_id " +
                     "WHERE p.product_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                product = mapProduct(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    // Get featured products for home page
    public List<Product> getFeaturedProducts() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT p.*, b.brand_name, b.origin_district, c.category_name " +
                     "FROM product p " +
                     "JOIN brand b ON p.brand_id = b.brand_id " +
                     "JOIN category c ON p.category_id = c.category_id " +
                     "WHERE p.is_available = 1 " +
                     "ORDER BY p.product_id ASC LIMIT 4";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                products.add(mapProduct(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    // Search products by name, category or brand
    public List<Product> searchProducts(String keyword) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT p.*, b.brand_name, b.origin_district, c.category_name " +
                     "FROM product p " +
                     "JOIN brand b ON p.brand_id = b.brand_id " +
                     "JOIN category c ON p.category_id = c.category_id " +
                     "WHERE p.is_available = 1 AND " +
                     "(p.product_name LIKE ? OR c.category_name LIKE ? OR b.brand_name LIKE ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            String s = "%" + keyword + "%";
            ps.setString(1, s);
            ps.setString(2, s);
            ps.setString(3, s);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                products.add(mapProduct(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    // Filter by origin and brand
    public List<Product> getFilteredProducts(String origin, String brand) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT p.*, b.brand_name, b.origin_district, c.category_name " +
                     "FROM product p " +
                     "JOIN brand b ON p.brand_id = b.brand_id " +
                     "JOIN category c ON p.category_id = c.category_id " +
                     "WHERE p.is_available = 1";

        if (origin != null && !origin.isEmpty()) {
            sql += " AND LOWER(b.origin_district) LIKE ?";
        }
        if (brand != null && !brand.isEmpty()) {
            sql += " AND LOWER(b.brand_name) LIKE ?";
        }

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            int idx = 1;
            if (origin != null && !origin.isEmpty()) {
                ps.setString(idx++, "%" + origin.toLowerCase() + "%");
            }
            if (brand != null && !brand.isEmpty()) {
                ps.setString(idx++, "%" + brand.toLowerCase() + "%");
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                products.add(mapProduct(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    // Map ResultSet to Product
    private Product mapProduct(ResultSet rs) throws SQLException {
        Product p = new Product();
        p.setProductId(rs.getInt("product_id"));
        p.setBrandId(rs.getInt("brand_id"));
        p.setCategoryId(rs.getInt("category_id"));
        p.setName(rs.getString("product_name"));
        p.setDescription(rs.getString("description"));
        p.setPrice(rs.getDouble("price"));
        p.setStock(rs.getInt("stock_quantity"));
        p.setImageFile(rs.getString("image_url"));
        p.setBrand(rs.getString("brand_name"));
        p.setOrigin(rs.getString("origin_district"));
        p.setCategory(rs.getString("category_name"));
        p.setIsAvailable(rs.getInt("is_available"));
        int weightGrams = rs.getInt("weight_grams");
        p.setWeight(weightGrams + "g");
        return p;
    }
}
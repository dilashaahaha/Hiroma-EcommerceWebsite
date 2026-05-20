package com.hiroma.dao;

import com.hiroma.model.Brand;
import com.hiroma.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BrandDAO {

    // Get all brands
    public List<Brand> getAllBrands() {
        List<Brand> brands = new ArrayList<>();
        String sql = "SELECT * FROM brand ORDER BY brand_id DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                brands.add(mapBrand(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return brands;
    }

    // Get brands by approval status
    public List<Brand> getBrandsByStatus(int isApproved) {
        List<Brand> brands = new ArrayList<>();
        String sql = "SELECT * FROM brand WHERE is_approved = ? ORDER BY brand_id DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, isApproved);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    brands.add(mapBrand(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return brands;
    }

    // Get single brand by ID
    public Brand getBrandById(int brandId) {
        Brand brand = null;
        String sql = "SELECT * FROM brand WHERE brand_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, brandId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    brand = mapBrand(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return brand;
    }

    // Insert new brand
    public boolean insertBrand(Brand brand) {
        String sql = "INSERT INTO brand (brand_name, origin_district, description, logo_url, is_approved, created_by, created_at) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, brand.getBrandName());
            ps.setString(2, brand.getOriginDistrict());
            ps.setString(3, brand.getDescription());
            ps.setString(4, brand.getLogoUrl());
            ps.setInt(5, brand.getIsApproved());
            ps.setInt(6, brand.getCreatedBy());
            ps.setTimestamp(7, brand.getCreatedAt() != null ? brand.getCreatedAt() : new Timestamp(System.currentTimeMillis()));
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Update brand details
    public boolean updateBrand(Brand brand) {
        String sql = "UPDATE brand SET brand_name = ?, origin_district = ?, description = ?, logo_url = ? " +
                     "WHERE brand_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, brand.getBrandName());
            ps.setString(2, brand.getOriginDistrict());
            ps.setString(3, brand.getDescription());
            ps.setString(4, brand.getLogoUrl());
            ps.setInt(5, brand.getBrandId());
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Update brand approval status
    public boolean updateBrandStatus(int brandId, int status) {
        String sql = "UPDATE brand SET is_approved = ? WHERE brand_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, status);
            ps.setInt(2, brandId);
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Map ResultSet to Brand model
    private Brand mapBrand(ResultSet rs) throws SQLException {
        Brand b = new Brand();
        b.setBrandId(rs.getInt("brand_id"));
        b.setBrandName(rs.getString("brand_name"));
        b.setOriginDistrict(rs.getString("origin_district"));
        b.setDescription(rs.getString("description"));
        b.setLogoUrl(rs.getString("logo_url"));
        b.setIsApproved(rs.getInt("is_approved"));
        b.setCreatedBy(rs.getInt("created_by"));
        b.setCreatedAt(rs.getTimestamp("created_at"));
        return b;
    }
}

package com.hiroma.dao;

import com.hiroma.model.Brand;
import com.hiroma.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BrandDao {

    // ── Get all brands ────────────────────────────────────────────────────
    public List<Brand> getAllBrands() {
        return getByStatus(null);
    }

    // ── Get brands by status (Pending / Approved / Rejected) ─────────────
    public List<Brand> getByStatus(String status) {
        List<Brand> list = new ArrayList<>();
        String sql = (status == null)
                ? "SELECT * FROM brands ORDER BY id DESC"
                : "SELECT * FROM brands WHERE status = ? ORDER BY id DESC";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            if (status != null) ps.setString(1, status);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapRow(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // ── Get brand by ID ───────────────────────────────────────────────────
    public Brand getBrandById(int id) {
        String sql = "SELECT * FROM brands WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return mapRow(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // ── Update brand status ───────────────────────────────────────────────
    public boolean updateStatus(int id, String status) {
        String sql = "UPDATE brands SET status = ? WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // ── Delete brand ──────────────────────────────────────────────────────
    public boolean deleteBrand(int id) {
        String sql = "DELETE FROM brands WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // ── Count by status ───────────────────────────────────────────────────
    public int countByStatus(String status) {
        String sql = "SELECT COUNT(*) FROM brands WHERE status = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, status);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // ── Count all ─────────────────────────────────────────────────────────
    public int countAll() {
        String sql = "SELECT COUNT(*) FROM brands";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) return rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // ── Map row to Brand object ───────────────────────────────────────────
    private Brand mapRow(ResultSet rs) throws SQLException {
        Brand b = new Brand();
        b.setId(rs.getInt("id"));
        b.setName(rs.getString("name"));
        b.setLocation(rs.getString("location"));
        b.setProvince(rs.getString("province"));
        b.setOwnerName(rs.getString("owner_name"));
        b.setDescription(rs.getString("description"));
        b.setImageUrl(rs.getString("image_url"));
        b.setStatus(rs.getString("status"));
        return b;
    }
}

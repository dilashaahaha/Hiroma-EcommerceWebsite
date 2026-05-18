package com.hiroma.dao;

import com.hiroma.model.BrandModel;
import com.hiroma.util.DBConfig;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BrandDAO {

    public List<BrandModel> getAllBrands() throws SQLException {
        List<BrandModel> list = new ArrayList<>();
        String sql = "SELECT * FROM brand ORDER BY name ASC";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(mapResultSet(rs));
            }
        }
        return list;
    }

    public boolean addBrand(BrandModel b) throws SQLException {
        String sql = "INSERT INTO brand (name, origin, description) VALUES (?, ?, ?)";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, b.getName());
            ps.setString(2, b.getOrigin());
            ps.setString(3, b.getDescription());
            return ps.executeUpdate() > 0;
        }
    }

    public boolean updateBrand(BrandModel b) throws SQLException {
        String sql = "UPDATE brand SET name=?, origin=?, description=? WHERE id=?";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, b.getName());
            ps.setString(2, b.getOrigin());
            ps.setString(3, b.getDescription());
            ps.setInt(4, b.getId());
            return ps.executeUpdate() > 0;
        }
    }

    public boolean deleteBrand(int id) throws SQLException {
        String sql = "DELETE FROM brand WHERE id = ?";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        }
    }

    public BrandModel getBrandById(int id) throws SQLException {
        String sql = "SELECT * FROM brand WHERE id = ?";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return mapResultSet(rs);
        }
        return null;
    }

    private BrandModel mapResultSet(ResultSet rs) throws SQLException {
        BrandModel b = new BrandModel();
        b.setId(rs.getInt("id"));
        b.setName(rs.getString("name"));
        b.setOrigin(rs.getString("origin"));
        b.setDescription(rs.getString("description"));
        return b;
    }
}
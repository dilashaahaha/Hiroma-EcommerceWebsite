package com.hiroma.dao;

import com.hiroma.util.DBConnection;
import java.sql.*;
import java.util.*;

public class BrandDAO {

    public List<Map<String, Object>> getAllBrands() throws SQLException {
        List<Map<String, Object>> list = new ArrayList<>();
        String sql = "SELECT * FROM brand ORDER BY name";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                row.put("id", rs.getInt("id"));
                row.put("name", rs.getString("name"));
                row.put("origin", rs.getString("origin"));
                row.put("description", rs.getString("description"));
                list.add(row);
            }
        }
        return list;
    }

    public boolean addBrand(String name, String origin, String description) throws SQLException {
        String sql = "INSERT INTO brand (name, origin, description) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.setString(2, origin);
            ps.setString(3, description);
            return ps.executeUpdate() > 0;
        }
    }

    public boolean updateBrand(int id, String name, String origin, String description) throws SQLException {
        String sql = "UPDATE brand SET name=?, origin=?, description=? WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.setString(2, origin);
            ps.setString(3, description);
            ps.setInt(4, id);
            return ps.executeUpdate() > 0;
        }
    }

    public boolean deleteBrand(int id) throws SQLException {
        String sql = "DELETE FROM brand WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        }
    }

    public Map<String, Object> getBrandById(int id) throws SQLException {
        String sql = "SELECT * FROM brand WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                row.put("id", rs.getInt("id"));
                row.put("name", rs.getString("name"));
                row.put("origin", rs.getString("origin"));
                row.put("description", rs.getString("description"));
                return row;
            }
        }
        return null;
    }
}
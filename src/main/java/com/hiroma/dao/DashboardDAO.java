package com.hiroma.dao;

import com.hiroma.util.DBConfig;
import java.sql.*;
import java.util.*;

public class DashboardDAO {

    public int getTotalProducts() throws SQLException {
        String sql = "SELECT COUNT(*) FROM product";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            return rs.next() ? rs.getInt(1) : 0;
        }
    }

    public int getTotalOrders() throws SQLException {
        String sql = "SELECT COUNT(*) FROM orders";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            return rs.next() ? rs.getInt(1) : 0;
        }
    }

    public int getTotalUsers() throws SQLException {
        String sql = "SELECT COUNT(*) FROM users WHERE role = 'user'";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            return rs.next() ? rs.getInt(1) : 0;
        }
    }

    public int getPendingUsers() throws SQLException {
        String sql = "SELECT COUNT(*) FROM users WHERE status = 'pending'";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            return rs.next() ? rs.getInt(1) : 0;
        }
    }

    public List<Map<String, Object>> getRecentOrders() throws SQLException {
        List<Map<String, Object>> orders = new ArrayList<>();
        String sql = "SELECT o.id, u.full_name, o.total_amount, o.status, o.order_date " +
                     "FROM orders o JOIN users u ON o.user_id = u.id " +
                     "ORDER BY o.order_date DESC LIMIT 5";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                row.put("id", rs.getInt("id"));
                row.put("customerName", rs.getString("full_name"));
                row.put("amount", rs.getDouble("total_amount"));
                row.put("status", rs.getString("status"));
                row.put("orderDate", rs.getTimestamp("order_date"));
                orders.add(row);
            }
        }
        return orders;
    }

    public List<Map<String, Object>> getCategoryStats() throws SQLException {
        List<Map<String, Object>> stats = new ArrayList<>();
        String sql = "SELECT c.name, COUNT(p.id) as total " +
                     "FROM category c LEFT JOIN product p ON p.category_id = c.id " +
                     "GROUP BY c.id, c.name ORDER BY total DESC";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                row.put("name", rs.getString("name"));
                row.put("total", rs.getInt("total"));
                stats.add(row);
            }
        }
        return stats;
    }
}
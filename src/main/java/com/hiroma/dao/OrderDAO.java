package com.hiroma.dao;

import com.hiroma.util.DBConnection;
import java.sql.*;
import java.util.*;

public class OrderDAO {

    public List<Map<String, Object>> getAllOrders() throws SQLException {
        List<Map<String, Object>> list = new ArrayList<>();
        String sql = "SELECT o.*, u.full_name FROM orders o JOIN users u ON o.user_id = u.id ORDER BY o.order_date DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) list.add(mapOrder(rs, true));
        }
        return list;
    }

    public List<Map<String, Object>> getOrdersByUser(int userId) throws SQLException {
        List<Map<String, Object>> list = new ArrayList<>();
        String sql = "SELECT o.*, u.full_name FROM orders o JOIN users u ON o.user_id = u.id WHERE o.user_id = ? ORDER BY o.order_date DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) list.add(mapOrder(rs, true));
        }
        return list;
    }

    public int getOrderCountByUser(int userId) throws SQLException {
        String sql = "SELECT COUNT(*) FROM orders WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            return rs.next() ? rs.getInt(1) : 0;
        }
    }

    public boolean updateOrderStatus(int orderId, String status) throws SQLException {
        String sql = "UPDATE orders SET status=? WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, orderId);
            return ps.executeUpdate() > 0;
        }
    }

    private Map<String, Object> mapOrder(ResultSet rs, boolean includeUser) throws SQLException {
        Map<String, Object> row = new HashMap<>();
        row.put("id", rs.getInt("id"));
        row.put("userId", rs.getInt("user_id"));
        row.put("totalAmount", rs.getDouble("total_amount"));
        row.put("status", rs.getString("status"));
        row.put("orderDate", rs.getTimestamp("order_date"));
        if (includeUser) row.put("customerName", rs.getString("full_name"));
        return row;
    }
}
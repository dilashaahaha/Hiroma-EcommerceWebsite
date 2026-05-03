package com.hiroma.controller;

import com.hiroma.model.User;
import com.hiroma.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/admin/users")
public class AdminuserServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // ── GET: view all users OR delete ─────────────────────────────────────
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            deleteUser(id);
            response.sendRedirect(request.getContextPath()
                    + "/admin/users?message=User+deleted+successfully");

        } else {
            // Get filter params from query string
            String role   = request.getParameter("role");
            String status = request.getParameter("status");

            List<User> userList = getAllUsers(role, status);
            request.setAttribute("userList", userList);
            request.setAttribute("totalUsers", userList.size());
            request.getRequestDispatcher("/admin/user.jsp").forward(request, response);
        }
    }

    // ── DB HELPERS ────────────────────────────────────────────────────────

    private List<User> getAllUsers(String role, String status) {
        List<User> list = new ArrayList<>();

        StringBuilder sql = new StringBuilder(
            "SELECT id, full_name, email, phone, role, status, joined_date, order_count "
          + "FROM users WHERE 1=1");

        if (role != null && !role.isEmpty() && !"All roles".equals(role)) {
            sql.append(" AND role = ?");
        }
        if (status != null && !status.isEmpty() && !"All status".equals(status)) {
            sql.append(" AND status = ?");
        }
        sql.append(" ORDER BY id DESC");

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql.toString())) {

            int idx = 1;
            if (role != null && !role.isEmpty() && !"All roles".equals(role)) {
                ps.setString(idx++, role);
            }
            if (status != null && !status.isEmpty() && !"All status".equals(status)) {
                ps.setString(idx++, status);
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setFullName(rs.getString("full_name"));
                u.setEmail(rs.getString("email"));
                u.setPhone(rs.getString("phone"));
                u.setRole(rs.getString("role"));
                u.setStatus(rs.getString("status"));
                u.setJoinedDate(rs.getString("joined_date"));
                u.setOrderCount(rs.getInt("order_count"));
                list.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    private void deleteUser(int id) {
        String sql = "DELETE FROM users WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

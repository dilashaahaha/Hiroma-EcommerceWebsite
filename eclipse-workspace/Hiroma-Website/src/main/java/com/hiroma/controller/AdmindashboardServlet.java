package com.hiroma.controller;

import com.hiroma.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

@WebServlet("/admin/dashboard")
public class AdmindashboardServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Pass counts to dashboard.jsp
        request.setAttribute("totalProducts",       getCount("SELECT COUNT(*) FROM products"));
        request.setAttribute("totalBrands",         getCount("SELECT COUNT(*) FROM brands"));
        request.setAttribute("totalUsers",          getCount("SELECT COUNT(*) FROM users"));
        request.setAttribute("totalPendingBrands",  getCount("SELECT COUNT(*) FROM brands WHERE status='Pending'"));

        request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
    }

    private int getCount(String sql) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) return rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}

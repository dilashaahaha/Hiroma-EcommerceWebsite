package com.hiroma.controller;

import com.hiroma.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/admin/brands")
public class AdminbrandServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String filter = request.getParameter("filter"); // pending, approved, all

        if ("approve".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            updateBrandStatus(id, "Approved");
            response.sendRedirect(request.getContextPath()
                    + "/admin/brands?filter=pending&message=Brand+approved+successfully");

        } else if ("reject".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            updateBrandStatus(id, "Rejected");
            response.sendRedirect(request.getContextPath()
                    + "/admin/brands?filter=pending&message=Brand+rejected");

        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            deleteBrand(id);
            response.sendRedirect(request.getContextPath()
                    + "/admin/brands?message=Brand+deleted");

        } else {

            List<Map<String, String>> brandList = getBrands(filter);
            request.setAttribute("brandList", brandList);
            request.setAttribute("filter", filter != null ? filter : "pending");
            request.setAttribute("totalPending",  countByStatus("Pending"));
            request.setAttribute("totalApproved", countByStatus("Approved"));
            request.setAttribute("totalAll",      countAll());
            request.getRequestDispatcher("/admin/brand.jsp").forward(request, response);
        }
    }


    private List<Map<String, String>> getBrands(String filter) {
        List<Map<String, String>> list = new ArrayList<>();
        String sql;

        if ("approved".equals(filter)) {
            sql = "SELECT * FROM brands WHERE status = 'Approved' ORDER BY id DESC";
        } else if ("all".equals(filter)) {
            sql = "SELECT * FROM brands ORDER BY id DESC";
        } else {
            // default: pending
            sql = "SELECT * FROM brands WHERE status = 'Pending' ORDER BY id DESC";
        }

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Map<String, String> brand = new HashMap<>();
                brand.put("id",          String.valueOf(rs.getInt("id")));
                brand.put("name",        rs.getString("name"));
                brand.put("location",    rs.getString("location"));
                brand.put("province",    rs.getString("province"));
                brand.put("ownerName",   rs.getString("owner_name"));
                brand.put("description", rs.getString("description"));
                brand.put("imageUrl",    rs.getString("image_url"));
                brand.put("status",      rs.getString("status"));
                list.add(brand);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    private void updateBrandStatus(int id, String status) {
        String sql = "UPDATE brands SET status = ? WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void deleteBrand(int id) {
        String sql = "DELETE FROM brands WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private int countByStatus(String status) {
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

    private int countAll() {
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
}

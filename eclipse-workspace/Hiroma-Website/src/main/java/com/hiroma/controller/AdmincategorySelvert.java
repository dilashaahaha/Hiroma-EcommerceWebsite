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

@WebServlet("/admin/categories")
public class AdmincategorySelvert extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // ── GET: view all categories OR delete 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            deleteCategory(id);
            response.sendRedirect(request.getContextPath()
                    + "/admin/categories?message=Category+deleted+successfully");

        } else {
            List<Map<String, String>> categoryList = getAllCategories();
            request.setAttribute("categoryList", categoryList);
            request.setAttribute("totalCategories", categoryList.size());
            request.getRequestDispatcher("/admin/categories.jsp").forward(request, response);
        }
    }

    // ── POST: add new category OR update existing ─────────────────────────
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action      = request.getParameter("action");
        String name        = request.getParameter("name");
        String slug        = request.getParameter("slug");
        String description = request.getParameter("description");

        // ── Validation ────────────────────────────────────────────────────
        String error = null;
        if (name == null || name.trim().isEmpty()) {
            error = "Category name is required.";
        } else if (slug == null || slug.trim().isEmpty()) {
            error = "URL slug is required.";
        }

        if (error != null) {
            List<Map<String, String>> categoryList = getAllCategories();
            request.setAttribute("categoryList", categoryList);
            request.setAttribute("totalCategories", categoryList.size());
            request.setAttribute("error", error);
            request.getRequestDispatcher("/admin/categories.jsp").forward(request, response);
            return;
        }

        if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            updateCategory(id, name.trim(), slug.trim(), description);
            response.sendRedirect(request.getContextPath()
                    + "/admin/categories?message=Category+updated+successfully");
        } else {
            saveCategory(name.trim(), slug.trim(), description);
            response.sendRedirect(request.getContextPath()
                    + "/admin/categories?message=Category+added+successfully");
        }
    }

    // ── DB HELPERS ────────────────────────────────────────────────────────

    private List<Map<String, String>> getAllCategories() {
        List<Map<String, String>> list = new ArrayList<>();
        String sql = "SELECT c.id, c.name, c.slug, c.description, "
                   + "COUNT(p.id) AS product_count "
                   + "FROM categories c "
                   + "LEFT JOIN products p ON p.category_id = c.id "
                   + "GROUP BY c.id ORDER BY c.id ASC";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Map<String, String> cat = new HashMap<>();
                cat.put("id",           String.valueOf(rs.getInt("id")));
                cat.put("name",         rs.getString("name"));
                cat.put("slug",         rs.getString("slug"));
                cat.put("description",  rs.getString("description"));
                cat.put("productCount", String.valueOf(rs.getInt("product_count")));
                list.add(cat);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    private void saveCategory(String name, String slug, String description) {
        String sql = "INSERT INTO categories (name, slug, description) VALUES (?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.setString(2, slug);
            ps.setString(3, description);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void updateCategory(int id, String name, String slug, String description) {
        String sql = "UPDATE categories SET name=?, slug=?, description=? WHERE id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.setString(2, slug);
            ps.setString(3, description);
            ps.setInt(4, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void deleteCategory(int id) {
        String sql = "DELETE FROM categories WHERE id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
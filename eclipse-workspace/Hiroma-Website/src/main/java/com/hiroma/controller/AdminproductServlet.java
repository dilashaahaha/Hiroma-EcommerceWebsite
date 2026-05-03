package com.hiroma.controller;

import com.hiroma.model.Product;
import com.hiroma.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/admin/products")
@MultipartConfig
public class AdminproductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // ── GET: view all products OR show add/edit form ──────────────────────
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("edit".equals(action)) {
            // Show edit form with existing product data
            int id = Integer.parseInt(request.getParameter("id"));
            Product product = getProductById(id);
            request.setAttribute("product", product);
            request.getRequestDispatcher("/admin/Product_form.jsp").forward(request, response);

        } else if ("delete".equals(action)) {
            // Delete product and redirect back with message
            int id = Integer.parseInt(request.getParameter("id"));
            deleteProduct(id);
            response.sendRedirect(request.getContextPath()
                    + "/admin/products?message=Product+deleted+successfully");

        } else {
            // Show all products list
            List<Product> productList = getAllProducts();
            request.setAttribute("productList", productList);
            request.setAttribute("totalProducts", productList.size());
            request.getRequestDispatcher("/admin/products.jsp").forward(request, response);
        }
    }

    // ── POST: save new product OR update existing ─────────────────────────
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        // ── Validation ────────────────────────────────────────────────────
        String productName   = request.getParameter("productName");
        String description   = request.getParameter("description");
        String categoryId    = request.getParameter("categoryId");
        String brandId       = request.getParameter("brandId");
        String price         = request.getParameter("price");
        String weightGrams   = request.getParameter("weightGrams");
        String stockQuantity = request.getParameter("stockQuantity");
        String lowStockAlert = request.getParameter("lowStockAlert");

        String error = null;
        if (productName == null || productName.trim().isEmpty()) {
            error = "Product name is required.";
        } else if (categoryId == null || categoryId.isEmpty()) {
            error = "Please select a category.";
        } else if (brandId == null || brandId.isEmpty()) {
            error = "Please select a brand.";
        } else if (price == null || price.trim().isEmpty()) {
            error = "Price is required.";
        } else if (stockQuantity == null || stockQuantity.trim().isEmpty()) {
            error = "Stock quantity is required.";
        }

        if (error != null) {
            request.setAttribute("error", error);
            if ("update".equals(action)) {
                Product product = getProductById(Integer.parseInt(request.getParameter("id")));
                request.setAttribute("product", product);
            }
            request.getRequestDispatcher("/admin/Product_form.jsp").forward(request, response);
            return;
        }

        // ── Handle image upload ───────────────────────────────────────────
        String imageUrl = request.getParameter("imageUrl");
        Part filePart   = request.getPart("image");

        if (filePart != null && filePart.getSize() > 0) {
            String fileName  = filePart.getSubmittedFileName();
            String uploadDir = getServletContext().getRealPath("") + File.separator + "images";
            File dir = new File(uploadDir);
            if (!dir.exists()) dir.mkdirs();
            filePart.write(uploadDir + File.separator + fileName);
            imageUrl = request.getContextPath() + "/images/" + fileName;
        }

        // ── Determine status based on stock ───────────────────────────────
        int stock     = Integer.parseInt(stockQuantity);
        int lowAlert  = (lowStockAlert != null && !lowStockAlert.isEmpty())
                        ? Integer.parseInt(lowStockAlert) : 10;
        String status = stock == 0 ? "Inactive" : stock <= lowAlert ? "Low Stock" : "Active";

        if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            updateProduct(id, productName.trim(), description, Integer.parseInt(categoryId),
                    Integer.parseInt(brandId), Double.parseDouble(price),
                    weightGrams, stock, lowAlert, imageUrl, status);
            response.sendRedirect(request.getContextPath()
                    + "/admin/products?message=Product+updated+successfully");
        } else {
            saveProduct(productName.trim(), description, Integer.parseInt(categoryId),
                    Integer.parseInt(brandId), Double.parseDouble(price),
                    weightGrams, stock, lowAlert, imageUrl, status);
            response.sendRedirect(request.getContextPath()
                    + "/admin/products?message=Product+added+successfully");
        }
    }

    // ── DB HELPERS ────────────────────────────────────────────────────────

    private List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.id, p.product_name, p.description, p.category_id, p.brand_id, "
                   + "p.price, p.weight_grams, p.stock_quantity, p.low_stock_alert, "
                   + "p.image_url, p.status FROM products p ORDER BY p.id DESC";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setProductName(rs.getString("product_name"));
                p.setDescription(rs.getString("description"));
                p.setCategoryId(rs.getInt("category_id"));
                p.setBrandId(rs.getInt("brand_id"));
                p.setPrice(rs.getDouble("price"));
                p.setWeightGrams(rs.getString("weight_grams"));
                p.setStockQuantity(rs.getInt("stock_quantity"));
                p.setLowStockAlert(rs.getInt("low_stock_alert"));
                p.setImageUrl(rs.getString("image_url"));
                p.setStatus(rs.getString("status"));
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    private Product getProductById(int id) {
        String sql = "SELECT * FROM products WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setProductName(rs.getString("product_name"));
                p.setDescription(rs.getString("description"));
                p.setCategoryId(rs.getInt("category_id"));
                p.setBrandId(rs.getInt("brand_id"));
                p.setPrice(rs.getDouble("price"));
                p.setWeightGrams(rs.getString("weight_grams"));
                p.setStockQuantity(rs.getInt("stock_quantity"));
                p.setLowStockAlert(rs.getInt("low_stock_alert"));
                p.setImageUrl(rs.getString("image_url"));
                p.setStatus(rs.getString("status"));
                return p;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private void saveProduct(String productName, String description,
            int categoryId, int brandId, double price, String weightGrams,
            int stock, int lowAlert, String imageUrl, String status) {
        String sql = "INSERT INTO products (product_name, description, category_id, brand_id, "
                   + "price, weight_grams, stock_quantity, low_stock_alert, image_url, status) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, productName);
            ps.setString(2, description);
            ps.setInt(3, categoryId);
            ps.setInt(4, brandId);
            ps.setDouble(5, price);
            ps.setString(6, weightGrams);
            ps.setInt(7, stock);
            ps.setInt(8, lowAlert);
            ps.setString(9, imageUrl);
            ps.setString(10, status);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void updateProduct(int id, String productName, String description,
            int categoryId, int brandId, double price, String weightGrams,
            int stock, int lowAlert, String imageUrl, String status) {
        String sql = "UPDATE products SET product_name=?, description=?, category_id=?, "
                   + "brand_id=?, price=?, weight_grams=?, stock_quantity=?, "
                   + "low_stock_alert=?, image_url=?, status=? WHERE id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, productName);
            ps.setString(2, description);
            ps.setInt(3, categoryId);
            ps.setInt(4, brandId);
            ps.setDouble(5, price);
            ps.setString(6, weightGrams);
            ps.setInt(7, stock);
            ps.setInt(8, lowAlert);
            ps.setString(9, imageUrl);
            ps.setString(10, status);
            ps.setInt(11, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void deleteProduct(int id) {
        String sql = "DELETE FROM products WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

package com.hiroma.controller;

import com.hiroma.model.ProductModel;
import com.hiroma.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

@WebServlet("/admin/products")
@MultipartConfig(maxFileSize = 5 * 1024 * 1024) // 5MB max
public class AdminProductServlet extends HttpServlet {

    private ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        try {
            if ("add".equals(action)) {
                // Show add form
                request.setAttribute("categories", productService.getAllCategories());
                request.setAttribute("brands", productService.getAllBrands());
                request.setAttribute("formAction", "add");
                request.getRequestDispatcher("/WEB-INF/views/admin/addEditProduct.jsp")
                       .forward(request, response);

            } else if ("edit".equals(action)) {
                // Show edit form pre-populated
                int id = Integer.parseInt(request.getParameter("id"));
                ProductModel product = productService.getProductById(id);
                if (product == null) {
                    response.sendRedirect(request.getContextPath() + "/admin/products");
                    return;
                }
                request.setAttribute("product", product);
                request.setAttribute("categories", productService.getAllCategories());
                request.setAttribute("brands", productService.getAllBrands());
                request.setAttribute("formAction", "edit");
                request.getRequestDispatcher("/WEB-INF/views/admin/addEditProduct.jsp")
                       .forward(request, response);

            } else if ("delete".equals(action)) {
                // Delete product
                int id = Integer.parseInt(request.getParameter("id"));
                productService.deleteProduct(id);
                response.sendRedirect(request.getContextPath() + "/admin/products?success=deleted");

            } else {
                // List all with optional search/filter
                String keyword = request.getParameter("keyword");
                String catIdStr = request.getParameter("categoryId");
                String brandIdStr = request.getParameter("brandId");

                int categoryId = (catIdStr != null && !catIdStr.isEmpty()) ? Integer.parseInt(catIdStr) : 0;
                int brandId = (brandIdStr != null && !brandIdStr.isEmpty()) ? Integer.parseInt(brandIdStr) : 0;

                List<ProductModel> products = productService.searchProducts(keyword, categoryId, brandId);
                request.setAttribute("products", products);
                request.setAttribute("categories", productService.getAllCategories());
                request.setAttribute("brands", productService.getAllBrands());
                request.setAttribute("keyword", keyword);
                request.setAttribute("selectedCategory", categoryId);
                request.setAttribute("selectedBrand", brandId);
                request.getRequestDispatcher("/WEB-INF/views/admin/manageProducts.jsp")
                       .forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String price = request.getParameter("price");
        String stock = request.getParameter("stock");
        String categoryId = request.getParameter("categoryId");
        String brandId = request.getParameter("brandId");

        // Handle image upload
        String imagePath = null;
        try {
            Part filePart = request.getPart("image");
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = UUID.randomUUID().toString() + "_" +
                    filePart.getSubmittedFileName().replaceAll("[^a-zA-Z0-9._-]", "_");

                // Save to webapp/images/products/
                String uploadDir = getServletContext().getRealPath("/images/products");
                File dir = new File(uploadDir);
                if (!dir.exists()) dir.mkdirs();

                filePart.write(uploadDir + File.separator + fileName);
                imagePath = "images/products/" + fileName;
            }
        } catch (Exception e) {
            // No image uploaded or error — continue without image
        }

        String result;
        if ("add".equals(action)) {
            result = productService.addProduct(name, description, price, stock, imagePath, categoryId, brandId);
        } else {
            int id = Integer.parseInt(request.getParameter("productId"));
            String existingImage = request.getParameter("existingImage");
            String finalImage = (imagePath != null) ? imagePath : existingImage;
            result = productService.updateProduct(id, name, description, price, stock, finalImage, categoryId, brandId);
        }

        if ("success".equals(result)) {
            String msg = "add".equals(action) ? "added" : "updated";
            response.sendRedirect(request.getContextPath() + "/admin/products?success=" + msg);
        } else {
            try {
                request.setAttribute("error", result);
                request.setAttribute("categories", productService.getAllCategories());
                request.setAttribute("brands", productService.getAllBrands());
                request.setAttribute("formAction", action);
                request.getRequestDispatcher("/WEB-INF/views/admin/addEditProduct.jsp")
                       .forward(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect(request.getContextPath() + "/error");
            }
        }
    }
}

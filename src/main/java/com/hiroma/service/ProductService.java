package com.hiroma.service;

import com.hiroma.dao.ProductDAO;
import com.hiroma.dao.CategoryDAO;
import com.hiroma.dao.BrandDAO;
import com.hiroma.model.ProductModel;
import com.hiroma.model.CategoryModel;
import com.hiroma.model.BrandModel;
import com.hiroma.util.ValidationUtil;

import java.sql.SQLException;
import java.util.List;

public class ProductService {

    private ProductDAO productDAO = new ProductDAO();
    private CategoryDAO categoryDAO = new CategoryDAO();
    private BrandDAO brandDAO = new BrandDAO();

    public List<ProductModel> getAllProducts() throws SQLException {
        return productDAO.getAllProducts();
    }

    public List<ProductModel> searchProducts(String keyword, int categoryId, int brandId) throws SQLException {
        return productDAO.searchProducts(keyword, categoryId, brandId);
    }

    public ProductModel getProductById(int id) throws SQLException {
        return productDAO.getProductById(id);
    }

    public List<CategoryModel> getAllCategories() throws SQLException {
        return categoryDAO.getAllCategories();
    }

    public List<BrandModel> getAllBrands() throws SQLException {
        return brandDAO.getAllBrands();
    }

    // Validate and add
    public String addProduct(String name, String description, String price,
                             String stock, String imagePath, String categoryId, String brandId) {
        if (ValidationUtil.isEmpty(name)) return "Product name is required.";
        if (ValidationUtil.isEmpty(price) || !ValidationUtil.isValidPrice(price))
            return "Please enter a valid price.";
        if (ValidationUtil.isEmpty(stock) || !ValidationUtil.isValidStock(stock))
            return "Please enter a valid stock quantity.";
        if (ValidationUtil.isEmpty(categoryId) || categoryId.equals("0"))
            return "Please select a category.";
        if (ValidationUtil.isEmpty(brandId) || brandId.equals("0"))
            return "Please select a brand.";

        try {
            ProductModel p = new ProductModel();
            p.setName(name.trim());
            p.setDescription(description);
            p.setPrice(Double.parseDouble(price));
            p.setStock(Integer.parseInt(stock));
            p.setImagePath(imagePath);
            p.setCategoryId(Integer.parseInt(categoryId));
            p.setBrandId(Integer.parseInt(brandId));
            return productDAO.addProduct(p) ? "success" : "Failed to add product. Please try again.";
        } catch (SQLException e) {
            e.printStackTrace();
            return "Database error. Please try again.";
        }
    }

    // Validate and update
    public String updateProduct(int id, String name, String description, String price,
                                String stock, String imagePath, String categoryId, String brandId) {
        if (ValidationUtil.isEmpty(name)) return "Product name is required.";
        if (ValidationUtil.isEmpty(price) || !ValidationUtil.isValidPrice(price))
            return "Please enter a valid price.";
        if (ValidationUtil.isEmpty(stock) || !ValidationUtil.isValidStock(stock))
            return "Please enter a valid stock quantity.";
        if (ValidationUtil.isEmpty(categoryId) || categoryId.equals("0"))
            return "Please select a category.";
        if (ValidationUtil.isEmpty(brandId) || brandId.equals("0"))
            return "Please select a brand.";

        try {
            ProductModel p = new ProductModel();
            p.setId(id);
            p.setName(name.trim());
            p.setDescription(description);
            p.setPrice(Double.parseDouble(price));
            p.setStock(Integer.parseInt(stock));
            p.setImagePath(imagePath.isEmpty() ? null : imagePath);
            p.setCategoryId(Integer.parseInt(categoryId));
            p.setBrandId(Integer.parseInt(brandId));
            return productDAO.updateProduct(p) ? "success" : "Failed to update product.";
        } catch (SQLException e) {
            e.printStackTrace();
            return "Database error. Please try again.";
        }
    }

    public boolean deleteProduct(int id) throws SQLException {
        return productDAO.deleteProduct(id);
    }
}
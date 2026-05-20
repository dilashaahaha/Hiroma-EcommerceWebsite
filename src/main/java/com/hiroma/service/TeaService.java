package com.hiroma.service;

import com.hiroma.dao.TeaDAO;
import com.hiroma.model.TeaModel;
import com.hiroma.util.ValidationUtil;

import java.sql.SQLException;
import java.util.List;

public class TeaService {

    private TeaDAO teaDAO = new TeaDAO();

    public List<TeaModel> getAllTeas() throws SQLException {
        return teaDAO.getAllTeas();
    }

    public List<TeaModel> searchTeas(String keyword) throws SQLException {
        return teaDAO.searchTeas(keyword);
    }

    public List<TeaModel> getTeasByCategory(int categoryId) throws SQLException {
        return teaDAO.getTeasByCategory(categoryId);
    }

    public TeaModel getTeaById(int id) throws SQLException {
        return teaDAO.getTeaById(id);
    }

    public List<TeaModel> getFeaturedTeas() throws SQLException {
        return teaDAO.getFeaturedTeas();
    }

    public String addTea(String name, String description, String price,
                          String stock, String imagePath, String categoryId, String brandId) {
        if (ValidationUtil.isEmpty(name)) return "Product name is required.";
        if (ValidationUtil.isEmpty(price) || !ValidationUtil.isValidPrice(price))
            return "Please enter a valid price.";
        if (ValidationUtil.isEmpty(stock) || !ValidationUtil.isValidStock(stock))
            return "Please enter a valid stock quantity.";

        try {
            TeaModel tea = new TeaModel();
            tea.setName(name);
            tea.setDescription(description);
            tea.setPrice(Double.parseDouble(price));
            tea.setStock(Integer.parseInt(stock));
            tea.setImagePath(imagePath);
            tea.setCategoryId(Integer.parseInt(categoryId));
            tea.setBrandId(Integer.parseInt(brandId));
            return teaDAO.addTea(tea) ? "success" : "Failed to add product.";
        } catch (SQLException e) {
            e.printStackTrace();
            return "Database error.";
        }
    }

    public String updateTea(String id, String name, String description, String price,
                             String stock, String imagePath, String categoryId, String brandId) {
        if (ValidationUtil.isEmpty(name)) return "Product name is required.";
        if (ValidationUtil.isEmpty(price) || !ValidationUtil.isValidPrice(price))
            return "Please enter a valid price.";
        if (ValidationUtil.isEmpty(stock) || !ValidationUtil.isValidStock(stock))
            return "Please enter a valid stock quantity.";

        try {
            TeaModel tea = new TeaModel();
            tea.setId(Integer.parseInt(id));
            tea.setName(name);
            tea.setDescription(description);
            tea.setPrice(Double.parseDouble(price));
            tea.setStock(Integer.parseInt(stock));
            tea.setImagePath(imagePath);
            tea.setCategoryId(Integer.parseInt(categoryId));
            tea.setBrandId(Integer.parseInt(brandId));
            return teaDAO.updateTea(tea) ? "success" : "Failed to update product.";
        } catch (SQLException e) {
            e.printStackTrace();
            return "Database error.";
        }
    }

    public boolean deleteTea(int id) throws SQLException {
        return teaDAO.deleteTea(id);
    }
}
package com.hiroma.controller;

import com.hiroma.dao.CategoryDAO;
import com.hiroma.dao.TeaDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import com.hiroma.model.TeaModel;

@WebServlet("/shop")
public class ShopServlet extends HttpServlet {

    private TeaDAO teaDAO = new TeaDAO();
    private CategoryDAO categoryDAO = new CategoryDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String keyword = request.getParameter("search");
            String categoryIdStr = request.getParameter("categoryId");

            List<TeaModel> teas;

            if (keyword != null && !keyword.trim().isEmpty()) {
                teas = teaDAO.searchTeas(keyword);
                request.setAttribute("keyword", keyword);
            } else if (categoryIdStr != null && !categoryIdStr.isEmpty()) {
                teas = teaDAO.getTeasByCategory(Integer.parseInt(categoryIdStr));
                request.setAttribute("selectedCategory", Integer.parseInt(categoryIdStr));
            } else {
                teas = teaDAO.getAllTeas();
            }

            request.setAttribute("teas", teas);
            request.setAttribute("categories", categoryDAO.getAllCategories());
            request.getRequestDispatcher("/WEB-INF/views/pages/shop.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/home");
        }
    }
}
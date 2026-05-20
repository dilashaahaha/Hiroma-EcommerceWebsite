package com.hiroma.controller;

import com.hiroma.dao.BrandDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/admin/brands")
public class BrandServlet extends HttpServlet {

    private BrandDAO brandDAO = new BrandDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.setAttribute("brands", brandDAO.getAllBrands());
            request.getRequestDispatcher("/WEB-INF/views/admin/manageBrands.jsp")
                   .forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            switch (action) {
                case "add":
                    brandDAO.addBrand(
                        request.getParameter("name"),
                        request.getParameter("origin"),
                        request.getParameter("description")
                    );
                    break;
                case "edit":
                    brandDAO.updateBrand(
                        Integer.parseInt(request.getParameter("id")),
                        request.getParameter("name"),
                        request.getParameter("origin"),
                        request.getParameter("description")
                    );
                    break;
                case "delete":
                    brandDAO.deleteBrand(Integer.parseInt(request.getParameter("id")));
                    break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath() + "/admin/brands");
    }
}
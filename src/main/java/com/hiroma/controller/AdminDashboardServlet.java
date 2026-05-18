package com.hiroma.controller;

import com.hiroma.dao.DashboardDAO;
import com.hiroma.model.UserModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {

    private DashboardDAO dashboardDAO = new DashboardDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            UserModel admin = (UserModel) request.getSession().getAttribute("loggedInUser");

            request.setAttribute("adminName", admin.getFullName());
            request.setAttribute("totalProducts", dashboardDAO.getTotalProducts());
            request.setAttribute("totalOrders", dashboardDAO.getTotalOrders());
            request.setAttribute("totalUsers", dashboardDAO.getTotalUsers());
            request.setAttribute("pendingUsers", dashboardDAO.getPendingUsers());
            request.setAttribute("recentOrders", dashboardDAO.getRecentOrders());
            request.setAttribute("categoryStats", dashboardDAO.getCategoryStats());

            request.getRequestDispatcher("/WEB-INF/views/admin/adminDashboard.jsp")
                   .forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error");
        }
    }
}
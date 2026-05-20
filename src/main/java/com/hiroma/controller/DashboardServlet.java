package com.hiroma.controller;

import com.hiroma.dao.OrderDAO;
import com.hiroma.model.TeaModel;
import com.hiroma.model.UserModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    private OrderDAO orderDAO = new OrderDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserModel user = (UserModel) request.getSession().getAttribute("loggedInUser");
        try {
            request.setAttribute("orders", orderDAO.getOrdersByUser(user.getId()));
            request.setAttribute("orderCount", orderDAO.getOrderCountByUser(user.getId()));
            List<TeaModel> wishlist = (List<TeaModel>) request.getSession().getAttribute("wishlist");
            request.setAttribute("wishlistCount", wishlist != null ? wishlist.size() : 0);
            request.getRequestDispatcher("/WEB-INF/views/user/dashboard.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.getRequestDispatcher("/WEB-INF/views/user/dashboard.jsp").forward(request, response);
        }
    }
}
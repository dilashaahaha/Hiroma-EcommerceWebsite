package com.hiroma.controller;

import com.hiroma.dao.ReviewDao;
import com.hiroma.model.UserModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/review")
public class ReviewServlet extends HttpServlet {

    private ReviewDao reviewDao = new ReviewDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserModel user = (UserModel) request.getSession().getAttribute("loggedInUser");
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int rating = Integer.parseInt(request.getParameter("rating"));
            String comment = request.getParameter("comment");

            reviewDao.addReview(user.getId(), productId, rating, comment);
            response.sendRedirect(request.getContextPath() + "/tea?id=" + productId + "&success=Review submitted.");
        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/shop");
        }
    }
}
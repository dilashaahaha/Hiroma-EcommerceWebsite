package com.hiroma.controller;

import com.hiroma.dao.ReviewDao;
import com.hiroma.dao.TeaDAO;
import com.hiroma.model.TeaModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/tea")
public class TeaDetailServlet extends HttpServlet {

    private TeaDAO teaDAO = new TeaDAO();
    private ReviewDao reviewDao = new ReviewDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String idStr = request.getParameter("id");
            if (idStr == null) {
                response.sendRedirect(request.getContextPath() + "/shop");
                return;
            }
            int id = Integer.parseInt(idStr);
            TeaModel tea = teaDAO.getTeaById(id);
            if (tea == null) {
                response.sendRedirect(request.getContextPath() + "/shop");
                return;
            }
            request.setAttribute("tea", tea);
            request.setAttribute("reviews", reviewDao.getReviewsByProduct(id));
            request.getRequestDispatcher("/WEB-INF/views/pages/teaDetail.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/shop");
        }
    }
}
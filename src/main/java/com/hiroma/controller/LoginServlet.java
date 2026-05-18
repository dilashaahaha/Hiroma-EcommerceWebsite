package com.hiroma.controller;

import com.hiroma.model.UserModel;
import com.hiroma.service.LoginService;
import com.hiroma.util.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private LoginService loginService = new LoginService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/public/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            UserModel user = loginService.loginUser(email, password);

            if (user == null) {
                request.setAttribute("error", "Invalid email or password.");
                request.getRequestDispatcher("/WEB-INF/views/public/login.jsp").forward(request, response);
                return;
            }

            if (user.getStatus().equals("pending")) {
                request.setAttribute("error", "Your account is pending admin approval.");
                request.getRequestDispatcher("/WEB-INF/views/public/login.jsp").forward(request, response);
                return;
            }

            if (user.getStatus().equals("rejected")) {
                request.setAttribute("error", "Your account has been rejected. Contact support.");
                request.getRequestDispatcher("/WEB-INF/views/public/login.jsp").forward(request, response);
                return;
            }

            // Set session
            SessionUtil.setUser(request.getSession(), user);
            SessionUtil.setRole(request.getSession(), user.getRole());

            // Redirect based on role
            if (user.getRole().equals("admin")) {
                response.sendRedirect(request.getContextPath() + "/admin/dashboard");
            } else {
                response.sendRedirect(request.getContextPath() + "/dashboard");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error. Please try again.");
            request.getRequestDispatcher("/WEB-INF/views/public/login.jsp").forward(request, response);
        }
    }
}
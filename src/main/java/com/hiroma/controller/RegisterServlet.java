package com.hiroma.controller;

import com.hiroma.service.RegisterService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private RegisterService registerService = new RegisterService();

    // Show registration page
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/public/register.jsp").forward(request, response);
    }

    // Handle form submission
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String dob = request.getParameter("dob");

        String result = registerService.registerUser(fullName, email, phone, password, confirmPassword, dob);

        if (result.equals("success")) {
            response.sendRedirect(request.getContextPath() + "/pendingApproval");
        } else {
            request.setAttribute("error", result);
            request.getRequestDispatcher("/WEB-INF/views/public/register.jsp").forward(request, response);
        }
    }
}
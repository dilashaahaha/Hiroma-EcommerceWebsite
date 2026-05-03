package com.hiroma.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.hiroma.util.PasswordUtil;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RegisterServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/authentication/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String firstName       = request.getParameter("firstName").trim();
        String lastName        = request.getParameter("lastName").trim();
        String email           = request.getParameter("email").trim();
        String phone           = request.getParameter("phone").trim();
        String role            = request.getParameter("role");
        String password        = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // 1. Empty fields
        if (firstName.isEmpty() || lastName.isEmpty() || email.isEmpty() ||
            phone.isEmpty() || role == null || password.isEmpty() || confirmPassword.isEmpty()) {
            request.setAttribute("error", "All fields are required.");
            request.getRequestDispatcher("/authentication/register.jsp").forward(request, response);
            return;
        }

        // 2. Name letters only
        if (!firstName.matches("[a-zA-Z]+") || !lastName.matches("[a-zA-Z]+")) {
            request.setAttribute("error", "Name must contain letters only.");
            request.getRequestDispatcher("/authentication/register.jsp").forward(request, response);
            return;
        }

        // 3. Email format
        if (!email.matches("^[\\w.-]+@[\\w.-]+\\.[a-zA-Z]{2,}$")) {
            request.setAttribute("error", "Invalid email format.");
            request.getRequestDispatcher("/authentication/register.jsp").forward(request, response);
            return;
        }

        // 4. Nepali phone format
        if (!phone.matches("^(97|98)\\d{8}$")) {
            request.setAttribute("error", "Phone must be a valid Nepali number (e.g. 98XXXXXXXX).");
            request.getRequestDispatcher("/authentication/register.jsp").forward(request, response);
            return;
        }

        // 5. Password minimum length
        if (password.length() < 8) {
            request.setAttribute("error", "Password must be at least 8 characters.");
            request.getRequestDispatcher("/authentication/register.jsp").forward(request, response);
            return;
        }

        // 6. Passwords match
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match.");
            request.getRequestDispatcher("/authentication/register.jsp").forward(request, response);
            return;
        }

        // Hash password
        String hashedPassword = PasswordUtil.hashSHA256(password);
        System.out.println("User: " + firstName + " " + lastName);
        System.out.println("Email: " + email);
        System.out.println("Hashed Password: " + hashedPassword);

        // Redirect to login
        response.sendRedirect(request.getContextPath() + "/authentication/login.jsp?registered=true");
    }
}
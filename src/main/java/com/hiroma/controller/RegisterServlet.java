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

        boolean hasError = false;

        // 1. First name
        if (firstName.isEmpty()) {
            request.setAttribute("firstNameError", "First name is required.");
            hasError = true;
        } else if (!firstName.matches("[a-zA-Z ]+")) {
            request.setAttribute("firstNameError", "Letters only, no numbers.");
            hasError = true;
        }

        // 2. Last name
        if (lastName.isEmpty()) {
            request.setAttribute("lastNameError", "Last name is required.");
            hasError = true;
        } else if (!lastName.matches("[a-zA-Z ]+")) {
            request.setAttribute("lastNameError", "Letters only, no numbers.");
            hasError = true;
        }

        // 3. Email
        if (email.isEmpty()) {
            request.setAttribute("emailError", "Email address is required.");
            hasError = true;
        } else if (!email.matches("^[\\w.-]+@[\\w.-]+\\.[a-zA-Z]{2,}$")) {
            request.setAttribute("emailError", "Invalid email format (e.g. you@email.com).");
            hasError = true;
        }

        // 4. Phone
        if (phone.isEmpty()) {
            request.setAttribute("phoneError", "Phone number is required.");
            hasError = true;
        } else if (!phone.matches("^(97|98)\\d{8}$")) {
            request.setAttribute("phoneError", "Must be 10 digits starting with 97 or 98.");
            hasError = true;
        }

        

        // 5. Password
        if (password.isEmpty()) {
            request.setAttribute("passwordError", "Password is required.");
            hasError = true;
        } else if (password.length() < 8) {
            request.setAttribute("passwordError", "Password must be at least 8 characters.");
            hasError = true;
        }

        // 6. Confirm password
        if (confirmPassword.isEmpty()) {
            request.setAttribute("confirmPasswordError", "Please confirm your password.");
            hasError = true;
        } else if (!password.isEmpty() && !password.equals(confirmPassword)) {
            request.setAttribute("confirmPasswordError", "Passwords do not match.");
            hasError = true;
        }

        // Forward back if any error
        if (hasError) {
            request.getRequestDispatcher("/authentication/register.jsp").forward(request, response);
            return;
        }

        // All valid
        String hashedPassword = PasswordUtil.hashSHA256(password);
        System.out.println("User: " + firstName + " " + lastName);
        System.out.println("Email: " + email);
        System.out.println("Hashed Password: " + hashedPassword);

        response.sendRedirect(request.getContextPath() + "/authentication/login.jsp?registered=true");
    }
}
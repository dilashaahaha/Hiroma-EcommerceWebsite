package com.hiroma.controller;

import com.hiroma.dao.UserDAO;
import com.hiroma.model.UserModel;
import com.hiroma.util.PasswordUtil;
import com.hiroma.util.ValidationUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

@WebServlet("/user/profile")
public class ProfileServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/user/profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserModel user = (UserModel) request.getSession().getAttribute("loggedInUser");
        String action = request.getParameter("action");

        try {
            if ("updateProfile".equals(action)) {
                String fullName = request.getParameter("fullName");
                String phone = request.getParameter("phone");
                String dob = request.getParameter("dob");

                if (!ValidationUtil.isValidName(fullName)) {
                    request.setAttribute("error", "Name must contain letters only.");
                    request.getRequestDispatcher("/WEB-INF/views/user/profile.jsp").forward(request, response);
                    return;
                }
                if (!ValidationUtil.isValidPhone(phone)) {
                    request.setAttribute("error", "Phone must be 10 digits.");
                    request.getRequestDispatcher("/WEB-INF/views/user/profile.jsp").forward(request, response);
                    return;
                }

                user.setFullName(fullName);
                user.setPhone(phone);
                user.setDob(Date.valueOf(dob));
                userDAO.updateUser(user);
                request.getSession().setAttribute("loggedInUser", user);
                request.setAttribute("success", "Your profile was updated successfully.");
                request.getRequestDispatcher("/WEB-INF/views/user/profile.jsp").forward(request, response);

            } else if ("changePassword".equals(action)) {
                String currentPassword = request.getParameter("currentPassword");
                String newPassword = request.getParameter("newPassword");
                String confirmPassword = request.getParameter("confirmPassword");

                if (!PasswordUtil.verify(currentPassword, user.getPassword())) {
                    request.setAttribute("error", "Current password is incorrect.");
                    request.getRequestDispatcher("/WEB-INF/views/user/profile.jsp").forward(request, response);
                    return;
                }
                if (!newPassword.equals(confirmPassword)) {
                    request.setAttribute("error", "New passwords do not match.");
                    request.getRequestDispatcher("/WEB-INF/views/user/profile.jsp").forward(request, response);
                    return;
                }
                if (!ValidationUtil.isValidPassword(newPassword)) {
                    request.setAttribute("error", "Password must be at least 6 characters.");
                    request.getRequestDispatcher("/WEB-INF/views/user/profile.jsp").forward(request, response);
                    return;
                }

                userDAO.updatePassword(user.getId(), PasswordUtil.encrypt(newPassword));
                user.setPassword(PasswordUtil.encrypt(newPassword));
                request.getSession().setAttribute("loggedInUser", user);
                request.setAttribute("success", "Password changed successfully.");
                request.getRequestDispatcher("/WEB-INF/views/user/profile.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error. Please try again.");
            request.getRequestDispatcher("/WEB-INF/views/user/profile.jsp").forward(request, response);
        }
    }
}
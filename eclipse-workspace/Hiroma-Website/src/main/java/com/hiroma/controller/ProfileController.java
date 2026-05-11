/**
 * ProfileController: Uses SessionUtil to read/write session attributes
 * 					  Session attribute key "user" holds the full User object
 * Location: src/main/java/com.hiroma.controller
   Author: M3
 * URL mapping: /ProfileController
 */

package com.hiroma.controller;

import com.hiroma.dao.UserDAO;
import com.hiroma.model.User;
import com.hiroma.util.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ProfileController")
public class ProfileController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // AuthFilter already guards this URL, but double-check session
        User user = (User) SessionUtil.getAttribute(request, "user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/LoginController");
            return;
        }

        // Pass user to JSP as request attribute (EL: ${user.fullName} etc.)
        request.setAttribute("user", user);
        request.getRequestDispatcher("/user/profile.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = (User) SessionUtil.getAttribute(request, "user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/LoginController");
            return;
        }

        String action = request.getParameter("action");

        if ("updateProfile".equals(action)) {
            handleUpdateProfile(request, response, user);
        } else if ("changePassword".equals(action)) {
            handleChangePassword(request, response, user);
        } else {
            response.sendRedirect(request.getContextPath() + "/ProfileController");
        }
    }

    private void handleUpdateProfile(HttpServletRequest request,
                                     HttpServletResponse response,
                                     User user)
            throws ServletException, IOException {

        String fullName = request.getParameter("fullName");
        String phone    = request.getParameter("phone");

        if (fullName == null || fullName.isEmpty()) {
            request.setAttribute("errorMessage", "Full name cannot be empty.");
            request.setAttribute("user", user);
            request.getRequestDispatcher("/user/profile.jsp").forward(request, response);
            return;
        }

        // Update in database via UserDAO
        boolean updated = userDAO.updateUserProfile(user.getUserId(), fullName, phone);

        if (updated) {
            user.setFullName(fullName);
            user.setPhone(phone != null ? phone : "");
            SessionUtil.setAttribute(request, "user",     user,              3600);
            SessionUtil.setAttribute(request, "userName", user.getFullName(), 3600);
            SessionUtil.setAttribute(request, "successMessage", "Profile updated successfully!", 60);
        } else {
            SessionUtil.setAttribute(request, "errorMessage", "No changes were saved. Please try again.", 60);
        }

        response.sendRedirect(request.getContextPath() + "/ProfileController");
    }

    private void handleChangePassword(HttpServletRequest request,
                                      HttpServletResponse response,
                                      User user)
            throws ServletException, IOException {

        String currentPassword    = request.getParameter("currentPassword");
        String newPassword        = request.getParameter("newPassword");
        String confirmNewPassword = request.getParameter("confirmNewPassword");

        // Validation
        if (currentPassword == null || currentPassword.isEmpty()
                || newPassword == null || newPassword.isEmpty()
                || confirmNewPassword == null || confirmNewPassword.isEmpty()) {
            SessionUtil.setAttribute(request, "errorMessage", "All password fields are required.", 60);
            response.sendRedirect(request.getContextPath() + "/ProfileController");
            return;
        }

        if (!newPassword.equals(confirmNewPassword)) {
            SessionUtil.setAttribute(request, "errorMessage", "New passwords do not match.", 60);
            response.sendRedirect(request.getContextPath() + "/ProfileController");
            return;
        }

        if (newPassword.length() < 6) {
            SessionUtil.setAttribute(request, "errorMessage", "New password must be at least 6 characters.", 60);
            response.sendRedirect(request.getContextPath() + "/ProfileController");
            return;
        }

        User dbUser = userDAO.getUserByEmailAndPassword(user.getEmail(), currentPassword);
        if (dbUser == null) {
            SessionUtil.setAttribute(request, "errorMessage", "Current password is incorrect.", 60);
            response.sendRedirect(request.getContextPath() + "/ProfileController");
            return;
        }

        // Update password in DB
        SessionUtil.setAttribute(request, "successMessage", "Password changed successfully!", 60);
        response.sendRedirect(request.getContextPath() + "/ProfileController");
    }
}

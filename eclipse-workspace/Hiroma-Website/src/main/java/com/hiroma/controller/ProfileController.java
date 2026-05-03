package com.hiroma.controller;

import com.hiroma.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 * ProfileController
 * Handles GET  → loads profile.jsp with user data from session
 * Handles POST → dispatches to updateProfile or changePassword
 * URL mapping: /ProfileController
 *
 * NOTE: This is a demo version — no real DB calls.
 *       Session attributes set by LoginController are used directly.
 *       Swap the TODO sections with real UserService calls once you pull
 *       the leader's code.
 */
@WebServlet("/ProfileController")
public class ProfileController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // ── GET ───────────────────────────────────────────────────────────────
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	HttpSession session = request.getSession(false);

    	if (session == null || session.getAttribute("user") == null) {
    	    response.sendRedirect(request.getContextPath() + "/LoginController");
    	    return;
    	}

    	User user = (User) session.getAttribute("user");
    	request.setAttribute("user", user);

    	request.getRequestDispatcher("/user/profile.jsp")
    	       .forward(request, response);
    }
    // ── POST ──────────────────────────────────────────────────────────────
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Guard: must be logged in
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/LoginController");
            return;
        }

        String action = request.getParameter("action");

        if ("updateProfile".equals(action)) {
            handleUpdateProfile(request, response, session);
        } else if ("changePassword".equals(action)) {
            handleChangePassword(request, response, session);
        } else {
            // Unknown action — just reload profile
            response.sendRedirect(request.getContextPath() + "/ProfileController");
        }
    }

    // ── Update Profile ────────────────────────────────────────────────────
    private void handleUpdateProfile(HttpServletRequest request,
                                     HttpServletResponse response,
                                     HttpSession session)
            throws ServletException, IOException {

        String fullName = request.getParameter("fullName");
        String phone    = request.getParameter("phone");

        // Basic validation
        if (fullName == null || fullName.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Full name cannot be empty.");
            doGet(request, response);
            return;
        }

        User user = (User) session.getAttribute("user");

        // TODO: call userService.updateProfile(user.getUserId(), fullName.trim(), phone)
        //       and check the return value before updating session.
        //       For demo, we update the in-memory User object directly.
        user.setFullName(fullName.trim());
        user.setPhone(phone != null ? phone.trim() : "");

        // Refresh session attributes so navbar / other pages stay consistent
        session.setAttribute("user",     user);
        session.setAttribute("userName", user.getFullName());

        session.setAttribute("successMessage", "Profile updated successfully!");
        response.sendRedirect(request.getContextPath() + "/ProfileController");
    }

    // ── Change Password ───────────────────────────────────────────────────
    private void handleChangePassword(HttpServletRequest request,
                                      HttpServletResponse response,
                                      HttpSession session)
            throws ServletException, IOException {

        String currentPassword    = request.getParameter("currentPassword");
        String newPassword        = request.getParameter("newPassword");
        String confirmNewPassword = request.getParameter("confirmNewPassword");

        // ── Validation ────────────────────────────────────────────────────
        if (currentPassword == null || currentPassword.isEmpty()
                || newPassword == null || newPassword.isEmpty()
                || confirmNewPassword == null || confirmNewPassword.isEmpty()) {
            request.setAttribute("errorMessage", "All password fields are required.");
            doGet(request, response);
            return;
        }

        if (!newPassword.equals(confirmNewPassword)) {
            request.setAttribute("errorMessage", "New passwords do not match.");
            doGet(request, response);
            return;
        }

        if (newPassword.length() < 6) {
            request.setAttribute("errorMessage", "New password must be at least 6 characters.");
            doGet(request, response);
            return;
        }

        User user = (User) session.getAttribute("user");

        // TODO: replace demo check with real DB verification via userService
        //       e.g. boolean valid = userService.verifyPassword(user.getUserId(), currentPassword);
        // Demo: compare against whatever passwordHash is stored in the session user
        String storedPassword = user.getPasswordHash();
        if (storedPassword != null && !storedPassword.equals(currentPassword)) {
            request.setAttribute("errorMessage", "Current password is incorrect.");
            doGet(request, response);
            return;
        }

        // TODO: call userService.updatePassword(user.getUserId(), newPassword)
        //       For demo, update in-memory only.
        user.setPasswordHash(newPassword);
        session.setAttribute("user", user);

        session.setAttribute("successMessage", "Password changed successfully!");
        response.sendRedirect(request.getContextPath() + "/ProfileController");
    }
}

package com.hiroma.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 * LogoutServlet
 * Invalidates the session, clears the remember-me cookie,
 * then redirects to login page.
 * URL mapping: /LogoutController
 */
@WebServlet("/LogoutController")
public class LogoutServlet extends HttpServlet {

    private static final long   serialVersionUID = 1L;
    private static final String COOKIE_NAME      = "hiroma_remember";

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Invalidate the session
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        // 2. Delete the remember-me cookie
        Cookie cookie = new Cookie(COOKIE_NAME, "");
        cookie.setMaxAge(0); // tells browser to delete it
        cookie.setPath("/");
        response.addCookie(cookie);

        // 3. Flash message and redirect to login
        HttpSession newSession = request.getSession(true);
        newSession.setAttribute("successMessage", "You have been logged out successfully.");

        response.sendRedirect(
            request.getContextPath() + "/authentication/login.jsp");
    }
}

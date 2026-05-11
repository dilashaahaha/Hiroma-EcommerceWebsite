/**
 * LoginController: Handles GET and POST → validates credentials via UserDAO, creates session, sets cookie
 * Location: src/main/java/com.hiroma.controller
   Author: M3
 * URL mapping: /LoginController
 */

package com.hiroma.controller;

import com.hiroma.dao.UserDAO;
import com.hiroma.model.User;
import com.hiroma.util.CookieUtil;
import com.hiroma.util.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Cookie name for remember-me
    private static final String COOKIE_LAST_LOGIN = "hiroma_last_login";
    private static final String COOKIE_REMEMBER   = "hiroma_remember";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        if (SessionUtil.getAttribute(request, "user") != null) {
            response.sendRedirect(request.getContextPath() + "/ProfileController");
            return;
        }


        String remembered = CookieUtil.getCookieValue(request, COOKIE_REMEMBER);
        if (remembered != null) {
            request.setAttribute("rememberedEmail", remembered);
        }
        
        System.out.println("remember param: " + request.getParameter("rememberMe"));
        
        request.getRequestDispatcher("/authentication/login.jsp")
               .forward(request, response);
    }

    // ── POST ──────────────────────────────────────────────────────────────
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Fetch user information from form
        String email    = request.getParameter("email");
        String password = request.getParameter("password");
        String remember = request.getParameter("rememberMe"); // "on" or null

        // Basic input validation (aligned with teacher's LoginService pattern)
        if (email == null || email.isEmpty()) {
            request.setAttribute("errorMessage", "Email is required.");
            request.setAttribute("enteredEmail", email);
            request.getRequestDispatcher("/authentication/login.jsp").forward(request, response);
            return;
        }
        if (password == null || password.isEmpty()) {
            request.setAttribute("errorMessage", "Password is required.");
            request.setAttribute("enteredEmail", email);
            request.getRequestDispatcher("/authentication/login.jsp").forward(request, response);
            return;
        }

        // Use UserDAO to fetch and verify the user (replaces all demo credential checks)
        UserDAO userDAO = new UserDAO();
        User user = userDAO.getUserByEmailAndPassword(email, password);

        if (user == null) {
            // Credentials do not match any real user in DB
            request.setAttribute("errorMessage", "Invalid email or password. Please try again.");
            request.setAttribute("enteredEmail", email);
            request.getRequestDispatcher("/authentication/login.jsp").forward(request, response);
            return;
        }

        // ── Login successful ──────────────────────────────────────────────

        // 1. Store user object in session using SessionUtil (teacher's pattern)
        //    Session timeout: 3600 seconds (1 hour), same as teacher's example
        SessionUtil.setAttribute(request, "user", user, 3600);

        // 2. Store supporting session attributes for easy EL access in JSPs
        SessionUtil.setAttribute(request, "userId",    user.getUserId(),   3600);
        SessionUtil.setAttribute(request, "userName",  user.getFullName(), 3600);
        SessionUtil.setAttribute(request, "userEmail", user.getEmail(),    3600);
        SessionUtil.setAttribute(request, "userRole",  user.getRole(),     3600);

        // 3. Cookie: record last login time (aligned with teacher's cookie example)
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd_HH:mm:ss");
        String loginTime = now.format(formatter);
        CookieUtil.addCookie(response, COOKIE_LAST_LOGIN, loginTime, 3600);

        // 4. Handle remember-me cookie (stores email for pre-fill on next visit)
        if ("on".equals(remember)) {
            CookieUtil.addCookie(response, COOKIE_REMEMBER, email, 7 * 24 * 60 * 60);
        } else {
            // Clear any existing remember-me cookie
            CookieUtil.deleteCookie(response, COOKIE_REMEMBER);
        }

        // 5. Redirect to profile page
        response.sendRedirect(request.getContextPath() + "/ProfileController");
    }
}

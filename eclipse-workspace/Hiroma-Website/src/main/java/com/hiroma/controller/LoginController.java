package com.hiroma.controller;

import com.hiroma.dao.UserDAO;
import com.hiroma.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 * LoginController  (DEMO version)
 * ─────────────────────────────────────────────────────────────────────────
 * This is a TEMPORARY demo servlet so the session / cookie / filter work
 * can be tested without pulling the leader's real LoginServlet from git.
 *
 * It accepts ONE hard-coded test account:
 *   email:    demo@hiroma.com
 *   password: demo123
 *   role:     customer
 *
 * Remove / replace this file once you pull the leader's LoginServlet.
 *
 * GET  → shows login.jsp (pre-fills email from remember-me cookie if present)
 * POST → validates demo credentials, creates session, sets cookie
 * URL: /LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // ── Demo credentials ──────────────────────────────────────────────────
    private static final String DEMO_EMAIL    = "demo@hiroma.com";
    private static final String DEMO_PASSWORD = "demo123";

    // ── Cookie ────────────────────────────────────────────────────────────
    private static final String COOKIE_NAME    = "hiroma_remember";
    private static final int    COOKIE_MAX_AGE = 7 * 24 * 60 * 60; // 7 days

    // ── GET ───────────────────────────────────────────────────────────────
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        // Already logged in → go home
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
        	response.sendRedirect(request.getContextPath() + "/ProfileController");
            return;
        }

        // Check remember-me cookie → pre-fill email
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {
                if (COOKIE_NAME.equals(c.getName())) {
                    request.setAttribute("rememberedEmail", c.getValue());
                    break;
                }
            }
        }

        request.getRequestDispatcher("/user/login.jsp")
               .forward(request, response);
    }

    // ── POST ──────────────────────────────────────────────────────────────
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String email      = request.getParameter("email");
        String password   = request.getParameter("password");
        String rememberMe = request.getParameter("rememberMe"); // "on" or null

        // ── Basic validation ──────────────────────────────────────────────
        if (email == null || email.trim().isEmpty()
                || password == null || password.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Please enter both email and password.");
            request.getRequestDispatcher("/user/login.jsp")
                   .forward(request, response);
            return;
        }
        
        if (email.trim().equals("demo@hiroma.com") && password.equals("demo123")) {

            User user = new User();
            user.setUserId(1);
            user.setEmail(email);
            user.setFullName("Demo User");
            user.setRole("customer");

            HttpSession session = request.getSession(true);
            session.setAttribute("user", user);

            response.sendRedirect(request.getContextPath() + "/ProfileController");
            return;
        }
        
        System.out.println("=== LOGIN ATTEMPT ===");
        System.out.println("Email: [" + email.trim() + "]");
        System.out.println("Password: [" + password + "]");
        System.out.println("Store size: " + DemoUserStore.USERS.size());
        // ── Demo credential check ─────────────────────────────────────────
        // TODO: swap this block with your leader's UserDAO/UserService call:
        //       User user = userService.getUserByEmailAndPassword(email.trim(), password);
        UserDAO dao = new UserDAO();
        User user = dao.getUserByEmailAndPassword(email.trim(), password);
        if (user == null) {
            request.setAttribute("errorMessage", "Invalid email or password. Please try again.");
            request.setAttribute("enteredEmail", email);
            request.getRequestDispatcher("/user/login.jsp")
                   .forward(request, response);
            return;
        }

        // ── Login successful ──────────────────────────────────────────────

        // 1. Invalidate old session, create fresh one (security best practice)
        HttpSession oldSession = request.getSession(false);
        if (oldSession != null) oldSession.invalidate();

        HttpSession session = request.getSession(true);

        // 2. Store user data in session
        session.setAttribute("user",      user);
        session.setAttribute("userId",    user.getUserId());
        session.setAttribute("userName",  user.getFullName());
        session.setAttribute("userEmail", user.getEmail());
        session.setAttribute("userRole",  user.getRole());

        // 3. Session timeout: 30 minutes of inactivity
        session.setMaxInactiveInterval(30 * 60);

        // 4. Handle Remember Me cookie
        if ("on".equals(rememberMe)) {
            Cookie cookie = new Cookie(COOKIE_NAME, email.trim());
            cookie.setMaxAge(COOKIE_MAX_AGE);
            cookie.setPath("/");
            response.addCookie(cookie);
        } else {
            // Wipe any existing remember-me cookie
            Cookie cookie = new Cookie(COOKIE_NAME, "");
            cookie.setMaxAge(0);
            cookie.setPath("/");
            response.addCookie(cookie);
        }

        // 5. Flash welcome message
        session.setAttribute("successMessage", "Welcome back, " + user.getFullName() + "!");

        // 6. Redirect based on role
        if ("admin".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/admin/dashboard.jsp");
        } else {
        	response.sendRedirect(request.getContextPath() + "/ProfileController");
        }
    }
}

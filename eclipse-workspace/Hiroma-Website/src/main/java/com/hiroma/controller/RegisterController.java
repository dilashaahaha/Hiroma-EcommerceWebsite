package com.hiroma.controller;

import com.hiroma.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * RegisterController  (DEMO version)
 * ─────────────────────────────────────────────────────────────────────────
 * TEMPORARY demo servlet — stores newly registered users in a static
 * in-memory list instead of a real DB.  Lets you test the full
 * register → login → profile flow without the leader's DAO code.
 *
 * Remove / replace with the real RegisterServlet once you pull from git.
 *
 * GET  → shows register.jsp
 * POST → validates input, creates demo User, redirects to login
 * URL: /RegisterController
 */
@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * In-memory "database" for demo.
     * Static so it persists across requests within the same server session.
     * TODO: remove once real UserDAO is wired in.
     */
    private static final List<User> DEMO_USERS = new ArrayList<>();

    // Pre-seed the demo account so it also "exists" for duplicate-check
    static {
        User seed = new User();
        seed.setUserId(1);
        seed.setEmail("demo@hiroma.com");
        seed.setPasswordHash("demo123");
        seed.setFullName("Demo User");
        seed.setRole("customer");
        seed.setActive(true);
        DEMO_USERS.add(seed);
    }

    // ── GET ───────────────────────────────────────────────────────────────
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        // Already logged in → go home
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect(request.getContextPath() + "/user/home.jsp");
            return;
        }

        request.getRequestDispatcher("/user/register.jsp")
               .forward(request, response);
    }

    // ── POST ──────────────────────────────────────────────────────────────
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String fullName        = request.getParameter("fullName");
        String email           = request.getParameter("email");
        String phone           = request.getParameter("phone");
        String password        = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // ── Validation ────────────────────────────────────────────────────
        if (fullName == null || fullName.trim().isEmpty()) {
            setErrorAndForward(request, response, "Full name is required.",
                    email, phone, fullName);
            return;
        }

        if (email == null || email.trim().isEmpty()) {
            setErrorAndForward(request, response, "Email address is required.",
                    email, phone, fullName);
            return;
        }

        if (password == null || password.length() < 6) {
            setErrorAndForward(request, response, "Password must be at least 6 characters.",
                    email, phone, fullName);
            return;
        }

        if (!password.equals(confirmPassword)) {
            setErrorAndForward(request, response, "Passwords do not match.",
                    email, phone, fullName);
            return;
        }

        // ── Duplicate email check ─────────────────────────────────────────
        // TODO: replace with userService.isEmailTaken(email.trim())
        if (isEmailTaken(email.trim())) {
            setErrorAndForward(request, response,
                    "An account with that email already exists. Please sign in.",
                    email, phone, fullName);
            return;
        }

        // ── Create user ───────────────────────────────────────────────────
        // TODO: replace with userService.register(fullName, email, password, phone)
        User newUser = new User();
        newUser.setUserId(DEMO_USERS.size() + 1);
        newUser.setFullName(fullName.trim());
        newUser.setEmail(email.trim().toLowerCase());
        newUser.setPasswordHash(password);          // plain text for demo only
        newUser.setPhone(phone != null ? phone.trim() : "");
        newUser.setRole("customer");
        newUser.setActive(true);
        newUser.setCreatedAt(java.time.LocalDate.now().toString());

        DEMO_USERS.add(newUser);

        // ── Success → redirect to login with flash message ────────────────
        HttpSession session = request.getSession(true);
        session.setAttribute("successMessage",
                "Account created! Welcome, " + newUser.getFullName() + ". Please sign in.");

        response.sendRedirect(request.getContextPath() + "/LoginController");
    }

    // ── Helpers ───────────────────────────────────────────────────────────

    /** Re-forward to register.jsp with an error and the user's input preserved. */
    private void setErrorAndForward(HttpServletRequest request,
                                    HttpServletResponse response,
                                    String message,
                                    String email, String phone, String fullName)
            throws ServletException, IOException {

        request.setAttribute("errorMessage", message);
        request.setAttribute("enteredEmail", email);
        request.setAttribute("enteredPhone", phone);
        request.setAttribute("enteredName",  fullName);
        request.getRequestDispatcher("/authentication/register.jsp")
               .forward(request, response);
    }

    /** Check the demo in-memory list for a duplicate email. */
    private boolean isEmailTaken(String email) {
        for (User u : DEMO_USERS) {
            if (email.equalsIgnoreCase(u.getEmail())) return true;
        }
        return false;
    }
}

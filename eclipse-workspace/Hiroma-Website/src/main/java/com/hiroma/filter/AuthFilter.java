package com.hiroma.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 * AuthFilter  –  Authentication Filter
 *
 * Protects all pages under /user/* and /admin/*
 * Public pages (login, register, home, products) are allowed through.
 */
@WebFilter(urlPatterns = { "/user/*", "/admin/*", "/ProfileController" })
public class AuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Nothing to initialise
    }

    @Override
    public void doFilter(ServletRequest servletRequest,
                         ServletResponse servletResponse,
                         FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest  request   = (HttpServletRequest)  servletRequest;
        HttpServletResponse response  = (HttpServletResponse) servletResponse;

        String contextPath = request.getContextPath();
        String path        = request.getRequestURI()
                                    .substring(contextPath.length());

        // ── Public pages – allow through without login ────────────────────
        if (path.equals("/user/home.jsp")
                || path.equals("/user/login.jsp")
                || path.equals("/user/register.jsp")
                || path.startsWith("/user/product")) {
            chain.doFilter(request, response);
            return;
        }

        // ── Check session ─────────────────────────────────────────────────
        HttpSession session = request.getSession(false);
        boolean loggedIn    = session != null
                              && session.getAttribute("user") != null;

        if (loggedIn) {
            // Admin-only pages
            if (path.startsWith("/admin/")) {
                String role = (String) session.getAttribute("userRole");
                if (!"ADMIN".equalsIgnoreCase(role)) {
                    response.sendRedirect(contextPath + "/user/home.jsp");
                    return;
                }
            }
            chain.doFilter(request, response);

        } else {
            // Not logged in → redirect to login
            HttpSession newSession = request.getSession(true);
            newSession.setAttribute("redirectAfterLogin", request.getRequestURI());
            newSession.setAttribute("errorMessage", "Please log in to access that page.");
            response.sendRedirect(contextPath + "/LoginController");
        }
    }

    @Override
    public void destroy() {
        // Nothing to clean up
    }
}

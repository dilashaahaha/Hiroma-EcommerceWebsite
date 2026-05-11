/**
 * AuthFilter  –  Authentication Filter
 * Protects /ProfileController and /LogoutController so only logged-in users can access them. 
 * Unauthenticated requests are redirected to /LoginController.
  * Location: src/main/java/com.hiroma.filter
  * Author: M3
  *   - Pattern: @WebFilter on specific protected URL patterns
  */

package com.hiroma.filter;

import com.hiroma.util.SessionUtil;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(urlPatterns = { "/ProfileController", "/LogoutController", "/user/profile.jsp", "/user/home.jsp", "/user/cart.jsp", "/user/orders.jsp", "/user/checkout.jsp",
		"/user/product.jsp", "/user/productdetail.jsp" })
public class AuthFilter extends HttpFilter implements Filter {

    private static final long serialVersionUID = 1L;

    public AuthFilter() {
        super();
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization logic
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest  httpRequest  = (HttpServletRequest)  request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // Check if the session exists and contains the "user" login identifier
        boolean isLoggedIn = SessionUtil.getAttribute(httpRequest, "user") != null;

        if (isLoggedIn) {
            // If user is logged in, allow the request to proceed
            chain.doFilter(request, response);
        } else {
            // If user is not logged in, prevent caching and redirect to login
            httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/LoginController");
        }
    }

    @Override
    public void destroy() {
    }
}

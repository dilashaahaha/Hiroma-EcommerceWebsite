/**
 * GuestFilter: Redirects already-logged-in users away from authentication pages back to the profile page.
 * Guests are allowed through normally.
 * Location: src/main/java/com.hiroma.filter
 * * Author: M3
 */

package com.hiroma.filter;

import com.hiroma.util.SessionUtil;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(urlPatterns = { "/LoginController", "/authentication/login.jsp", "/authentication/register.jsp" })
public class GuestFilter extends HttpFilter implements Filter {

    private static final long serialVersionUID = 1L;

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        // Cast the generic request/response to HTTP-specific versions
        HttpServletRequest  httpRequest  = (HttpServletRequest)  request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // Check if the session exists and contains the "user" login identifier
        boolean isLoggedIn = SessionUtil.getAttribute(httpRequest, "user") != null;

        if (isLoggedIn) {
            // User is already logged in — redirect them to profile
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/ProfileController");
        } else {
            chain.doFilter(request, response);
        }
    }
}

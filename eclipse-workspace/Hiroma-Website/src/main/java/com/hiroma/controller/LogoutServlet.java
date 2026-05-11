/**
 * LogoutServlet: Invalidates the session using SessionUtil, clears the remember-me cookie, then redirects to the login page.
 * Location: src/main/java/com.hiroma.controller
   Author: M3
   URL mapping: /LogoutController
 *
 */

package com.hiroma.controller;

import com.hiroma.util.CookieUtil;
import com.hiroma.util.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/LogoutController")
public class LogoutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String COOKIE_REMEMBER   = "hiroma_remember";
    private static final String COOKIE_LAST_LOGIN = "hiroma_last_login";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Invalidate the session using SessionUtil
        SessionUtil.invalidateSession(request);

        // 2. Delete the remember-me and last-login cookies using CookieUtil
        CookieUtil.deleteCookie(response, COOKIE_REMEMBER);
        CookieUtil.deleteCookie(response, COOKIE_LAST_LOGIN);

        // 3. Redirect to login page
        response.sendRedirect(request.getContextPath() + "/LoginController");
    }
}

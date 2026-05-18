package com.hiroma.controller;

import com.hiroma.util.CookieUtil;
import com.hiroma.util.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SessionUtil.logout(request.getSession());
        CookieUtil.deleteCookie(response, "userEmail");
        response.sendRedirect(request.getContextPath() + "/login");
    }
}
package com.hiroma.controller;

import jakarta.servlet.ServletException;
import com.hiroma.util.CookieUtil;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.hiroma.model.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email    = request.getParameter("email");
        String password = request.getParameter("password");

        // TODO: validate against database — for now create a dummy User
        User user = new User();
        user.setEmail(email);
        // set other fields as needed

        request.getSession().setAttribute("user", user);

     // 🔥 ADD THIS BLOCK
     String remember = request.getParameter("remember");
     if (remember != null) {
     CookieUtil.addCookie(response, "hiroma-remember", email, 60 * 60);
     }

     // redirect
     response.sendRedirect(request.getContextPath() + "/user/profile.jsp");
    }
}
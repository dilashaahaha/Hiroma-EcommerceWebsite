package com.hiroma.filter;

import com.hiroma.model.UserModel;
import com.hiroma.util.SessionUtil;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebFilter("/admin/*")
public class AdminFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        UserModel user = (UserModel) SessionUtil.getUser(req.getSession());

        if (user == null) {
            res.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        if (!user.getRole().equals("admin")) {
            res.sendRedirect(req.getContextPath() + "/dashboard");
            return;
        }

        chain.doFilter(request, response);
    }
}
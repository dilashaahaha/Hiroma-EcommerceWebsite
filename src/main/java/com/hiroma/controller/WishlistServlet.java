package com.hiroma.controller;

import com.hiroma.dao.TeaDAO;
import com.hiroma.model.TeaModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/wishlist")
public class WishlistServlet extends HttpServlet {

    private TeaDAO teaDAO = new TeaDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<TeaModel> wishlist = getWishlist(session);
        request.setAttribute("wishlist", wishlist);
        request.getRequestDispatcher("/WEB-INF/views/user/wishlist.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String idStr = request.getParameter("teaId");
        HttpSession session = request.getSession();

        try {
            int teaId = Integer.parseInt(idStr);
            List<TeaModel> wishlist = getWishlist(session);

            if ("add".equals(action)) {
                boolean exists = wishlist.stream().anyMatch(t -> t.getId() == teaId);
                if (!exists) {
                    TeaModel tea = teaDAO.getTeaById(teaId);
                    if (tea != null) wishlist.add(tea);
                }
            } else if ("remove".equals(action)) {
                wishlist.removeIf(t -> t.getId() == teaId);
            }

            session.setAttribute("wishlist", wishlist);
        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace();
        }

        String redirect = request.getParameter("redirect");
        if (redirect != null && redirect.equals("wishlist")) {
            response.sendRedirect(request.getContextPath() + "/wishlist");
        } else {
            response.sendRedirect(request.getParameter("returnUrl") != null
                ? request.getParameter("returnUrl")
                : request.getContextPath() + "/shop");
        }
    }

    @SuppressWarnings("unchecked")
    private List<TeaModel> getWishlist(HttpSession session) {
        List<TeaModel> wishlist = (List<TeaModel>) session.getAttribute("wishlist");
        if (wishlist == null) {
            wishlist = new ArrayList<>();
            session.setAttribute("wishlist", wishlist);
        }
        return wishlist;
    }
}
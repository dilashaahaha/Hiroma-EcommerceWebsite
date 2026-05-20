package com.hiroma.controller;

import com.hiroma.dao.ProductDAO;
import com.hiroma.dao.ReviewDAO;
import com.hiroma.model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import com.hiroma.model.ReviewModel;

@WebServlet("/productdetail")
public class ProductDetailController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        Product product = null;

        if (idParam != null && !idParam.isEmpty()) {
            try {
                int productId = Integer.parseInt(idParam);

                // Fetch product from DB
                ProductDAO productDAO = new ProductDAO();
                product = productDAO.getProductById(productId);

                // Only fetch reviews if product exists
                if (product != null) {
                    ReviewDAO reviewDAO = new ReviewDAO();
                    List<ReviewModel> reviews = reviewDAO.getReviewsByProduct(productId);
                    request.setAttribute("reviews", reviews);
                }

            } catch (NumberFormatException e) {
                System.err.println("[ProductDetailController] Invalid id: " + idParam);
            }
        }

        // Set product — can be null, JSP handles it
        request.setAttribute("product", product);

        request.getRequestDispatcher("/user/productdetail.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");
        String redirect = request.getContextPath() + "/productdetail";
        if (idParam != null && !idParam.isEmpty()) {
            redirect += "?id=" + idParam;
        }
        response.sendRedirect(redirect);
    }
}
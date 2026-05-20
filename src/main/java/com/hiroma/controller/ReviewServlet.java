package com.hiroma.controller;

import com.hiroma.dao.ProductDAO;
import com.hiroma.dao.ReviewDAO;
import com.hiroma.model.ReviewModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/review")
public class ReviewServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // GET — load product and existing reviews from DB, forward to review.jsp
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("productId");

        if (idParam != null && !idParam.isEmpty()) {
            try {
                int productId = Integer.parseInt(idParam);

                // Load product from DB
                ProductDAO productDAO = new ProductDAO();
                request.setAttribute("product", productDAO.getProductById(productId));

                // Load existing reviews from DB
                ReviewDAO reviewDAO = new ReviewDAO();
                List<ReviewModel> reviews = reviewDAO.getReviewsByProduct(productId);
                request.setAttribute("reviews", reviews);

            } catch (NumberFormatException e) {
                System.err.println("[ReviewServlet] Invalid productId: " + idParam);
            }
        }

        request.getRequestDispatcher("/review.jsp").forward(request, response);
    }

    // POST — save review to DB, redirect back to product detail
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	

        String idParam = request.getParameter("productId");
        String ratingParam = request.getParameter("overall_rating");

        // Validate productId
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/products");
            return;
        }

        int productId = Integer.parseInt(idParam);

        // Validate rating — user must click a star
        int rating = 0;
        if (ratingParam != null && !ratingParam.isEmpty()) {
            rating = Integer.parseInt(ratingParam);
        }
        if (rating == 0) {
            response.sendRedirect(request.getContextPath()
                + "/review?productId=" + productId + "&error=rating");
            return;
        }

        // Get comment
        String comment = request.getParameter("review_body");

        // Get userId from session — fallback to 1 if not logged in
        HttpSession session = request.getSession(false);
        int userId = 1;
        if (session != null && session.getAttribute("user") != null) {
            com.hiroma.model.User user =
                (com.hiroma.model.User) session.getAttribute("user");
            userId = user.getUserId();
        }

        // Build and save review
        ReviewModel review = new ReviewModel();
        review.setProductId(productId);
        review.setUserId(userId);
        review.setRating(rating);
        review.setComment(comment);

        ReviewDAO dao = new ReviewDAO();
        dao.addReview(review);

        // Redirect back to product detail page
        response.sendRedirect(request.getContextPath()
            + "/review?productId=" + productId);
        
        
    }
}
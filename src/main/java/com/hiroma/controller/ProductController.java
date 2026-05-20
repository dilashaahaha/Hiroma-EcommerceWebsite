package com.hiroma.controller;

/**
 * ProductController
 * Location : src/main/java/com/hiroma/controller/products.java
 * Author   : M3
 * URL mapping: /products
 *
 * Handles GET requests for the product listing page.
 * Reads URL parameters, delegates to ProductDAO for filtered data,
 * then forwards to /user/product.jsp with results in request scope.
 *
 * URL examples:
 *   /products                                 → all products, default sort
 *   /products?category=green                 → filter by green tea
 *   /products?category=black&sort=price_asc  → black tea, cheapest first
 *   /products?priceMax=1000&district=Ilam    → price + district filter
 *   /products?brand=ilam_estate              → brand filter
 *   /products?search=silver                  → keyword search
 *
 * Request attributes set (available in product.jsp via EL):
 *   ${requestScope.products}        — List<Product> from DB (may be empty)
 *   ${requestScope.activeCategory}  — current category value (e.g. "green")
 *   ${requestScope.activeSort}      — current sort value (e.g. "price_asc")
 *   ${requestScope.activeDistrict}  — current district value (e.g. "Ilam")
 *   ${requestScope.activeBrand}     — current brand key (e.g. "ilam_estate")
 *   ${requestScope.activePriceMax}  — current priceMax int value
 *   ${requestScope.activeSearch}    — current search keyword
 */

import com.hiroma.dao.ProductDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import com.hiroma.model.Product;


import java.io.IOException;
import java.util.List;

@WebServlet("/products")
public class ProductController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // ── GET ───────────────────────────────────────────────────────────────

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ── 1. Read URL parameters ────────────────────────────────────────

        // ?category=green | black | white | herbal | all
        String category = request.getParameter("category");

        // ?sort=featured | price_asc | price_desc | newest | rating
        String sort = request.getParameter("sort");



        // ?district=Ilam | Taplejung | Dhankuta | Panchthar | Kaski | Sindhupalchok
        String district = request.getParameter("district");

        // ?brand=ilam_estate | taplejung_organics | himalayan_brew | pure_nepal
        String brand = request.getParameter("brand");

        // ?search=keyword  (free-text search across name + description)
        String search = request.getParameter("search");

        // ── 2. Normalise / apply defaults ────────────────────────────────

        // Default category to "all" when missing or blank
        if (category == null || category.isEmpty()) {
            category = "all";
        }

        // Default sort to "featured" when missing or blank
        if (sort == null || sort.isEmpty()) {
            sort = "featured";
        }



        // ── 3. Fetch products from DAO ────────────────────────────────────

        ProductDAO productDAO = new ProductDAO();
        List<Product> productList;

        // Read origin/brand for the new 2-arg filter
        String origin = request.getParameter("origin");
        if (origin == null) { origin = ""; }
        String brandFilter = request.getParameter("brand");
        if (brandFilter == null) { brandFilter = ""; }

        if (search != null && !search.isEmpty()) {
            // Keyword search takes priority over other filters
            productList = productDAO.searchProducts(search);

        } else if (!origin.isEmpty() || !brandFilter.isEmpty()) {
            // Origin/brand filter: use the dedicated 2-arg method
            productList = productDAO.getFilteredProducts(origin, brandFilter);

        } else {
            // Category + sort filter (existing behaviour)
            productList = productDAO.getProductsByCategory(category, sort);
        }

        // ── 4. Set request attributes so product.jsp can read them via EL ─

        // The product list — product.jsp uses <c:forEach var="p" items="${requestScope.products}">
        request.setAttribute("products",     productList);
        // Also expose as 'productList' for the origin/brand filtered view
        request.setAttribute("productList",  productList);

        // Active filter values — used in product.jsp to highlight the selected options
        request.setAttribute("activeCategory",  category);
        request.setAttribute("activeSort",       sort);
        request.setAttribute("activeDistrict",   district  != null ? district  : "");
        request.setAttribute("activeBrand",      brand     != null ? brand     : "");
        request.setAttribute("activeSearch",     search    != null ? search    : "");

        // selectedOrigin and selectedBrand for the new origin/brand filter UI
        request.setAttribute("selectedOrigin",   origin);
        request.setAttribute("selectedBrand",    brandFilter);

        // ── 5. Forward to product.jsp (no redirect — preserves request attrs) ─
        request.getRequestDispatcher("/user/product.jsp")
               .forward(request, response);
    }

    // ── POST (redirect to GET — PRG pattern) ────────────────────────────

    /**
     * POST is not expected on this URL, but if a form submits here via POST
     * we safely redirect to GET so the browser doesn't re-submit on refresh.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/products");
    }
}


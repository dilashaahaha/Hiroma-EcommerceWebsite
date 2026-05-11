<%--
    footer.jsp
    Location: src/main/webapp/layout/footer.jsp
    Author: M1
    Description: Footer included at the bottom of every page.
                 Import into other JSP files using:
                 <%@ include file="/layout/footer.jsp" %>
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String ctx = request.getContextPath(); %>

<link rel="stylesheet" href="<%= ctx %>/css/footer.css">

<!-- ===== FOOTER ===== -->
<footer class="site-footer">

    <!-- Top section: brand + 3 link columns -->
    <div class="footer-top">

        <!-- Brand blurb -->
        <div class="footer-brand">
            <div class="footer-logo">H<span>i</span>roma</div>
            <p class="footer-tagline">
                Nepal's first dedicated marketplace for authentic,
                organic Himalayan teas. From garden to cup.
            </p>
        </div>

        <!-- Shop links -->
        <div class="footer-col">
            <div class="footer-col-title">Shop</div>
            <ul class="footer-links">
                <li><a href="<%= ctx %>/home?categoryId=1">Green Teas</a></li>
                <li><a href="<%= ctx %>/home?categoryId=2">Black Teas</a></li>
                <li><a href="<%= ctx %>/home?categoryId=3">White Teas</a></li>
                <li><a href="<%= ctx %>/home?categoryId=5">Herbal Blends</a></li>
                <li><a href="<%= ctx %>/home?categoryId=6">Gift Sets</a></li>
            </ul>
        </div>

        <!-- Company links -->
        <div class="footer-col">
            <div class="footer-col-title">Company</div>
            <ul class="footer-links">
                <li><a href="<%= ctx %>/about.jsp">Our Story</a></li>
                <li><a href="<%= ctx %>/contact">Contact Us</a></li>
            </ul>
        </div>

        <!-- Account links -->
        <div class="footer-col">
            <div class="footer-col-title">Account</div>
            <ul class="footer-links">
                <li><a href="<%= ctx %>/profile">My Profile</a></li>
                <li><a href="<%= ctx %>/orders">My Orders</a></li>
                <li><a href="<%= ctx %>/cart">My Cart</a></li>
                <li><a href="<%= ctx %>/authentication/login.jsp">Sign In</a></li>
            </ul>
        </div>

    </div>

    <!-- Bottom bar: copyright + social links -->
    <div class="footer-bottom">
        <div class="footer-copy">
            &copy; 2026 Hiroma &middot; Himalayan Aroma &middot; Nepal
        </div>
        <div class="footer-socials">
            <a href="#">Instagram</a>
            <a href="#">Facebook</a>
            <a href="#">Twitter</a>
        </div>
    </div>

</footer>
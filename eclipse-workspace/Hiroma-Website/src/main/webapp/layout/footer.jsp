<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%--
    footer.jsp – Shared site footer
    Include on every page with: <%@ include file="/layout/footer.jsp" %>
--%>

<!-- ===== FOOTER ===== -->
<footer class="footer">
    <div class="container">
        <div class="footer-grid">

            <!-- Brand Column -->
            <div class="footer-brand-col">
                <div class="footer-logo">H<span>/</span>ROMA</div>
                <p class="footer-tagline">
                    Pure herbal teas from the heart of the Himalayas.<br>
                    Bringing Nepal's finest blends to your doorstep.
                </p>
            </div>

            <!-- Shop Column -->
            <div class="footer-col">
                <h4 class="footer-col-title">SHOP</h4>
                <ul class="footer-links">
                    <li><a href="${pageContext.request.contextPath}/user/home.jsp?category=green">Green Tea</a></li>
                    <li><a href="${pageContext.request.contextPath}/user/home.jsp?category=herbal">Herbal Blends</a></li>
                    <li><a href="${pageContext.request.contextPath}/user/home.jsp?category=black">Black Tea</a></li>
                    <li><a href="${pageContext.request.contextPath}/user/home.jsp?category=detox">Detox Teas</a></li>
                </ul>
            </div>

            <!-- Account Column -->
            <div class="footer-col">
                <h4 class="footer-col-title">ACCOUNT</h4>
                <ul class="footer-links">
                    <li><a href="${pageContext.request.contextPath}/user/profile.jsp">My Profile</a></li>
                    <li><a href="${pageContext.request.contextPath}/user/orders.jsp">My Orders</a></li>
                    <li><a href="${pageContext.request.contextPath}/user/cart.jsp">My Cart</a></li>
                    <li><a href="${pageContext.request.contextPath}/user/home.jsp?section=reviews">Reviews</a></li>
                </ul>
            </div>

            <!-- Company Column -->
            <div class="footer-col">
                <h4 class="footer-col-title">COMPANY</h4>
                <ul class="footer-links">
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Contact</a></li>
                    <li><a href="#">Our Farmers</a></li>
                </ul>
            </div>

        </div>

        <div class="footer-bottom">
            <p>&copy; 2025 Hiroma Tea. All rights reserved.</p>
            <p class="footer-made">Made in <strong>Nepal</strong> &#9749;</p>
        </div>
    </div>
</footer>

</body>
</html>
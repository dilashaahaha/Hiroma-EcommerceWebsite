<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%-- 
    header.jsp – Shared site header / navbar
    Include on every page with: <%@ include file="/layout/header.jsp" %>
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>H/ROMA – Pure Himalayan Teas</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
</head>
<body>

<!-- ===== NAVBAR ===== -->
<header class="navbar">
    <div class="container flex-between">

        <!-- Brand Logo -->
        <a href="${pageContext.request.contextPath}/user/home.jsp" class="navbar-brand">
            H<span class="brand-slash">/</span>ROMA
        </a>

        <!-- Nav Links -->
        <nav class="nav-links">
            <a href="${pageContext.request.contextPath}/user/home.jsp"
               class="nav-link ${currentPage == 'shop' ? 'active' : ''}">SHOP</a>
            <a href="${pageContext.request.contextPath}/user/home.jsp?category=all"
               class="nav-link ${currentPage == 'collections' ? 'active' : ''}">COLLECTIONS</a>
            <a href="#" class="nav-link">ABOUT US</a>
            <a href="#" class="nav-link">BRANDS</a>
            <a href="#" class="nav-link">CONTACT US</a>
        </nav>

        <!-- Right Side: Account + Cart -->
        <div class="nav-right">
            <%
                Object user = session.getAttribute("user");
                if (user != null) {
            %>
                <a href="${pageContext.request.contextPath}/user/profile.jsp" class="nav-account">ACCOUNT</a>
            <%  } else { %>
                <a href="${pageContext.request.contextPath}/authentication/login.jsp" class="nav-account">ACCOUNT</a>
            <%  } %>

            <a href="${pageContext.request.contextPath}/user/cart.jsp" class="nav-cart">
                CART
                <%
                    java.util.List<?> cartItems = (java.util.List<?>) session.getAttribute("cart");
                    int cartCount = (cartItems != null) ? cartItems.size() : 0;
                %>
                (<%= cartCount %>)
            </a>
        </div>
    </div>
</header>
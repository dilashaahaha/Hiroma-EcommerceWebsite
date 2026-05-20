<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hiroma – Pure Teas from the Himalayas</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
</head>
<body>

<!-- NAV -->
<nav class="navbar">
    <a href="${pageContext.request.contextPath}/home" class="nav-brand">H<span>/</span>ROMA</a>
    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/shop">Shop</a>
        <a href="${pageContext.request.contextPath}/about">About Us</a>
        <a href="${pageContext.request.contextPath}/contact">Contact Us</a>
    </div>
    <div class="nav-actions">
        <c:choose>
            <c:when test="${not empty sessionScope.loggedInUser}">
                <a href="${pageContext.request.contextPath}/dashboard">Account</a>
                <a href="${pageContext.request.contextPath}/wishlist" class="nav-cart">
                    Wishlist
                    <c:if test="${not empty sessionScope.wishlist}">
                        <span class="nav-badge">${sessionScope.wishlist.size()}</span>
                    </c:if>
                </a>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/login">Account</a>
                <a href="${pageContext.request.contextPath}/shop" class="nav-cart">Shop</a>
            </c:otherwise>
        </c:choose>
    </div>
</nav>

<!-- HERO -->
<section class="hero">
    <div class="hero-left">
        <p class="hero-label">— 100% NATURAL · FROM NEPAL</p>
        <h1>Pure teas from the <em>Himalayas.</em></h1>
        <p class="hero-sub">Handpicked from the mountain gardens of Nepal.<br>Brewed for your body. Crafted for your soul.</p>
        <div class="hero-btns">
            <a href="${pageContext.request.contextPath}/shop" class="btn-gold">SHOP NOW</a>
            <a href="${pageContext.request.contextPath}/about" class="btn-outline">BROWSE COLLECTIONS</a>
        </div>
    </div>
    <div class="hero-right">
        <div class="hero-img-circle">
        </div>
        <div class="hero-tags">
            <span>ORGANIC</span><span>HANDPICKED</span><span>NEPAL</span>
        </div>
    </div>
</section>

<!-- SEARCH + PRODUCTS -->
<section class="featured-section">
    <form action="${pageContext.request.contextPath}/shop" method="get" class="home-search">
        <input type="text" name="search" placeholder="Search teas, herbs, blends..."/>
        <button type="submit">SEARCH</button>
    </form>

    <!-- Category tabs -->
    <div class="home-tabs">
        <a href="${pageContext.request.contextPath}/shop" class="home-tab active">ALL</a>
        <c:forEach var="cat" items="${categories}">
            <a href="${pageContext.request.contextPath}/shop?categoryId=${cat.id}" class="home-tab">${cat.name}</a>
        </c:forEach>
    </div>

    <!-- Featured products -->
    <div class="featured-grid">
        <c:forEach var="tea" items="${featuredTeas}">
            <div class="feat-card">
                <div class="feat-img">
                    <span>${fn:substring(tea.name,0,1)}</span>
                </div>
                <div class="feat-info">
                    <p class="feat-brand">${tea.brandName}</p>
                    <a href="${pageContext.request.contextPath}/tea?id=${tea.id}" class="feat-name">${tea.name}</a>
                    <div class="feat-footer">
                        <span class="feat-price">Rs. <fmt:formatNumber value="${tea.price}" pattern="#,##0"/></span>
                        <a href="${pageContext.request.contextPath}/tea?id=${tea.id}" class="btn-add">+ VIEW</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</section>

<!-- FOOTER -->
<footer class="footer">
    <div class="footer-inner">
        <div class="footer-col">
            <div class="footer-brand">H<span>/</span>ROMA</div>
            <p>Pure herbal teas from the heart of the Himalayas.</p>
        </div>
        <div class="footer-col">
            <p class="footer-heading">SHOP</p>
            <c:forEach var="cat" items="${categories}">
                <a href="${pageContext.request.contextPath}/shop?categoryId=${cat.id}">${cat.name}</a>
            </c:forEach>
        </div>
        <div class="footer-col">
            <p class="footer-heading">ACCOUNT</p>
            <a href="${pageContext.request.contextPath}/user/profile">My Profile</a>
            <a href="${pageContext.request.contextPath}/user/orders">My Orders</a>
            <a href="${pageContext.request.contextPath}/wishlist">Wishlist</a>
        </div>
        <div class="footer-col">
            <p class="footer-heading">COMPANY</p>
            <a href="${pageContext.request.contextPath}/about">About Us</a>
            <a href="${pageContext.request.contextPath}/contact">Contact</a>
        </div>
    </div>
    <div class="footer-bottom">
        <p>© 2025 Hiroma Tea. All rights reserved.</p>
    </div>
</footer>

</body>
</html>

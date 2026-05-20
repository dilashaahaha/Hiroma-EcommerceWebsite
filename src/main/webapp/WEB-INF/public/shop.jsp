<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop – Hiroma</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/shop.css">
</head>
<body>

<!-- NAV -->
<nav class="navbar">
    <a href="${pageContext.request.contextPath}/home" class="nav-brand">H<span>/</span>ROMA</a>
    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/shop">Shop</a>
        <a href="${pageContext.request.contextPath}/about">About Us</a>
        <a href="${pageContext.request.contextPath}/contact">Contact</a>
    </div>
    <div class="nav-actions">
        <c:choose>
            <c:when test="${not empty sessionScope.loggedInUser}">
                <a href="${pageContext.request.contextPath}/dashboard">Account</a>
                <a href="${pageContext.request.contextPath}/wishlist" class="nav-wishlist">
                    Wishlist
                    <c:if test="${not empty sessionScope.wishlist}">
                        <span class="nav-badge">${sessionScope.wishlist.size()}</span>
                    </c:if>
                </a>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/login">Login</a>
            </c:otherwise>
        </c:choose>
    </div>
</nav>

<!-- HERO -->
<div class="shop-hero">
    <p class="hero-label">— OUR COLLECTION</p>
    <h1>Nepal's finest teas, <em>curated</em> for you</h1>
    <p class="hero-sub">46 varieties from 8 districts across Nepal's eastern hills — all organic, all authentic, all sourced directly from verified gardens.</p>
</div>

<!-- FILTERS + PRODUCTS -->
<div class="shop-body">

    <!-- Category filter tabs -->
    <div class="filter-tabs">
        <a href="${pageContext.request.contextPath}/shop"
           class="filter-tab ${empty param.categoryId && empty param.search ? 'active' : ''}">
            All teas
        </a>
        <c:forEach var="cat" items="${categories}">
            <a href="${pageContext.request.contextPath}/shop?categoryId=${cat.id}"
               class="filter-tab ${param.categoryId == cat.id ? 'active' : ''}">
                ${cat.name}
            </a>
        </c:forEach>
    </div>

    <!-- Search -->
    <form action="${pageContext.request.contextPath}/shop" method="get" class="shop-search">
        <input type="text" name="search" placeholder="Search teas, herbs, blends..." value="${keyword}"/>
        <button type="submit">SEARCH</button>
    </form>

    <p class="results-count">Showing ${teas.size()} products</p>

    <!-- Product grid -->
    <div class="product-grid">
        <c:choose>
            <c:when test="${empty teas}">
                <div class="empty-shop">
                    <p>No teas found. <a href="${pageContext.request.contextPath}/shop">Clear search</a></p>
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach var="tea" items="${teas}">
                    <div class="product-card">
                        <a href="${pageContext.request.contextPath}/tea?id=${tea.id}" class="product-img-link">
                            <div class="product-img-placeholder">
                                <span>${fn:substring(tea.name,0,1)}</span>
                            </div>
                        </a>
                        <div class="product-info">
                            <p class="product-brand">${tea.brandName}</p>
                            <a href="${pageContext.request.contextPath}/tea?id=${tea.id}" class="product-name">${tea.name}</a>
                            <p class="product-category">${tea.categoryName}</p>
                            <div class="product-footer">
                                <span class="product-price">Rs. <fmt:formatNumber value="${tea.price}" pattern="#,##0"/></span>
                                <c:if test="${not empty sessionScope.loggedInUser}">
                                    <form action="${pageContext.request.contextPath}/wishlist" method="post" style="display:inline">
                                        <input type="hidden" name="action" value="add"/>
                                        <input type="hidden" name="teaId" value="${tea.id}"/>
                                        <input type="hidden" name="returnUrl" value="${pageContext.request.contextPath}/shop"/>
                                        <button type="submit" class="btn-wishlist">♡</button>
                                    </form>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<!-- FOOTER -->
<footer class="footer">
    <div class="footer-brand">H<span>/</span>ROMA</div>
    <p class="footer-sub">Pure herbal teas from the heart of the Himalayas.</p>
    <div class="footer-links">
        <a href="${pageContext.request.contextPath}/shop">Shop</a>
        <a href="${pageContext.request.contextPath}/about">About</a>
        <a href="${pageContext.request.contextPath}/contact">Contact</a>
    </div>
    <p class="footer-copy">© 2025 Hiroma Tea. All rights reserved.</p>
</footer>

</body>
</html>

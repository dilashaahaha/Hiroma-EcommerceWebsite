<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wishlist – Hiroma</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/wishlist.css">
</head>
<body>

<nav class="navbar">
    <a href="${pageContext.request.contextPath}/home" class="nav-brand">H<span>/</span>ROMA</a>
    <div class="nav-links"><a href="${pageContext.request.contextPath}/shop">Shop</a></div>
    <div class="nav-actions">
        <a href="${pageContext.request.contextPath}/dashboard">Account</a>
        <a href="${pageContext.request.contextPath}/logout">Sign out</a>
    </div>
</nav>

<div class="wishlist-page">
    <div class="wishlist-header">
        <p class="wishlist-label">— YOUR WISHLIST</p>
        <h1>Saved <em>teas</em></h1>
        <p class="wishlist-sub">${wishlist.size()} item(s) saved · Wishlist is cleared when you log out</p>
    </div>

    <c:choose>
        <c:when test="${empty wishlist}">
            <div class="wishlist-empty">
                <p>Your wishlist is empty.</p>
                <a href="${pageContext.request.contextPath}/shop" class="btn-browse">BROWSE TEAS</a>
            </div>
        </c:when>
        <c:otherwise>
            <div class="wishlist-grid">
                <c:forEach var="tea" items="${wishlist}">
                    <div class="wishlist-card">
                        <div class="wl-img">
                            <span>${fn:substring(tea.name,0,1)}</span>
                        </div>
                        <div class="wl-info">
                            <p class="wl-brand">${tea.brandName}</p>
                            <a href="${pageContext.request.contextPath}/tea?id=${tea.id}" class="wl-name">${tea.name}</a>
                            <p class="wl-category">${tea.categoryName}</p>
                            <p class="wl-price">Rs. <fmt:formatNumber value="${tea.price}" pattern="#,##0"/></p>
                        </div>
                        <form action="${pageContext.request.contextPath}/wishlist" method="post" class="wl-remove">
                            <input type="hidden" name="action" value="remove"/>
                            <input type="hidden" name="teaId" value="${tea.id}"/>
                            <input type="hidden" name="redirect" value="wishlist"/>
                            <button type="submit" class="btn-remove">✕ Remove</button>
                        </form>
                    </div>
                </c:forEach>
            </div>
        </c:otherwise>
    </c:choose>
</div>

</body>
</html>

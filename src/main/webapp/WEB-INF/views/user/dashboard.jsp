<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard – Hiroma</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile.css">
</head>
<body>

<nav class="navbar">
    <a href="${pageContext.request.contextPath}/home" class="nav-brand">H<span>/</span>ROMA</a>
    <div class="nav-links"><a href="${pageContext.request.contextPath}/shop">Shop</a></div>
    <div class="nav-actions"><a href="${pageContext.request.contextPath}/logout">Sign out</a></div>
</nav>

<div class="profile-header">
    <div class="profile-avatar">${fn:substring(sessionScope.loggedInUser.fullName,0,1)}</div>
    <div class="profile-header-info">
        <p class="profile-header-label">MY ACCOUNT</p>
        <h1>${sessionScope.loggedInUser.fullName}</h1>
        <p class="profile-header-sub">${sessionScope.loggedInUser.email}</p>
    </div>
</div>

<div class="profile-body">
    <aside class="profile-sidebar">
        <p class="sidebar-section-label">ACCOUNT</p>
        <a href="${pageContext.request.contextPath}/user/profile" class="profile-nav-link">Personal info</a>
        <p class="sidebar-section-label" style="margin-top:1.5rem">SHOPPING</p>
        <a href="${pageContext.request.contextPath}/user/orders" class="profile-nav-link">My orders <span class="nav-count">${orderCount}</span></a>
        <a href="${pageContext.request.contextPath}/wishlist" class="profile-nav-link">Wishlist <span class="nav-count">${wishlistCount}</span></a>
        <a href="${pageContext.request.contextPath}/logout" class="profile-signout">SIGN OUT</a>
    </aside>

    <div class="profile-main">
        <div class="dash-user-stats">
            <div class="stat-card">
                <p class="stat-label">TOTAL ORDERS</p>
                <p class="stat-value">${orderCount}</p>
            </div>
            <div class="stat-card">
                <p class="stat-label">WISHLIST ITEMS</p>
                <p class="stat-value">${wishlistCount}</p>
            </div>
        </div>

        <div class="profile-section">
            <h2>Recent Orders</h2>
            <c:choose>
                <c:when test="${empty orders}">
                    <p style="color:#aaa;font-size:0.85rem">No orders yet. <a href="${pageContext.request.contextPath}/shop">Start shopping</a></p>
                </c:when>
                <c:otherwise>
                    <c:forEach var="order" items="${orders}" end="3">
                        <div class="order-card">
                            <div class="order-card-top">
                                <div>
                                    <p class="order-id">Order #${order.id}</p>
                                    <p class="order-date">${order.orderDate}</p>
                                </div>
                                <span class="badge badge-${order.status}">${order.status}</span>
                            </div>
                            <p class="order-total">Rs. <fmt:formatNumber value="${order.totalAmount}" pattern="#,##0"/></p>
                        </div>
                    </c:forEach>
                    <a href="${pageContext.request.contextPath}/user/orders" class="view-all-link">View all orders →</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

</body>
</html>

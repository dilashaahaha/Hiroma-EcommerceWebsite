<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Orders – Hiroma</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile.css">
</head>
<body>

<nav class="navbar">
    <a href="${pageContext.request.contextPath}/home" class="nav-brand">H<span>/</span>ROMA</a>
    <div class="nav-links"><a href="${pageContext.request.contextPath}/shop">Shop</a></div>
    <div class="nav-actions"><a href="${pageContext.request.contextPath}/logout">Sign out</a></div>
</nav>

<div class="orders-page">
    <div class="orders-header">
        <p class="orders-label">— YOUR ACCOUNT</p>
        <h1>Order <em>history</em></h1>
    </div>

    <div class="orders-list">
        <c:choose>
            <c:when test="${empty orders}">
                <div class="orders-empty">
                    <p>You haven't placed any orders yet.</p>
                    <a href="${pageContext.request.contextPath}/shop" class="btn-shop-now">BROWSE TEAS</a>
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach var="order" items="${orders}">
                    <div class="order-card">
                        <div class="order-card-top">
                            <div>
                                <p class="order-id">Order #${order.id}</p>
                                <p class="order-date">${order.orderDate}</p>
                            </div>
                            <span class="badge badge-${order.status}">${order.status}</span>
                        </div>
                        <div class="order-card-bottom">
                            <p class="order-total">Rs. <fmt:formatNumber value="${order.totalAmount}" pattern="#,##0"/></p>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
</div>

</body>
</html>

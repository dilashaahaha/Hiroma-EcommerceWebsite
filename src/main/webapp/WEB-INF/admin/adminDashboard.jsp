<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard – Hiroma Admin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
</head>
<body>

<div class="admin-wrapper">

    <!-- SIDEBAR -->
    <aside class="sidebar">
        <div class="sidebar-brand">H<span>/</span>ROMA</div>
        <p class="sidebar-label">ADMIN PANEL</p>
        <nav>
            <a href="${pageContext.request.contextPath}/admin/dashboard" class="active">Dashboard</a>
            <a href="${pageContext.request.contextPath}/admin/products">Products</a>
            <a href="${pageContext.request.contextPath}/admin/categories">Categories</a>
            <a href="${pageContext.request.contextPath}/admin/orders">Orders</a>
            <a href="${pageContext.request.contextPath}/admin/users">Users</a>
        </nav>
        <a href="${pageContext.request.contextPath}/logout" class="sidebar-logout">Sign out</a>
    </aside>

    <!-- MAIN -->
    <main class="main-content">

        <div class="dash-topbar">
            <div>
                <p class="dash-greeting">Good day, ${adminName}</p>
                <p class="dash-sub">Here's what's happening with your store today.</p>
            </div>
            <a href="${pageContext.request.contextPath}/admin/products?action=add" class="btn-add-product">+ ADD PRODUCT</a>
        </div>

        <!-- STAT CARDS -->
        <div class="stats-grid">
            <div class="stat-card">
                <p class="stat-label">TOTAL PRODUCTS</p>
                <p class="stat-value">${totalProducts}</p>
            </div>
            <div class="stat-card">
                <p class="stat-label">TOTAL ORDERS</p>
                <p class="stat-value">${totalOrders}</p>
            </div>
            <div class="stat-card">
                <p class="stat-label">REGISTERED USERS</p>
                <p class="stat-value">${totalUsers}</p>
            </div>
            <div class="stat-card stat-card-pending">
                <p class="stat-label">PENDING APPROVALS</p>
                <p class="stat-value">${pendingUsers}</p>
                <a href="${pageContext.request.contextPath}/admin/users" class="stat-link">Review →</a>
            </div>
        </div>

        <div class="dash-grid">

            <!-- RECENT ORDERS -->
            <div class="dash-card">
                <div class="dash-card-header">
                    <h3>Recent Orders</h3>
                    <a href="${pageContext.request.contextPath}/admin/orders">View all →</a>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>ORDER</th>
                            <th>CUSTOMER</th>
                            <th>AMOUNT</th>
                            <th>STATUS</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${empty recentOrders}">
                                <tr><td colspan="4" class="empty-msg">No orders yet.</td></tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="order" items="${recentOrders}">
                                    <tr>
                                        <td>#${order.id}</td>
                                        <td>${order.customerName}</td>
                                        <td>Rs. <fmt:formatNumber value="${order.amount}" pattern="#,##0"/></td>
                                        <td><span class="badge badge-${order.status}">${order.status}</span></td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>

            <!-- BY CATEGORY -->
            <div class="dash-card">
                <div class="dash-card-header">
                    <h3>Products by Category</h3>
                </div>
                <div class="category-stats">
                    <c:forEach var="cat" items="${categoryStats}">
                        <div class="cat-row">
                            <span class="cat-name">${cat.name}</span>
                            <span class="cat-count">${cat.total} products</span>
                        </div>
                        <div class="cat-bar-wrap">
                            <div class="cat-bar" style="width: ${cat.total * 10}%"></div>
                        </div>
                    </c:forEach>
                </div>
            </div>

        </div>
    </main>
</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Orders – Hiroma Admin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
</head>
<body>
<div class="admin-wrapper">
    <aside class="sidebar">
        <div class="sidebar-brand">H<span>/</span>ROMA</div>
        <p class="sidebar-label">ADMIN PANEL</p>
        <nav>
            <a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a>
            <a href="${pageContext.request.contextPath}/admin/products">Products</a>
            <a href="${pageContext.request.contextPath}/admin/categories">Categories</a>
            <a href="${pageContext.request.contextPath}/admin/orders" class="active">Orders</a>
            <a href="${pageContext.request.contextPath}/admin/users">Users</a>
        </nav>
        <a href="${pageContext.request.contextPath}/logout" class="sidebar-logout">Sign out</a>
    </aside>
    <main class="main-content">
        <div class="page-header">
            <div>
                <h1>Orders</h1>
                <p>Dashboard / Orders</p>
            </div>
        </div>

        <div class="table-card">
            <table>
                <thead>
                    <tr>
                        <th>ORDER</th>
                        <th>CUSTOMER</th>
                        <th>AMOUNT</th>
                        <th>DATE</th>
                        <th>STATUS</th>
                        <th>UPDATE STATUS</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${empty orders}">
                            <tr><td colspan="6" class="empty-msg">No orders yet.</td></tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="order" items="${orders}">
                                <tr>
                                    <td>#${order.id}</td>
                                    <td>${order.customerName}</td>
                                    <td>Rs. <fmt:formatNumber value="${order.totalAmount}" pattern="#,##0"/></td>
                                    <td>${order.orderDate}</td>
                                    <td><span class="badge badge-${order.status}">${order.status}</span></td>
                                    <td>
                                        <form action="${pageContext.request.contextPath}/admin/orders" method="post" style="display:flex;gap:0.4rem">
                                            <input type="hidden" name="orderId" value="${order.id}"/>
                                            <select name="status" class="status-select">
                                                <option value="pending" ${order.status=='pending'?'selected':''}>Pending</option>
                                                <option value="processing" ${order.status=='processing'?'selected':''}>Processing</option>
                                                <option value="shipped" ${order.status=='shipped'?'selected':''}>Shipped</option>
                                                <option value="delivered" ${order.status=='delivered'?'selected':''}>Delivered</option>
                                                <option value="cancelled" ${order.status=='cancelled'?'selected':''}>Cancelled</option>
                                            </select>
                                            <button type="submit" class="btn-approve">Update</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>
    </main>
</div>
</body>
</html>

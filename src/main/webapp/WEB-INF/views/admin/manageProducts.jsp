<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products – Hiroma Admin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
</head>
<body>
<div class="admin-wrapper">
    <aside class="sidebar">
        <div class="sidebar-brand">H<span>/</span>ROMA</div>
        <p class="sidebar-label">ADMIN PANEL</p>
        <nav>
            <a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a>
            <a href="${pageContext.request.contextPath}/admin/products" class="active">Products</a>
            <a href="${pageContext.request.contextPath}/admin/categories">Categories</a>
            <a href="${pageContext.request.contextPath}/admin/orders">Orders</a>
            <a href="${pageContext.request.contextPath}/admin/users">Users</a>
        </nav>
        <a href="${pageContext.request.contextPath}/logout" class="sidebar-logout">Sign out</a>
    </aside>
    <main class="main-content">
        <div class="page-header">
            <div>
                <h1>Products</h1>
                <p>Dashboard / Products</p>
            </div>
            <a href="${pageContext.request.contextPath}/admin/products?action=add" class="btn-add-product">+ ADD PRODUCT</a>
        </div>

        <c:if test="${not empty param.success}">
            <div class="alert alert-success">${param.success}</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-error">${error}</div>
        </c:if>

        <!-- Search -->
        <form action="${pageContext.request.contextPath}/admin/products" method="get" class="search-bar">
            <input type="text" name="search" placeholder="Search products, SKUs..." value="${keyword}" />
            <button type="submit">Search</button>
        </form>

        <div class="table-card">
            <table>
                <thead>
                    <tr>
                        <th>PRODUCT</th>
                        <th>CATEGORY</th>
                        <th>BRAND</th>
                        <th>PRICE</th>
                        <th>STOCK</th>
                        <th>ACTIONS</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${empty teas}">
                            <tr><td colspan="6" class="empty-msg">No products found.</td></tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="tea" items="${teas}">
                                <tr>
                                    <td>
                                        <strong>${tea.name}</strong>
                                    </td>
                                    <td>${tea.categoryName}</td>
                                    <td>${tea.brandName}</td>
                                    <td>Rs. <fmt:formatNumber value="${tea.price}" pattern="#,##0"/></td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${tea.stock <= 10}">
                                                <span class="badge badge-rejected">${tea.stock} low</span>
                                            </c:when>
                                            <c:otherwise>${tea.stock}</c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="action-btns">
                                        <a href="${pageContext.request.contextPath}/admin/products?action=edit&id=${tea.id}" class="btn-edit">edit</a>
                                        <form action="${pageContext.request.contextPath}/admin/products" method="post" style="display:inline">
                                            <input type="hidden" name="action" value="delete"/>
                                            <input type="hidden" name="id" value="${tea.id}"/>
                                            <button type="submit" class="btn-delete" onclick="return confirm('Delete this product?')">✕</button>
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

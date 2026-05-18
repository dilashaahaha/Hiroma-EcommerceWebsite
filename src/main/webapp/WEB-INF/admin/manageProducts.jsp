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

    <!-- SIDEBAR -->
    <aside class="sidebar">
        <div class="sidebar-brand">H<span>/</span>ROMA</div>
        <p class="sidebar-label">ADMIN PANEL</p>
        <nav>
            <a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a>
            <a href="${pageContext.request.contextPath}/admin/products" class="active">Products</a>
            <a href="${pageContext.request.contextPath}/admin/categories">Categories</a>
            <a href="${pageContext.request.contextPath}/admin/brands">Brands</a>
            <a href="${pageContext.request.contextPath}/admin/orders">Orders</a>
            <a href="${pageContext.request.contextPath}/admin/users">Users</a>
        </nav>
        <a href="${pageContext.request.contextPath}/logout" class="sidebar-logout">Sign out</a>
    </aside>

    <!-- MAIN CONTENT -->
    <main class="main-content">

        <!-- BREADCRUMB + HEADER -->
        <div class="page-topbar">
            <div>
                <p class="breadcrumb"><a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a> / Products</p>
                <h1 class="page-title">Products</h1>
            </div>
            <a href="${pageContext.request.contextPath}/admin/products?action=add" class="btn-add">+ ADD PRODUCT</a>
        </div>

        <!-- SUCCESS/ERROR ALERTS -->
        <c:if test="${param.success == 'added'}">
            <div class="alert alert-success">Product added successfully.</div>
        </c:if>
        <c:if test="${param.success == 'updated'}">
            <div class="alert alert-success">Product updated successfully.</div>
        </c:if>
        <c:if test="${param.success == 'deleted'}">
            <div class="alert alert-success">Product deleted successfully.</div>
        </c:if>

        <!-- SEARCH & FILTER -->
        <form method="get" action="${pageContext.request.contextPath}/admin/products" class="filter-bar">
            <div class="search-wrap">
                <span class="search-icon">&#9906;</span>
                <input type="text" name="keyword" placeholder="Search products..."
                       value="${keyword}" class="search-input" />
            </div>

            <select name="categoryId" class="filter-select">
                <option value="0">All categories</option>
                <c:forEach var="cat" items="${categories}">
                    <option value="${cat.id}" ${selectedCategory == cat.id ? 'selected' : ''}>${cat.name}</option>
                </c:forEach>
            </select>

            <select name="brandId" class="filter-select">
                <option value="0">All brands</option>
                <c:forEach var="brand" items="${brands}">
                    <option value="${brand.id}" ${selectedBrand == brand.id ? 'selected' : ''}>${brand.name}</option>
                </c:forEach>
            </select>

            <button type="submit" class="btn-filter">Search</button>
        </form>

        <!-- PRODUCTS TABLE -->
        <div class="table-card">
            <div class="table-meta">
                Showing <strong>${products.size()}</strong> product(s)
            </div>
            <table>
                <thead>
                    <tr>
                        <th>PRODUCT</th>
                        <th>CATEGORY</th>
                        <th>BRAND</th>
                        <th>PRICE</th>
                        <th>STOCK</th>
                        <th>STATUS</th>
                        <th>ACTIONS</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${empty products}">
                            <tr>
                                <td colspan="7" class="empty-msg">No products found.</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="p" items="${products}">
                                <tr>
                                    <td>
                                        <div class="product-cell">
                                            <c:choose>
                                                <c:when test="${not empty p.imagePath}">
                                                    <img src="${pageContext.request.contextPath}/${p.imagePath}"
                                                         alt="${p.name}" class="product-thumb" />
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="product-thumb-placeholder">T</div>
                                                </c:otherwise>
                                            </c:choose>
                                            <span class="product-name">${p.name}</span>
                                        </div>
                                    </td>
                                    <td>${p.categoryName}</td>
                                    <td>${p.brandName}</td>
                                    <td>Rs. <fmt:formatNumber value="${p.price}" pattern="#,##0"/></td>
                                    <td>
                                        <div class="stock-cell">
                                            <div class="stock-bar-wrap">
                                                <div class="stock-bar stock-bar-${p.stockStatus}"
                                                     style="width: ${p.stock > 100 ? 100 : p.stock}%"></div>
                                            </div>
                                            <span>${p.stock}</span>
                                        </div>
                                    </td>
                                    <td>
                                        <span class="badge badge-stock-${p.stockStatus}">
                                            <c:choose>
                                                <c:when test="${p.stockStatus == 'active'}">ACTIVE</c:when>
                                                <c:when test="${p.stockStatus == 'low'}">LOW STOCK</c:when>
                                                <c:otherwise>OUT OF STOCK</c:otherwise>
                                            </c:choose>
                                        </span>
                                    </td>
                                    <td class="action-btns">
                                        <a href="${pageContext.request.contextPath}/admin/products?action=edit&id=${p.id}"
                                           class="btn-edit">edit</a>
                                        <a href="${pageContext.request.contextPath}/admin/products?action=delete&id=${p.id}"
                                           class="btn-delete"
                                           onclick="return confirm('Delete ${p.name}? This cannot be undone.')">&#10005;</a>
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

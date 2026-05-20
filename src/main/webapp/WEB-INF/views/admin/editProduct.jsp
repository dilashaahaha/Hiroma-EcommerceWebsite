<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product – Hiroma Admin</title>
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
                <h1>Edit Product</h1>
                <p>Dashboard / Products / Edit</p>
            </div>
            <a href="${pageContext.request.contextPath}/admin/products" class="btn-edit">← Back</a>
        </div>

        <c:if test="${not empty error}">
            <div class="alert alert-error">${error}</div>
        </c:if>

        <div class="add-product-layout">
            <form action="${pageContext.request.contextPath}/admin/products" method="post">
                <input type="hidden" name="action" value="edit"/>
                <input type="hidden" name="id" value="${tea.id}"/>
                <input type="hidden" name="currentImage" value="${tea.imagePath}"/>

                <div class="form-card">
                    <h3 class="form-section-title">Product Information</h3>
                    <div class="field-group">
                        <label>PRODUCT NAME *</label>
                        <input type="text" name="name" required value="${tea.name}"/>
                    </div>
                    <div class="field-group">
                        <label>DESCRIPTION</label>
                        <textarea name="description">${tea.description}</textarea>
                    </div>
                    <div class="field-row-2">
                        <div class="field-group">
                            <label>CATEGORY *</label>
                            <select name="categoryId" required>
                                <c:forEach var="cat" items="${categories}">
                                    <option value="${cat.id}" ${cat.id == tea.categoryId ? 'selected' : ''}>${cat.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="field-group">
                            <label>BRAND *</label>
                            <select name="brandId" required>
                                <c:forEach var="brand" items="${brands}">
                                    <option value="${brand.id}" ${brand.id == tea.brandId ? 'selected' : ''}>${brand.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <h3 class="form-section-title" style="margin-top:1.5rem">Pricing & Inventory</h3>
                    <div class="field-row-2">
                        <div class="field-group">
                            <label>PRICE (RS.) *</label>
                            <input type="number" name="price" required min="0" step="0.01" value="${tea.price}"/>
                        </div>
                        <div class="field-group">
                            <label>STOCK *</label>
                            <input type="number" name="stock" required min="0" value="${tea.stock}"/>
                        </div>
                    </div>
                    <div class="field-group">
                        <label>IMAGE PATH</label>
                        <input type="text" name="imagePath" value="${tea.imagePath}" placeholder="Leave blank to keep current"/>
                    </div>

                    <div class="form-actions">
                        <button type="submit" class="btn-primary-form">SAVE CHANGES</button>
                        <a href="${pageContext.request.contextPath}/admin/products" class="btn-cancel">Cancel</a>
                    </div>
                </div>
            </form>
        </div>
    </main>
</div>
</body>
</html>

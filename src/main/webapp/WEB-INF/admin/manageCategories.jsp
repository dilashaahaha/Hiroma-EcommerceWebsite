<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Categories – Hiroma Admin</title>
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
            <a href="${pageContext.request.contextPath}/admin/categories" class="active">Categories</a>
            <a href="${pageContext.request.contextPath}/admin/orders">Orders</a>
            <a href="${pageContext.request.contextPath}/admin/users">Users</a>
        </nav>
        <a href="${pageContext.request.contextPath}/logout" class="sidebar-logout">Sign out</a>
    </aside>
    <main class="main-content">
        <div class="page-header">
            <div><h1>Categories</h1><p>Dashboard / Categories</p></div>
        </div>

        <c:if test="${not empty param.success}">
            <div class="alert alert-success">${param.success}</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-error">${error}</div>
        </c:if>

        <div class="cat-layout">
            <!-- LEFT: list -->
            <div class="table-card" style="flex:1">
                <div style="padding:1rem 1.2rem;border-bottom:1px solid #f0ece4">
                    <strong>All categories (${categories.size()})</strong>
                </div>
                <c:forEach var="cat" items="${categories}">
                    <div class="cat-list-row">
                        <div>
                            <div class="cat-list-name">${cat.name}</div>
                            <div class="cat-list-sub">${cat.productCount} products</div>
                        </div>
                        <div class="action-btns">
                            <a href="${pageContext.request.contextPath}/admin/categories?action=edit&id=${cat.id}" class="btn-edit">edit</a>
                            <form action="${pageContext.request.contextPath}/admin/categories" method="post" style="display:inline">
                                <input type="hidden" name="action" value="delete"/>
                                <input type="hidden" name="id" value="${cat.id}"/>
                                <button type="submit" class="btn-delete" onclick="return confirm('Delete category?')">✕</button>
                            </form>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <!-- RIGHT: add form -->
            <div class="form-card" style="width:300px;align-self:flex-start">
                <h3 style="font-size:0.9rem;margin-bottom:1.2rem">
                    ${not empty editCat ? 'Edit category' : 'Add new category'}
                </h3>
                <form action="${pageContext.request.contextPath}/admin/categories" method="post">
                    <input type="hidden" name="action" value="${not empty editCat ? 'edit' : 'add'}"/>
                    <c:if test="${not empty editCat}">
                        <input type="hidden" name="id" value="${editCat.id}"/>
                    </c:if>
                    <div class="field-group">
                        <label>CATEGORY NAME *</label>
                        <input type="text" name="name" placeholder="e.g. Oolong Tea" required
                               value="${not empty editCat ? editCat.name : ''}"/>
                    </div>
                    <div class="field-group">
                        <label>DESCRIPTION</label>
                        <textarea name="description" placeholder="Brief description...">${not empty editCat ? editCat.description : ''}</textarea>
                    </div>
                    <button type="submit" class="btn-primary-form" style="width:100%">
                        ${not empty editCat ? 'SAVE CHANGES' : 'ADD CATEGORY'}
                    </button>
                    <c:if test="${not empty editCat}">
                        <a href="${pageContext.request.contextPath}/admin/categories"
                           style="display:block;text-align:center;margin-top:0.7rem;font-size:0.75rem;color:#888">Cancel</a>
                    </c:if>
                </form>
            </div>
        </div>
    </main>
</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hiroma Admin — Categories</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
</head>
<body>

<nav class="admin-navbar">
    <span class="navbar-brand">Hi<span>roma</span></span>
    <div class="navbar-spacer"></div>
    <div class="navbar-user">
        <div class="navbar-avatar">
            ${not empty sessionScope.loggedInUser ? sessionScope.loggedInUser.fullName.substring(0,1).toUpperCase() : 'A'}
        </div>
        <span>${not empty sessionScope.loggedInUser ? sessionScope.loggedInUser.fullName : 'Admin'}</span>
        <a href="${pageContext.request.contextPath}/auth/logout"
           style="color:rgba(255,255,255,.55); font-size:.8rem; margin-left:.5rem;">Logout</a>
    </div>
</nav>

<c:if test="${not empty sessionScope.flashSuccess}">
    <div style="padding:.6rem 2rem 0;">
        <div class="flash-banner flash-success">${sessionScope.flashSuccess}</div>
    </div>
    <c:remove var="flashSuccess" scope="session"/>
</c:if>
<c:if test="${not empty sessionScope.flashError}">
    <div style="padding:.6rem 2rem 0;">
        <div class="flash-banner flash-error">${sessionScope.flashError}</div>
    </div>
    <c:remove var="flashError" scope="session"/>
</c:if>

<div class="admin-shell">

    <aside class="admin-sidebar">
        <span class="sidebar-group-label">Menu</span>
        <a href="${pageContext.request.contextPath}/admin/dashboard" class="sidebar-item">
            <span class="si-icon"></span><span class="si-label">Dashboard</span>
        </a>
        <span class="sidebar-group-label">Catalogue</span>
        <a href="${pageContext.request.contextPath}/admin/products" class="sidebar-item">
            <span class="si-icon"></span><span class="si-label">Products</span>
        </a>
        <a href="${pageContext.request.contextPath}/admin/categories" class="sidebar-item active">
            <span class="si-icon"></span><span class="si-label">Categories</span>
        </a>
        <a href="${pageContext.request.contextPath}/admin/brands" class="sidebar-item">
            <span class="si-icon"></span><span class="si-label">Brands</span>
        </a>
        <span class="sidebar-group-label">Sales</span>
        <a href="${pageContext.request.contextPath}/admin/orders" class="sidebar-item">
            <span class="si-icon"></span><span class="si-label">Orders</span>
        </a>
        <span class="sidebar-group-label">Users</span>
        <a href="${pageContext.request.contextPath}/admin/users" class="sidebar-item">
            <span class="si-icon"></span><span class="si-label">Users</span>
        </a>
        <div class="sidebar-divider"></div>
        <a href="${pageContext.request.contextPath}/auth/logout" class="sidebar-item">
            <span class="si-icon"></span><span class="si-label">Logout</span>
        </a>
    </aside>

    <main class="admin-content">

        <div class="page-header">
            <div>
                <h1>Categories</h1>
                <div class="breadcrumb">Admin / <span>Categories</span></div>
            </div>
            <button class="btn btn-primary" onclick="openModal('addCatModal')">
                + Add Category
            </button>
        </div>

        <div style="display:grid; grid-template-columns:1fr 360px; gap:1.5rem; align-items:start;">

            <div>
                <div class="card">
                    <div class="card-header">
                        <h2>All Categories
                            <span style="font-weight:400;color:var(--text-muted);font-size:.85rem;">
                                (${not empty categories ? categories.size() : 0})
                            </span>
                        </h2>
                    </div>
                    <div class="card-scroll">
                        <table class="data-table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Category Name</th>
                                    <th>Description</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${empty categories}">
                                        <tr>
                                            <td colspan="4"
                                                style="text-align:center;padding:2.5rem;color:var(--text-muted);">
                                                No categories yet. Add your first one →
                                            </td>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="cat" items="${categories}">
                                        <tr>
                                            <td style="color:var(--text-muted);font-size:.8rem;">
                                                ${cat.categoryId}
                                            </td>
                                            <td>
                                                <strong style="color:var(--text-dark);">
                                                    ${cat.categoryName}
                                                </strong>
                                            </td>
                                            <td style="color:var(--text-muted);font-size:.85rem;">
                                                <c:choose>
                                                    <c:when test="${not empty cat.description}">
                                                        ${cat.description.length() > 60
                                                            ? cat.description.substring(0,60).concat('…')
                                                            : cat.description}
                                                    </c:when>
                                                    <c:otherwise>—</c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <div style="display:flex;gap:.4rem;">
                                                    <button class="btn btn-sm btn-outline"
                                                        onclick="openEditCategory(
                                                            '${cat.categoryId}',
                                                            '${cat.categoryName}',
                                                            '${cat.description}')">
                                                    </button>
                                                    <form action="${pageContext.request.contextPath}/admin/categories/delete"
                                                          method="post" style="display:inline;"
                                                          onsubmit="return confirm('Delete category: ${cat.categoryName}?');">
                                                        <input type="hidden" name="categoryId"
                                                               value="${cat.categoryId}">
                                                        <button type="submit"
                                                                class="btn btn-sm btn-danger">
                                                        </button>
                                                    </form>
                                                </div>
                                            </td>
                                        </tr>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div>
                <div class="card">
                    <div class="card-header"><h2>Quick Add Category</h2></div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/admin/categories/add"
                              method="post" novalidate>
                            <div class="form-group">
                                <label for="quickCatName">Category Name *</label>
                                <input type="text" id="quickCatName" name="categoryName"
                                       required placeholder="e.g. Green Tea">
                            </div>
                            <div class="form-group">
                                <label for="quickCatDesc">Description</label>
                                <textarea id="quickCatDesc" name="description" rows="3"
                                          placeholder="Short description…"></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary btn-full">
                                Add Category
                            </button>
                        </form>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header"><h2>Category Tags</h2></div>
                    <div class="card-body">
                        <div class="category-chips">
                            <c:choose>
                                <c:when test="${empty categories}">
                                    <span style="color:var(--text-muted);font-size:.85rem;">
                                        No categories yet.
                                    </span>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="cat" items="${categories}">
                                        <span class="category-chip">
                                            ${cat.categoryName}
                                            <form action="${pageContext.request.contextPath}/admin/categories/delete"
                                                  method="post" style="display:inline;"
                                                  onsubmit="return confirm('Delete?');">
                                                <input type="hidden" name="categoryId"
                                                       value="${cat.categoryId}">
                                                <button type="submit" class="chip-delete"
                                                        title="Delete">✕</button>
                                            </form>
                                        </span>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </main>
</div>

<div class="modal-backdrop" id="addCatModal">
    <div class="modal" style="max-width:440px;">
        <div class="modal-header">
            <h3>Add New Category</h3>
            <button class="modal-close" onclick="closeModal('addCatModal')">✕</button>
        </div>
        <form action="${pageContext.request.contextPath}/admin/categories/add"
              method="post" novalidate>
            <div class="modal-body">
                <div class="form-group">
                    <label>Category Name *</label>
                    <input type="text" name="categoryName" required
                           placeholder="e.g. Green Tea">
                </div>
                <div class="form-group">
                    <label>Description</label>
                    <textarea name="description" rows="3"
                              placeholder="Optional description…"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-ghost"
                        onclick="closeModal('addCatModal')">Cancel</button>
                <button type="submit" class="btn btn-primary">Add Category</button>
            </div>
        </form>
    </div>
</div>

<div class="modal-backdrop" id="editCatModal">
    <div class="modal" style="max-width:440px;">
        <div class="modal-header">
            <h3>Edit Category</h3>
            <button class="modal-close" onclick="closeModal('editCatModal')">✕</button>
        </div>
        <form action="${pageContext.request.contextPath}/admin/categories/update"
              method="post" novalidate>
            <input type="hidden" id="editCatId" name="categoryId">
            <div class="modal-body">
                <div class="form-group">
                    <label>Category Name *</label>
                    <input type="text" id="editCatName" name="categoryName" required>
                </div>
                <div class="form-group">
                    <label>Description</label>
                    <textarea id="editCatDesc" name="description" rows="3"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-ghost"
                        onclick="closeModal('editCatModal')">Cancel</button>
                <button type="submit" class="btn btn-primary">Save Changes</button>
            </div>
        </form>
    </div>
</div>

<script>
    function openModal(id)  { document.getElementById(id).classList.add('open');    }
    function closeModal(id) { document.getElementById(id).classList.remove('open'); }

    // Close on backdrop click
    document.querySelectorAll('.modal-backdrop').forEach(el => {
        el.addEventListener('click', function(e) {
            if (e.target === this) this.classList.remove('open');
        });
    });

    function openEditCategory(id, name, description) {
        document.getElementById('editCatId').value   = id;
        document.getElementById('editCatName').value = name;
        document.getElementById('editCatDesc').value = description;
        openModal('editCatModal');
    }
</script>

</body>
</html>

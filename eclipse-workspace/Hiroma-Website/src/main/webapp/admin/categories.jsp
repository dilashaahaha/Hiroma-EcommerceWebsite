<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Categories — Hiroma Admin</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/categories.css">
</head>
<body>

<aside class="sidebar">
    <div class="sidebar-logo">
        <div class="name">H<span>i</span>roma</div>
        <div class="tag">Admin Panel</div>
    </div>
    <nav style="flex:1;">
        <div class="sidebar-section-label">Overview</div>
        <a class="nav-item" href="${pageContext.request.contextPath}/dashboard"><span class="icon">&bull;</span> Dashboard</a>
        <div class="sidebar-section-label">Catalogue</div>
        <a class="nav-item" href="${pageContext.request.contextPath}/product"><span class="icon">&bull;</span> Products</a>
        <a class="nav-item" href="${pageContext.request.contextPath}/brands"><span class="icon">&bull;</span> Brands</a>
        <a class="nav-item active" href="${pageContext.request.contextPath}/categories"><span class="icon">&bull;</span> Categories</a>
        <div class="sidebar-section-label">Orders &amp; Users</div>
        <a class="nav-item" href="${pageContext.request.contextPath}/orders"><span class="icon">&bull;</span> Orders</a>
        <a class="nav-item" href="${pageContext.request.contextPath}/users"><span class="icon">&bull;</span> Users</a>
    </nav>
</aside>

<div class="main">

    <div class="topbar">
        <div class="topbar-left">
            <div class="topbar-title">Categories</div>
            <div class="topbar-crumb"><a href="${pageContext.request.contextPath}/dashboard">Dashboard</a> / Categories</div>
        </div>
    </div>

    <div class="content">
        <div class="content-grid">

            <!-- LEFT: Category List -->
            <div class="cat-list-wrap">
                <h3 class="cat-list-title">All categories (4)</h3>
                <div class="cat-divider"></div>

             
                <div class="cat-row">
                    <div class="cat-thumb" style="background:#EAF3DE;">
                    <img src="${pageContext.request.contextPath}/images/green-tea.jpg"  width="40" height="40" 
                                style="border-radius:4px; object-fit:cover;">
                    </div>
                    <div class="cat-info">
                        <div class="cat-name">Green Tea</div>
                        <div class="cat-slug">/category/green-tea</div>
                    </div>
                    <div class="cat-count">12 products</div>
                    <div class="cat-actions">
                        <a href="${pageContext.request.contextPath}/editCategory?id=1" ></a>
                        <a href="${pageContext.request.contextPath}/deleteCategory?id=1" class="action-btn delete" title="Delete" onclick="return confirm('Are you sure?')">✕</a>
                    </div>
                </div>

                <!-- Black Tea -->
                <div class="cat-row">
                    <div class="cat-thumb" >
                    <img src="${pageContext.request.contextPath}/images/Black-ilam.avif"  width="40" height="40" 
                                style="border-radius:4px; object-fit:cover;">
                    </div>
                    <div class="cat-info">
                        <div class="cat-name">Black Tea</div>
                        <div class="cat-slug">/category/black-tea</div>
                    </div>
                    <div class="cat-count">18 products</div>
                    <div class="cat-actions">
                        <a href="${pageContext.request.contextPath}/editCategory?id=2" ></a>
                        <a href="${pageContext.request.contextPath}/deleteCategory?id=2" class="action-btn delete" title="Delete" onclick="return confirm('Are you sure?')">✕</a>
                    </div>
                </div>

                <!-- White Tea -->
                <div class="cat-row">
                    <div class="cat-thumb">
                    <img src="${pageContext.request.contextPath}/images/white-tea.webp"  width="40" height="40" 
                                style="border-radius:4px; object-fit:cover;">
                    </div>
                    <div class="cat-info">
                        <div class="cat-name">White Tea</div>
                        <div class="cat-slug">/category/white-tea</div>
                    </div>
                    <div class="cat-count">7 products</div>
                    <div class="cat-actions">
                        <a href="${pageContext.request.contextPath}/editCategory?id=3" ></a>
                        <a href="${pageContext.request.contextPath}/deleteCategory?id=3" class="action-btn delete" title="Delete" onclick="return confirm('Are you sure?')">✕</a>
                    </div>
                </div>

                <!-- Herbal Blends -->
                <div class="cat-row">
                    <div class="cat-thumb" >
                    <img src="${pageContext.request.contextPath}/images/herbal-tea.webp"  width="30" height="30" 
                                style="border-radius:4px; object-fit:cover;">
                                 </div>
                                        <div class="cat-info">
                        <div class="cat-name">Herbal Blends</div>
                        <div class="cat-slug">/category/herbal-blends</div>
                    </div>
                    <div class="cat-count">9 products</div>
                    <div class="cat-actions">
                        <a href="${pageContext.request.contextPath}/editCategory?id=4" ></a>
                        <a href="${pageContext.request.contextPath}/deleteCategory?id=4" class="action-btn delete" title="Delete" onclick="return confirm('Are you sure?')">✕</a>
                    </div>
                    </div>
                </div>

            </div>

            <div class="cat-form-wrap">
                <h3 class="cat-form-title">Add new category</h3>

                <form action="${pageContext.request.contextPath}/addCategory" method="post">
                    <div class="form-group">
                        <label class="form-label">CATEGORY NAME *</label>
                        <input type="text" name="name" class="form-input" placeholder="e.g. Oolong Tea" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label">URL SLUG *</label>
                        <input type="text" name="slug" class="form-input" placeholder="e.g. oolong-tea" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label">DESCRIPTION</label>
                        <textarea name="description" class="form-textarea" placeholder="Brief description shown on category pages…"></textarea>
                    </div>
                    <button type="submit" class="btn-submit">ADD CATEGORY</button>
                </form>
            </div>

        </div>
    </div>
</div>

</body>
</html>

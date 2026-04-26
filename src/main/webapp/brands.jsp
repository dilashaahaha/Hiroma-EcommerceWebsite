<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Brands Management - H/ROMA Admin</title>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/brands.css">
</head>
<body>

<div class="admin-layout">

    <!-- ===== SIDEBAR ===== -->
    <aside class="admin-sidebar">
        <div class="sidebar-logo">
            <div class="logo-text">H/ROMA</div>
            <div class="logo-sub">ADMIN PANEL</div>
        </div>
        <div class="sidebar-section">
            <p class="sidebar-section-label">OVERVIEW</p>
            <ul class="sidebar-nav">
                <li><a href="${pageContext.request.contextPath}/admin/dashboard" class="sidebar-link">&#9783; Dashboard</a></li>
            </ul>
        </div>
        <div class="sidebar-section">
            <p class="sidebar-section-label">CATALOGUES</p>
            <ul class="sidebar-nav">
                <li><a href="${pageContext.request.contextPath}/admin/products" class="sidebar-link">&#8226; Products</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/brands" class="sidebar-link active">&#8226; Brands <span class="sidebar-badge">3</span></a></li>
                <li><a href="${pageContext.request.contextPath}/admin/categories" class="sidebar-link">&#8226; Categories</a></li>
            </ul>
        </div>
        <div class="sidebar-section">
            <p class="sidebar-section-label">ORDERS &amp; USERS</p>
            <ul class="sidebar-nav">
                <li><a href="${pageContext.request.contextPath}/admin/orders" class="sidebar-link">&#8226; Orders</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/users" class="sidebar-link">&#8226; Users</a></li>
            </ul>
        </div>
    </aside>

    <!-- ===== MAIN CONTENT ===== -->
    <main class="admin-content">

        <div class="page-header">
            <div>
                <h1 class="page-title">Brands</h1>
                <p class="breadcrumb"><a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a> / Brands</p>
            </div>
            <a href="${pageContext.request.contextPath}/admin/brands/new" class="btn-register">+ REGISTER NEW BRAND</a>
        </div>

        <!-- Tabs -->
        <div class="tab-bar">
            <a href="#" class="tab active" onclick="switchTab(this)">PENDING APPROVAL <span class="tab-count">3</span></a>
            <a href="#" class="tab" onclick="switchTab(this)">APPROVED <span class="tab-count">9</span></a>
            <a href="#" class="tab" onclick="switchTab(this)">ALL BRANDS <span class="tab-count">12</span></a>
        </div>

        <!-- Brands Grid -->
        <div class="brands-grid">

            <!-- Brand Card 1 -->
            <div class="brand-card">
                <div class="brand-img-wrapper">
                    <img src="${pageContext.request.contextPath}/images/illamgreentea.jpg"
                         alt="Illam Organic Teas"
                         class="brand-img"
                         onerror="this.style.display='none'; this.nextElementSibling.style.display='block'">
                    <div class="brand-img-fallback" style="display:none;"></div>
                    <span class="brand-status pending">PENDING</span>
                </div>
                <div class="brand-body">
                    <h3 class="brand-name">Illam Organic Teas</h3>
                    <p class="brand-meta">Illam &bull; Koshi Province &bull; by Ram Kumar</p>
                    <p class="brand-desc">Family-owned tea estate producing premium first flush and second flush teas at 1,200m altitude since 1978.</p>
                    <div class="brand-actions">
                        <button class="btn-approve" onclick="approveBrand(this)">&#10003; APPROVE</button>
                        <button class="btn-reject" onclick="rejectBrand(this)">&#10005; REJECT</button>
                        <a href="${pageContext.request.contextPath}/admin/brands/edit/1" class="btn-edit">EDIT</a>
                    </div>
                </div>
            </div>

            <!-- Brand Card 2 -->
            <div class="brand-card">
                <div class="brand-img-wrapper">
                    <img src="${pageContext.request.contextPath}/images/himalayangreentea.jpg"
                         alt="Himalayan Green Tea"
                         class="brand-img"
                         onerror="this.style.display='none'; this.nextElementSibling.style.display='block'">
                    <div class="brand-img-fallback brand-img-fallback-2" style="display:none;"></div>
                    <span class="brand-status pending">PENDING</span>
                </div>
                <div class="brand-body">
                    <h3 class="brand-name">Himalayan Green Tea</h3>
                    <p class="brand-meta">Taplejung &bull; Koshi Province &bull; by Sita Moktan</p>
                    <p class="brand-desc">Specialising in rare white teas and silver needle varieties harvested in the high-altitude Taplejung gardens.</p>
                    <div class="brand-actions">
                        <button class="btn-approve" onclick="approveBrand(this)">&#10003; APPROVE</button>
                        <button class="btn-reject" onclick="rejectBrand(this)">&#10005; REJECT</button>
                        <a href="${pageContext.request.contextPath}/admin/brands/edit/2" class="btn-edit">EDIT</a>
                    </div>
                </div>
            </div>

            <!-- Brand Card 3 -->
            <div class="brand-card">
                <div class="brand-img-wrapper">
                    <img src="${pageContext.request.contextPath}/images/sunitagreentea.jpg"
                         alt="Sunita Green Tea"
                         class="brand-img"
                         onerror="this.style.display='none'; this.nextElementSibling.style.display='block'">
                    <div class="brand-img-fallback brand-img-fallback-3" style="display:none;"></div>
                    <span class="brand-status pending">PENDING</span>
                </div>
                <div class="brand-body">
                    <h3 class="brand-name">Sunita Green Tea</h3>
                    <p class="brand-meta">Dhankuta &bull; Koshi Province &bull; by Hari Basnet</p>
                    <p class="brand-desc">Organic certified tea producer focusing on black teas with rich, malty character suited for morning brews.</p>
                    <div class="brand-actions">
                        <button class="btn-approve" onclick="approveBrand(this)">&#10003; APPROVE</button>
                        <button class="btn-reject" onclick="rejectBrand(this)">&#10005; REJECT</button>
                        <a href="${pageContext.request.contextPath}/admin/brands/edit/3" class="btn-edit">EDIT</a>
                    </div>
                </div>
            </div>

        </div>
    </main>
</div>

<script>
    function switchTab(el) {
        document.querySelectorAll('.tab').forEach(t => t.classList.remove('active'));
        el.classList.add('active');
    }

    function approveBrand(btn) {
        const card = btn.closest('.brand-card');
        const badge = card.querySelector('.brand-status');
        badge.textContent = 'APPROVED';
        badge.className = 'brand-status approved';
        btn.disabled = true;
        card.querySelector('.btn-reject').disabled = true;
    }

    function rejectBrand(btn) {
        const card = btn.closest('.brand-card');
        const badge = card.querySelector('.brand-status');
        badge.textContent = 'REJECTED';
        badge.className = 'brand-status rejected';
        btn.disabled = true;
        card.querySelector('.btn-approve').disabled = true;
    }
</script>

</body>
</html>
    
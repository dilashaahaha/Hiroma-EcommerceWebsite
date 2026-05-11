<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Brands — Hiroma Admin</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/brand.css">
</head>
<body>
<aside class="sidebar">
    <div class="sidebar-logo">
        <div class="name">H<span>i</span>roma</div>
        <div class="tag">Admin Panel</div>
    </div>
    <nav>
        <div class="sidebar-section-label">Overview</div>
        <a class="nav-item" href="${pageContext.request.contextPath}/dashboard"><span class="icon">&bull;</span> Dashboard</a>
        <div class="sidebar-section-label">Catalogue</div>
        <a class="nav-item" href="${pageContext.request.contextPath}/product"><span class="icon">&bull;</span> Products</a>
        <a class="nav-item active" href="${pageContext.request.contextPath}/brands"><span class="icon">&bull;</span> Brands <span class="badge-dot"></span></a>
        <a class="nav-item" href="${pageContext.request.contextPath}/categories"><span class="icon">&bull;</span> Categories</a>
        <div class="sidebar-section-label">Orders &amp; Users</div>
        <a class="nav-item" href="${pageContext.request.contextPath}/orders"><span class="icon">&bull;</span> Orders</a>
        <a class="nav-item" href="${pageContext.request.contextPath}/users"><span class="icon">&bull;</span> Users</a>
    </nav>
</aside>

<div class="main">

    <div class="topbar">
        <div class="topbar-left">
            <div class="topbar-title">Brands</div>
            <div class="topbar-crumb"><a href="${pageContext.request.contextPath}/dashboard">Dashboard</a> / Brands</div>
        </div>
        <div class="topbar-right">
            <a href="${pageContext.request.contextPath}/brandform" class="btn btn-primary">+ Register New Brand</a>
        </div>
    </div>

    <div class="content">

        <div class="tabs">
            <a href="${pageContext.request.contextPath}/brands?filter=pending"
               class="tab ${param.filter == 'pending' || param.filter == null ? 'active' : ''}">
               Pending Approval <span class="tab-count">3</span>
            </a>
            <a href="${pageContext.request.contextPath}/brands?filter=approved"
               class="tab ${param.filter == 'approved' ? 'active' : ''}">
               Approved <span class="tab-count">9</span>
            </a>
            <a href="${pageContext.request.contextPath}/brands?filter=all"
               class="tab ${param.filter == 'all' ? 'active' : ''}">
               All Brands <span class="tab-count">12</span>
            </a>
        </div>

        <!-- SUCCESS / ERROR MESSAGE -->
        <c:if test="${not empty param.message}">
            <div class="message">${param.message}</div>
        </c:if>

        <!-- BRAND CARDS GRID -->
        <div class="brand-grid">


            <div class="brand-card">
                <div class="card-image-wrap">
                    <img src="${pageContext.request.contextPath}/images/illam.webp" alt="Illam Organic Teas" class="card-image">
                    <span class="card-badge pending">Pending</span>
                </div>
                <div class="card-body">
                    <h3 class="card-title">Illam Organic Teas</h3>
                    <div class="card-meta">
                        <span>Illam</span>
                        <span class="dot">•</span>
                        <span>Koshi Province</span>
                        <span class="dot">•</span>
                        <span>by Ram Kumar</span>
                    </div>
                    <p class="card-desc">Family-owned tea estate producing premium first flush and second flush teas at 1,200m altitude since 1978.</p>
                    <div class="card-actions">
                        <a href="${pageContext.request.contextPath}/brands?action=approve&id=1" class="btn-approve">✓ Approve</a>
                        <a href="${pageContext.request.contextPath}/brands?action=reject&id=1" class="btn-reject">✕ Reject</a>
                        <a href="${pageContext.request.contextPath}/brandform?id=1" class="btn-edit">Edit</a>
                    </div>
                </div>
            </div>

            <div class="brand-card">
                <div class="card-image-wrap">
                    <img src="${pageContext.request.contextPath}/images/taplejung.jpg" alt="Himalayan Green Tea" class="card-image">
                    <span class="card-badge pending">Pending</span>
                </div>
                <div class="card-body">
                    <h3 class="card-title">Himalayan Green Tea</h3>
                    <div class="card-meta">
                        <span>Taplejung</span>
                        <span class="dot">•</span>
                        <span>Koshi Province</span>
                        <span class="dot">•</span>
                        <span>by Sita Moktan</span>
                    </div>
                    <p class="card-desc">Specialising in rare white teas and silver needle varieties harvested in the high-altitude Taplejung gardens.</p>
                    <div class="card-actions">
                        <a href="${pageContext.request.contextPath}/brands?action=approve&id=2" class="btn-approve">✓ Approve</a>
                        <a href="${pageContext.request.contextPath}/brands?action=reject&id=2" class="btn-reject">✕ Reject</a>
                        <a href="${pageContext.request.contextPath}/brandform?id=2" class="btn-edit">Edit</a>
                    </div>
                </div>
            </div>

            <div class="brand-card">
                <div class="card-image-wrap">
                    <img src="${pageContext.request.contextPath}/images/sunita.webp" alt="Sunita Green Tea" class="card-image">
                    <span class="card-badge pending">Pending</span>
                </div>
                <div class="card-body">
                    <h3 class="card-title">Sunita Green Tea</h3>
                    <div class="card-meta">
                        <span>Dhankuta</span>
                        <span class="dot">•</span>
                        <span>Koshi Province</span>
                        <span class="dot">•</span>
                        <span>by Hari Basnet</span>
                    </div>
                    <p class="card-desc">Organic certified tea producer focusing on black teas with rich, malty character suited for morning brews.</p>
                    <div class="card-actions">
                        <a href="${pageContext.request.contextPath}/brands?action=approve&id=3" class="btn-approve">✓ Approve</a>
                        <a href="${pageContext.request.contextPath}/brands?action=reject&id=3" class="btn-reject">✕ Reject</a>
                        <a href="${pageContext.request.contextPath}/brandform?id=3" class="btn-edit">Edit</a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

</body>
</html>

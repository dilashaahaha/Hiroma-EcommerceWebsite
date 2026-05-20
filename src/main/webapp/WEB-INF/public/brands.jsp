<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Brands Management - H/ROMA Admin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/brands.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>

<div class="admin-layout">

    <aside class="admin-sidebar">
        <div class="sidebar-logo">
            <div class="logo-text">H/ROMA</div>
            <div class="logo-sub">ADMIN PANEL</div>
        </div>
        <div class="sidebar-section">
            <p class="sidebar-section-label">OVERVIEW</p>
            <ul class="sidebar-nav">
                <li><a href="${pageContext.request.contextPath}/admin/dashboard" class="sidebar-link">
                    <i class="fas fa-gauge"></i> Dashboard
                </a></li>
            </ul>
        </div>
        <div class="sidebar-section">
            <p class="sidebar-section-label">CATALOGUES</p>
            <ul class="sidebar-nav">
                <li><a href="${pageContext.request.contextPath}/admin/products" class="sidebar-link">
                    <i class="fas fa-box"></i> Products
                </a></li>
                <li><a href="${pageContext.request.contextPath}/brands" class="sidebar-link active">
                    <i class="fas fa-tag"></i> Brands <span class="sidebar-badge">3</span>
                </a></li>
                <li><a href="${pageContext.request.contextPath}/admin/categories" class="sidebar-link">
                    <i class="fas fa-list"></i> Categories
                </a></li>
            </ul>
        </div>
        <div class="sidebar-section">
            <p class="sidebar-section-label">ORDERS &amp; USERS</p>
            <ul class="sidebar-nav">
                <li><a href="${pageContext.request.contextPath}/admin/orders" class="sidebar-link">
                    <i class="fas fa-receipt"></i> Orders
                </a></li>
                <li><a href="${pageContext.request.contextPath}/admin/users" class="sidebar-link">
                    <i class="fas fa-users"></i> Users
                </a></li>
            </ul>
        </div>
    </aside>

    <main class="admin-content">
        <div class="page-header">
            <div>
                <h1 class="page-title">Brands</h1>
                <p class="breadcrumb"><a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a> / Brands</p>
            </div>
            <button type="button" class="btn-register" id="btnRegisterBrand">
                <i class="fas fa-plus"></i> REGISTER NEW BRAND
            </button>
        </div>

        <div class="tab-bar">
            <button type="button" class="tab active" data-tab="PENDING" id="tabPending">PENDING APPROVAL</button>
            <button type="button" class="tab" data-tab="APPROVED" id="tabApproved">APPROVED</button>
            <button type="button" class="tab" data-tab="ALL" id="tabAll">ALL BRANDS</button>
        </div>

        <div class="brands-grid" id="brandsGrid">
            <!-- Brand Card 1 -->
            <div class="brand-card" data-id="brand-1" data-name="Illam Organic Teas" data-location="Illam" data-province="Koshi Province" data-owner="Ram Kumar" data-desc="Family-owned tea estate producing premium first flush and second flush teas at 1,200m altitude since 1978." data-status="PENDING" data-image="illamgreentea.jpg">
                <div class="brand-img-wrapper">
                    <img src="${pageContext.request.contextPath}/images/illamgreentea.jpg" alt="Illam Organic Teas" class="brand-img">
                    <div class="brand-img-fallback"></div>
                    <span class="brand-status pending">PENDING</span>
                </div>
                <div class="brand-body">
                    <h3 class="brand-name">Illam Organic Teas</h3>
                    <p class="brand-meta">Illam &bull; Koshi Province &bull; by Ram Kumar</p>
                    <p class="brand-desc">Family-owned tea estate producing premium first flush and second flush teas at 1,200m altitude since 1978.</p>
                    <div class="brand-actions">
                        <button type="button" class="btn-approve">
                            <i class="fas fa-check"></i> APPROVE
                        </button>
                        <button type="button" class="btn-reject">
                            <i class="fas fa-times"></i> REJECT
                        </button>
                        <button type="button" class="btn-edit">
                            <i class="fas fa-pen"></i> EDIT
                        </button>
                    </div>
                </div>
            </div>

            <!-- Brand Card 2 -->
            <div class="brand-card" data-id="brand-2" data-name="Himalayan Green Tea" data-location="Taplejung" data-province="Koshi Province" data-owner="Sita Moktan" data-desc="Specialising in rare white teas and silver needle varieties harvested in the high-altitude Taplejung gardens." data-status="PENDING" data-image="himalayangreentea.jpg">
                <div class="brand-img-wrapper">
                    <img src="${pageContext.request.contextPath}/images/himalayangreentea.jpg" alt="Himalayan Green Tea" class="brand-img">
                    <div class="brand-img-fallback brand-img-fallback-2"></div>
                    <span class="brand-status pending">PENDING</span>
                </div>
                <div class="brand-body">
                    <h3 class="brand-name">Himalayan Green Tea</h3>
                    <p class="brand-meta">Taplejung &bull; Koshi Province &bull; by Sita Moktan</p>
                    <p class="brand-desc">Specialising in rare white teas and silver needle varieties harvested in the high-altitude Taplejung gardens.</p>
                    <div class="brand-actions">
                        <button type="button" class="btn-approve">
                            <i class="fas fa-check"></i> APPROVE
                        </button>
                        <button type="button" class="btn-reject">
                            <i class="fas fa-times"></i> REJECT
                        </button>
                        <button type="button" class="btn-edit">
                            <i class="fas fa-pen"></i> EDIT
                        </button>
                    </div>
                </div>
            </div>

            <!-- Brand Card 3 -->
            <div class="brand-card" data-id="brand-3" data-name="Sunita Green Tea" data-location="Dhankuta" data-province="Koshi Province" data-owner="Hari Basnet" data-desc="Organic certified tea producer focusing on black teas with rich, malty character suited for morning brews." data-status="PENDING" data-image="sunitagreentea.jpg">
                <div class="brand-img-wrapper">
                    <img src="${pageContext.request.contextPath}/images/sunitagreentea.jpg" alt="Sunita Green Tea" class="brand-img">
                    <div class="brand-img-fallback brand-img-fallback-3"></div>
                    <span class="brand-status pending">PENDING</span>
                </div>
                <div class="brand-body">
                    <h3 class="brand-name">Sunita Green Tea</h3>
                    <p class="brand-meta">Dhankuta &bull; Koshi Province &bull; by Hari Basnet</p>
                    <p class="brand-desc">Organic certified tea producer focusing on black teas with rich, malty character suited for morning brews.</p>
                    <div class="brand-actions">
                        <button type="button" class="btn-approve">
                            <i class="fas fa-check"></i> APPROVE
                        </button>
                        <button type="button" class="btn-reject">
                            <i class="fas fa-times"></i> REJECT
                        </button>
                        <button type="button" class="btn-edit">
                            <i class="fas fa-pen"></i> EDIT
                        </button>
                    </div>
                </div>
            </div>

            <!-- Empty Grid State -->
            <div id="brandsEmptyState" class="no-brands hide">
                No brands available under this filter status.
            </div>
        </div>

        <!-- Products Section -->
        <section class="products-section" id="productsSection">
            <h2 class="products-section-title">
                <i class="fas fa-leaf"></i> Related Products
            </h2>
            <div class="products-table-container">
                <table class="products-table">
                    <thead>
                        <tr>
                            <th>Product Name</th>
                            <th>Category</th>
                            <th>Price</th>
                            <th>Brand</th>
                        </tr>
                    </thead>
                    <tbody id="productsTableBody">
                        <!-- Dynamic content filled by JS -->
                    </tbody>
                </table>
            </div>
            <div id="productsEmptyState" class="no-brands hide">
                No products available for the selected status.
            </div>
        </section>
    </main>
</div>

<!-- Register Brand Modal -->
<div id="registerModal" class="modal-overlay">
    <div class="modal">
        <div class="modal-header">
            <h2 class="modal-title">Register New Brand</h2>
            <button type="button" class="modal-close" id="btnCloseRegister">&times;</button>
        </div>
        <form id="registerForm" novalidate>
            <div class="form-group">
                <label for="regName">Brand Name *</label>
                <input type="text" id="regName" name="name" placeholder="e.g. Illam Organic Teas">
                <div class="error-message hide" id="regNameError">Brand Name is required</div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="regLocation">Location / District *</label>
                    <input type="text" id="regLocation" name="location" placeholder="e.g. Illam">
                    <div class="error-message hide" id="regLocationError">Location is required</div>
                </div>
                <div class="form-group">
                    <label for="regProvince">Province</label>
                    <select id="regProvince" name="province">
                        <option value="Koshi Province">Koshi Province</option>
                        <option value="Madhesh Province">Madhesh Province</option>
                        <option value="Bagmati Province">Bagmati Province</option>
                        <option value="Gandaki Province">Gandaki Province</option>
                        <option value="Lumbini Province">Lumbini Province</option>
                        <option value="Karnali Province">Karnali Province</option>
                        <option value="Sudurpashchim Province">Sudurpashchim Province</option>
                    </select>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="regOwner">Owner Name *</label>
                    <input type="text" id="regOwner" name="owner" placeholder="e.g. Ram Kumar">
                    <div class="error-message hide" id="regOwnerError">Owner is required</div>
                </div>
                <div class="form-group">
                    <label for="regImage">Image Filename</label>
                    <input type="text" id="regImage" name="image" placeholder="e.g. illamgreentea.jpg">
                </div>
            </div>
            <div class="form-group">
                <label for="regDesc">Description</label>
                <textarea id="regDesc" name="description" placeholder="Describe the brand and its heritage..."></textarea>
            </div>
            <div class="modal-actions">
                <button type="submit" class="btn-save">REGISTER BRAND</button>
                <button type="button" class="btn-cancel-modal" id="btnCancelRegister">CANCEL</button>
            </div>
        </form>
    </div>
</div>

<!-- Edit Brand Modal -->
<div id="editModal" class="modal-overlay">
    <div class="modal">
        <div class="modal-header">
            <h2 class="modal-title">Edit Brand Information</h2>
            <button type="button" class="modal-close" id="btnCloseEdit">&times;</button>
        </div>
        <form id="editForm" novalidate>
            <input type="hidden" id="editCardId" name="cardId">
            <div class="form-group">
                <label for="editName">Brand Name *</label>
                <input type="text" id="editName" name="name">
                <div class="error-message hide" id="editNameError">Brand Name is required</div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="editLocation">Location / District *</label>
                    <input type="text" id="editLocation" name="location">
                    <div class="error-message hide" id="editLocationError">Location is required</div>
                </div>
                <div class="form-group">
                    <label for="editProvince">Province</label>
                    <select id="editProvince" name="province">
                        <option value="Koshi Province">Koshi Province</option>
                        <option value="Madhesh Province">Madhesh Province</option>
                        <option value="Bagmati Province">Bagmati Province</option>
                        <option value="Gandaki Province">Gandaki Province</option>
                        <option value="Lumbini Province">Lumbini Province</option>
                        <option value="Karnali Province">Karnali Province</option>
                        <option value="Sudurpashchim Province">Sudurpashchim Province</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="editOwner">Owner Name *</label>
                <input type="text" id="editOwner" name="owner">
                <div class="error-message hide" id="editOwnerError">Owner is required</div>
            </div>
            <div class="form-group">
                <label for="editDesc">Description</label>
                <textarea id="editDesc" name="description"></textarea>
            </div>
            <div class="modal-actions">
                <button type="submit" class="btn-save">SAVE CHANGES</button>
                <button type="button" class="btn-cancel-modal" id="btnCancelEdit">CANCEL</button>
            </div>
        </form>
    </div>
</div>

<script src="${pageContext.request.contextPath}/js/brands.js" defer></script>
</body>
</html>
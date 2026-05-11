<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Management — Hiroma Admin</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/products.css">
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
        <a class="nav-item active" href="${pageContext.request.contextPath}/product"><span class="icon">&bull;</span> Products</a>
        <a class="nav-item" href="${pageContext.request.contextPath}/brands"><span class="icon">&bull;</span> Brands <span class="badge-dot"></span></a>
        <a class="nav-item" href="${pageContext.request.contextPath}/categories"><span class="icon">&bull;</span> Categories</a>
        <div class="sidebar-section-label">Orders &amp; Users</div>
        <a class="nav-item" href="${pageContext.request.contextPath}/orders"><span class="icon">&bull;</span> Orders</a>
        <a class="nav-item" href="${pageContext.request.contextPath}/users"><span class="icon">&bull;</span> Users</a>
    </nav>
</aside>

<div class="main">
    <div class="topbar">
        <div class="topbar-left">
            <div class="topbar-title">Products</div>
            <div class="topbar-crumb"><a href="${pageContext.request.contextPath}/dashboard">Dashboard</a> / Products</div>
        </div>
        <div class="topbar-right">
            <button class="btn btn-ghost">Export CSV</button>
            <a href="${pageContext.request.contextPath}/productform" class="btn btn-primary">+ Add Product</a>
        </div>
    </div>

    <div class="content">
    
    <c:if test="${not empty param.message}">
        <div class="success-message">${param.message}</div>
    </c:if>

        <!-- FILTERS -->
        <div class="filters-bar">
            <div class="search-wrap">
                <input type="text" name="search" placeholder="Search products, SKUs…">
            </div>
            <select class="filter-select" name="category">
                <option>All categories</option>
                <option>Green Tea</option>
                <option>Black Tea</option>
                <option>White Tea</option>
                <option>Herbal Blends</option>
            </select>
            <select class="filter-select" name="brand">
                <option>All brands</option>
                <option>Illam Tea Estate</option>
                <option>Taplejung Organics</option>
                <option>Himalayan Brew Co.</option>
            </select>
            <div class="filter-tabs">
                <div class="filter-tab active">All (46)</div>
                <div class="filter-tab">Active (40)</div>
                <div class="filter-tab">Inactive (4)</div>
                <div class="filter-tab">Low Stock (2)</div>
            </div>
        </div>

        <!-- TABLE -->
        <div class="table-wrap">
            <div class="table-header">
                <span class="table-info">Showing 1–10 of 46 products</span>
                <div style="display:flex;gap:8px;">
                    <button class="btn btn-ghost btn-sm">Sort: Newest</button>
                </div>
            </div>
            <table class="data-table">
                <thead>
                    <tr>
                        <th class="checkbox-col"><input type="checkbox"></th>
                        <th>Product</th>
                        <th>Category</th>
                        <th>Brand</th>
                        <th>Price</th>
                        <th>Stock</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                   
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>
                            <div class="product-cell">
                                <div class="product-thumb" >
                                 <img src="${pageContext.request.contextPath}/images/nepal-tea.webp" width="42" height="42" 
                                 style="border-radius:4px; object-fit:cover;">
                                </div>
                                <div>
                                    <div class="product-name">Nepal Tea Exchange</div>
                                    <div class="product-sku">SKU: TEA-001</div>
                                </div>
                            </div>
                        </td>
                        <td>Black Tea</td>
                        <td>Illam Tea Estate</td>
                        <td><div class="price-cell">Rs 850 <span class="price-unit">/ 100g</span></div></td>
                        <td>
                            <div class="stock-cell">
                                <div class="stock-bar"><div class="stock-bar-fill" style="width:72%;background:#4A7C5F;"></div></div>
                                <span>72</span>
                            </div>
                        </td>
                        <td><span class="badge badge-active">Active</span></td>
                        <td>
                            <div class="actions-cell">
                                <a href="${pageContext.request.contextPath}/admin/products?action=edit&id=1" class="action-btn" title="Edit">Edit</a>
                                <a href="${pageContext.request.contextPath}/deleteProduct?id=1" class="action-btn delete" title="Delete" onclick="return confirm('Are you sure?')">✕</a>
                            </div>
                        </td>
                    </tr>
                   
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>
                            <div class="product-cell">
                                <div class="product-thumb" >
                                 <img src="${pageContext.request.contextPath}/images/karma.jpg"
                                  width="42" height="42" 
                                  style="border-radius:4px; object-fit:cover;">
                                </div>
                                <div>
                                    <div class="product-name">Karma Tea</div>
                                    <div class="product-sku">SKU: TEA-002</div>
                                </div>
                            </div>
                        </td>
                        <td>White Tea</td>
                        <td>Taplejung Organics</td>
                        <td><div class="price-cell">Rs 1,200 <span class="price-unit">/ 50g</span></div></td>
                        <td>
                            <div class="stock-cell">
                                <div class="stock-bar"><div class="stock-bar-fill" style="width:28%;background:#C8893A;"></div></div>
                                <span>28</span>
                            </div>
                        </td>
                        <td><span class="badge badge-active">Active</span></td>
                        <td>
                            <div class="actions-cell">
                                <a href="${pageContext.request.contextPath}/admin/products?action=edit&id=1" class="action-btn" title="Edit">Edit</a>
                                <a href="${pageContext.request.contextPath}/deleteProduct?id=2" class="action-btn delete" title="Delete" onclick="return confirm('Are you sure?')">✕</a>
                            </div>
                        </td>
                    </tr>
                   
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>
                            <div class="product-cell">
                                <div class="product-thumb" >
                                 <img src="${pageContext.request.contextPath}/images/super-tea.jpg" 
                                 width="42" height="42" 
                                 style="border-radius:4px; object-fit:cover;">
                                </div>
                                <div>
                                    <div class="product-name">Rakura Super Herbs</div>
                                    <div class="product-sku">SKU: TEA-003</div>
                                </div>
                            </div>
                        </td>
                        <td>Herbal Blends</td>
                        <td>Himalayan Brew Co.</td>
                        <td><div class="price-cell">Rs 650 <span class="price-unit">/ 100g</span></div></td>
                        <td>
                            <div class="stock-cell">
                                <div class="stock-bar"><div class="stock-bar-fill" style="width:90%;background:#4A7C5F;"></div></div>
                                <span>90</span>
                            </div>
                        </td>
                        <td><span class="badge badge-active">Active</span></td>
                        <td>
                            <div class="actions-cell">
                                <a href="${pageContext.request.contextPath}/admin/products?action=edit&id=1" class="action-btn" title="Edit">Edit</a>
                                <a href="${pageContext.request.contextPath}/deleteProduct?id=3" class="action-btn delete" title="Delete" onclick="return confirm('Are you sure?')">✕</a>
                            </div>
                        </td>
                    </tr>
                  
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>
                            <div class="product-cell">
                                <div class="product-thumb" >
                                 <img src="${pageContext.request.contextPath}/images/rakura-org" 
                                 width="42" height="42" 
                                 style="border-radius:4px; object-fit:cover;">
                                </div>
                                <div>
                                    <div class="product-name">Rakura Organic</div>
                                    <div class="product-sku">SKU: TEA-004</div>
                                </div>
                            </div>
                        </td>
                        <td>Black Tea</td>
                        <td>Koshi Garden Teas</td>
                        <td><div class="price-cell">Rs 720 <span class="price-unit">/ 100g</span></div></td>
                        <td>
                            <div class="stock-cell">
                                <div class="stock-bar"><div class="stock-bar-fill" style="width:8%;background:#C0392B;"></div></div>
                                <span style="color:#C0392B;">8</span>
                            </div>
                        </td>
                        <td><span class="badge badge-low">Low Stock</span></td>
                        <td>
                            <div class="actions-cell">
                                <a href="${pageContext.request.contextPath}/admin/products?action=edit&id=1" class="action-btn" title="Edit">Edit</a>
                                <a href="${pageContext.request.contextPath}/deleteProduct?id=4" class="action-btn delete" title="Delete" onclick="return confirm('Are you sure?')">✕</a>
                            </div>
                        </td>
                    </tr>
                   
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>
                            <div class="product-cell">
                                <div class="product-thumb">
                                 <img src="${pageContext.request.contextPath}/images/jasmine-tea.jpg" 
                                 width="42" height="42" 
                                 style="border-radius:4px; object-fit:cover;">
                                </div>
                                <div>
                                    <div class="product-name">Rakura Jasmine Tea</div>
                                    <div class="product-sku">SKU: TEA-005</div>
                                </div>
                            </div>
                        </td>
                        <td>Herbal Blends</td>
                        <td>Pure Nepal Herbs</td>
                        <td><div class="price-cell">Rs 480 <span class="price-unit">/ 100g</span></div></td>
                        <td>
                            <div class="stock-cell">
                                <div class="stock-bar"><div class="stock-bar-fill" style="width:55%;background:#4A7C5F;"></div></div>
                                <span>55</span>
                            </div>
                        </td>
                        <td><span class="badge badge-inactive">Inactive</span></td>
                        <td>
                            <div class="actions-cell">
                                <a href="${pageContext.request.contextPath}/admin/products?action=edit&id=1" class="action-btn" title="Edit">Edit</a>
                                <a href="${pageContext.request.contextPath}/deleteProduct?id=5" class="action-btn delete" title="Delete" onclick="return confirm('Are you sure?')">✕</a>
                            </div>
                        </td>
                    </tr>

                    
                </tbody>
            </table>
            <div class="pagination">
                <span class="page-info">Page 1 of 5</span>
                <div class="page-btns">
                    <button class="page-btn">‹</button>
                    <button class="page-btn active">1</button>
                    <button class="page-btn">2</button>
                    <button class="page-btn">3</button>
                    <button class="page-btn">…</button>
                    <button class="page-btn">5</button>
                    <button class="page-btn">›</button>
                </div>
            </div>
        </div>

    </div>
</div>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>${not empty product ? 'Edit Product' : 'Add Product'} — Hiroma Admin</title>
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,500;1,300;1,400&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/product-form.css">
</head>
<body>

<aside class="sidebar">
  <div class="sidebar-logo">
    <div class="name">H<span>i</span>roma</div>
    <div class="tag">Admin Panel</div>
  </div>
  <nav style="flex:1;">
    <div class="sidebar-section-label">Overview</div>
    <a class="nav-item" href="${pageContext.request.contextPath}/admin/dashboard"><span class="icon">&bull;</span> Dashboard</a>
    <div class="sidebar-section-label">Catalogue</div>
    <a class="nav-item active" href="${pageContext.request.contextPath}/admin/products"><span class="icon">&bull;</span> Products</a>
    <a class="nav-item" href="${pageContext.request.contextPath}/admin/brands"><span class="icon">&bull;</span> Brands</a>
    <a class="nav-item" href="${pageContext.request.contextPath}/admin/categories"><span class="icon">&bull;</span> Categories</a>
    <div class="sidebar-section-label">Orders &amp; Users</div>
    <a class="nav-item" href="${pageContext.request.contextPath}/admin/orders"><span class="icon">&bull;</span> Orders</a>
    <a class="nav-item" href="${pageContext.request.contextPath}/admin/users"><span class="icon">&bull;</span> Users</a>
  </nav>
</aside>

<div class="main">
  <div class="topbar">
    <div class="topbar-left">
      <div class="title">${not empty product ? 'Edit Product' : 'Add New Product'}</div>
      <div class="crumb">
        <a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a> /
        <a href="${pageContext.request.contextPath}/admin/products">Products</a> /
        ${not empty product ? 'Edit' : 'Add New'}
      </div>
    </div>
    <div class="topbar-right">
      <button class="btn btn-ghost" type="button">Save as Draft</button>
      <button class="btn btn-dark" form="productForm" type="submit">Publish Product</button>
    </div>
  </div>

  <div class="content">
    <form id="productForm"
          action="${pageContext.request.contextPath}/admin/products${not empty product ? '/update' : '/save'}"
          method="post"
          enctype="multipart/form-data">

      <c:if test="${not empty product}">
        <input type="hidden" name="id" value="${product.id}">
      </c:if>

      <div class="form-layout">

        <div style="display:flex;flex-direction:column;gap:20px;">

          <!-- BASIC INFO -->
          <div class="panel">
            <div class="panel-title">Product information</div>
            <div class="form-group">
              <label class="form-label">Product name <span class="req">*</span></label>
              <input class="form-input" type="text" name="productName"
                     value="${not empty product ? product.productName : ''}"
                     placeholder="e.g. Illam First Flush Darjeeling" required>
            </div>
            <div class="form-group">
              <label class="form-label">Description</label>
              <textarea class="form-textarea" name="description"
              			value="${not empty product ? product.description : ''}"
                        placeholder="Describe the tea's flavour, origin, harvest season, brewing notes…" required>
                         </textarea>
                     
            </div>
            <div class="form-row">
              <div class="form-group">
                <label class="form-label">Category <span class="req">*</span></label>
                <select class="form-select" name="categoryId" required>
                  <option value="">Select category</option>
                  <c:choose>
                    <c:when test="${not empty categories}">
                      <c:forEach var="cat" items="${categories}">
                        <option value="${cat.id}" ${not empty product && product.categoryId == cat.id ? 'selected' : ''}>${cat.name}</option>
                      </c:forEach>
                    </c:when>
                    <c:otherwise>
                      <option value="1">Green Tea</option>
                      <option value="2">Black Tea</option>
                      <option value="3">White Tea</option>
                      <option value="4">Herbal Blends</option>
                    </c:otherwise>
                  </c:choose>
                </select>
              </div>
              <div class="form-group">
                <label class="form-label">Brand <span class="req">*</span></label>
                <select class="form-select" name="brandId" required>
                  <option value="">Select brand</option>
                  <c:choose>
                    <c:when test="${not empty brands}">
                      <c:forEach var="brand" items="${brands}">
                        <option value="${brand.id}" ${not empty product && product.brandId == brand.id ? 'selected' : ''}>${brand.name}</option>
                      </c:forEach>
                    </c:when>
                    <c:otherwise>
                      <option value="1">Illam Tea Estate</option>
                      <option value="2">Taplejung Organics</option>
                      <option value="3">Himalayan Brew Co.</option>
                      <option value="4">Koshi Garden Teas</option>
                    </c:otherwise>
                  </c:choose>
                </select>
              </div>
            </div>
          </div>

          <!-- PRICING & STOCK -->
          <div class="panel">
            <div class="panel-title">Pricing &amp; inventory</div>
            <div class="form-row">
              <div class="form-group">
                <label class="form-label">Price (Rs) <span class="req">*</span></label>
                <input class="form-input" type="number" name="price"
                       value="${not empty product ? product.price : ''}"
                       placeholder="850" min="0" step="0.01" required
                       oninput="document.getElementById('pricePreview').textContent='Rs '+this.value">
              </div>
              <div class="form-group">
                <label class="form-label">Weight / Unit</label>
                <input class="form-input" type="text" name="weightGrams"
                       value="${not empty product ? product.weightGrams : ''}"
                       placeholder="e.g. 100g, 250g, 1kg">
              </div>
            </div>
            <div class="form-row">
              <div class="form-group">
                <label class="form-label">Stock quantity <span class="req">*</span></label>
                <input class="form-input" type="number" name="stockQuantity"
                       value="${not empty product ? product.stockQuantity : ''}"
                       placeholder="50" min="0" required>
              </div>
              <div class="form-group">
                <label class="form-label">Low stock alert at</label>
                <input class="form-input" type="number" name="lowStockAlert"
                       value="${not empty product ? product.lowStockAlert : ''}"
                       placeholder="10" min="0">
              </div>
            </div>
            <div class="price-preview">
              <div class="price-preview-label">Price preview</div>
              <div class="price-preview-value" id="pricePreview">
                <c:choose>
                  <c:when test="${not empty product}"> <c:out value="${product.price}"/></c:when>
                  <c:otherwise>Rs —</c:otherwise>
                </c:choose>
              </div>
            </div>
          </div>

        </div>

        <!-- RIGHT COLUMN -->
        <div style="display:flex;flex-direction:column;gap:20px;">

          <!-- IMAGE UPLOAD -->
          <div class="panel">
            <div class="panel-title">Product image</div>
            <div class="upload-area" onclick="document.getElementById('imgInput').click()">
              <div class="upload-icon"></div>
              <div class="upload-text">Click to upload image</div>
              <div class="upload-hint">PNG, JPG up to 5MB · Recommended 800×800px</div>
            </div>
            <input type="file" id="imgInput" name="image" accept="image/*" style="display:none;">
            <div class="form-group" style="margin-top:14px;">
              <label class="form-label">Or paste image URL</label>
              <input class="form-input" type="url" name="imageUrl"
                     value="${not empty product ? product.imageUrl : ''}"
                     placeholder="https://example.com/image.jpg">
            </div> 
          </div>

          <!-- VISIBILITY -->
          <div class="panel">
            <div class="panel-title">Visibility &amp; status</div>
            <div class="toggle-row">
              <div class="toggle-info">
                <div class="toggle-title">Available for sale</div>
                <div class="toggle-desc">Show this product to customers</div>
              </div>
              <div class="toggle on" onclick="this.classList.toggle('on')"></div>
            </div>
            <div class="toggle-row">
              <div class="toggle-info">
                <div class="toggle-title">Featured product</div>
                <div class="toggle-desc">Show on homepage featured section</div>
              </div>
              <div class="toggle" onclick="this.classList.toggle('on')"></div>
            </div>
            <div class="toggle-row">
              <div class="toggle-info">
                <div class="toggle-title">New arrival badge</div>
                <div class="toggle-desc">Display "New" tag on product card</div>
              </div>
              <div class="toggle" onclick="this.classList.toggle('on')"></div>
            </div>
          </div>

          <!-- ACTIONS -->
          <div style="display:flex;flex-direction:column;gap:10px;">
            <button class="btn btn-dark" type="submit" style="width:100%;justify-content:center;padding:14px;">
              ${not empty product ? 'Save Changes' : 'Publish Product'}
            </button>
            <button class="btn btn-ghost" type="button" style="width:100%;justify-content:center;padding:14px;">Save as Draft</button>
            <a href="${pageContext.request.contextPath}/admin/products"
               style="text-align:center;font-size:12px;color:var(--text-light);text-decoration:none;padding:8px;">
              Cancel &amp; go back
            </a>
          </div>

        </div>
      </div>
    </form>
  </div>
</div>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty products}">
  <jsp:forward page="/products" />
</c:if>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Shop All Teas &#8212; Hiroma</title>
  <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,500;0,600;1,300;1,400;1,500&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Product.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<%-- NAVBAR --%>
<nav class="site-nav">
  <a href="${pageContext.request.contextPath}/user/home.jsp" class="nav-logo">H<span>i</span>roma</a>
  <div class="nav-links">
    <a href="${pageContext.request.contextPath}/user/home.jsp">Shop</a>
    <a href="${pageContext.request.contextPath}/products?category=all">Collections</a>
    <a href="${pageContext.request.contextPath}/user/home#about">Our Story</a>
    <a href="${pageContext.request.contextPath}/user/home#brands">Brands</a>
  </div>
  <div class="nav-right">
    <a href="${pageContext.request.contextPath}/wishlist" class="nav-icon">
      <i class="fas fa-heart"></i>
    </a>
    <div class="nav-cart">
      <a href="${pageContext.request.contextPath}/Cart" class="nav-icon">
        <i class="fas fa-shopping-bag"></i>
      </a>
      <span class="cart-bubble">
        <c:out value="${empty sessionScope.cartCount ? 0 : sessionScope.cartCount}"/>
      </span>
    </div>
    <c:choose>
      <c:when test="${not empty sessionScope.user}">
        <a href="${pageContext.request.contextPath}/user/profile" class="btn-nav">Account</a>
      </c:when>
      <c:otherwise>
        <a href="${pageContext.request.contextPath}/authentication/login" class="btn-nav">Account</a>
      </c:otherwise>
    </c:choose>
  </div>
</nav>

<%-- HERO --%>
<section class="page-hero">
  <div class="hero-bg"></div>
  <div class="hero-inner">
    <div class="hero-text">
      <div class="eyebrow">Our Collection</div>
      <h1 class="hero-heading">Nepal's finest<br>teas, <em>curated</em><br>for you</h1>
      <p class="hero-sub">46 varieties from 8 districts across Nepal's eastern hills — all organic,
        all authentic, all sourced directly from verified gardens.</p>
    </div>
    <div class="hero-stats">
      <div class="hero-stat-item">
        <div class="hero-stat-num">46</div>
        <div class="hero-stat-label">Tea Varieties</div>
      </div>
      <div class="hero-stat-item">
        <div class="hero-stat-num">12</div>
        <div class="hero-stat-label">Verified Brands</div>
      </div>
      <div class="hero-stat-item">
        <div class="hero-stat-num">8</div>
        <div class="hero-stat-label">Unique Districts</div>
      </div>
    </div>
  </div>
</section>

<%-- MARQUEE --%>
<div class="marquee-strip">
  <div class="marquee-inner">
    <span class="marquee-item">Ilam First Flush<span class="marquee-dot"></span></span>
    <span class="marquee-item">Organic Certified<span class="marquee-dot"></span></span>
    <span class="marquee-item">Taplejung White Tea<span class="marquee-dot"></span></span>
    <span class="marquee-item">Direct from Garden<span class="marquee-dot"></span></span>
    <span class="marquee-item">Himalayan Herbal Blends<span class="marquee-dot"></span></span>
    <span class="marquee-item">100% Nepal Origin<span class="marquee-dot"></span></span>
  </div>
</div>

<%-- SHOP LAYOUT --%>
<div class="shop-layout" id="shop-layout">

  <%-- SIDEBAR --%>
  <aside class="sidebar">

    <%-- Success / Error messages --%>
    <c:if test="${not empty sessionScope.successMessage}">
      <div class="alert alert-success">
        <c:out value="${sessionScope.successMessage}"/>
      </div>
      <c:remove var="successMessage" scope="session"/>
    </c:if>
    <c:if test="${not empty sessionScope.errorMessage}">
      <div class="alert alert-error">
        <c:out value="${sessionScope.errorMessage}"/>
      </div>
      <c:remove var="errorMessage" scope="session"/>
    </c:if>

    <%-- CATEGORY FILTER --%>
    <div class="filter-section">
      <div class="filter-title">
        Category
        <a href="${pageContext.request.contextPath}/products">Clear</a>
      </div>
      <div class="filter-options">

        <label class="filter-option ${activeCategory == 'all' ? 'active' : ''}">
          <input type="radio" name="cat" value="all"
                 ${activeCategory == 'all' ? 'checked' : ''}
                 onchange="applyCategory(this.value)">
          All teas
        </label>

        <label class="filter-option ${activeCategory == 'green' ? 'active' : ''}">
          <input type="radio" name="cat" value="green"
                 ${activeCategory == 'green' ? 'checked' : ''}
                 onchange="applyCategory(this.value)">
          Green Tea
        </label>

        <label class="filter-option ${activeCategory == 'black' ? 'active' : ''}">
          <input type="radio" name="cat" value="black"
                 ${activeCategory == 'black' ? 'checked' : ''}
                 onchange="applyCategory(this.value)">
          Black Tea
        </label>

        <label class="filter-option ${activeCategory == 'white' ? 'active' : ''}">
          <input type="radio" name="cat" value="white"
                 ${activeCategory == 'white' ? 'checked' : ''}
                 onchange="applyCategory(this.value)">
          White Tea
        </label>

        <label class="filter-option ${activeCategory == 'herbal' ? 'active' : ''}">
          <input type="radio" name="cat" value="herbal"
                 ${activeCategory == 'herbal' ? 'checked' : ''}
                 onchange="applyCategory(this.value)">
          Herbal Blends
        </label>

      </div>
    </div>

    <%-- ORIGIN DISTRICT FILTER --%>
    <div class="filter-section">
      <div class="filter-title">Origin District</div>
      <div class="district-tags">
        <a href="${pageContext.request.contextPath}/products?origin=ilam#shop-layout"
           class="district-tag ${selectedOrigin == 'ilam' ? 'active' : ''}">Ilam</a>
        <a href="${pageContext.request.contextPath}/products?origin=taplejung#shop-layout"
           class="district-tag ${selectedOrigin == 'taplejung' ? 'active' : ''}">Taplejung</a>
        <a href="${pageContext.request.contextPath}/products?origin=dhankuta#shop-layout"
           class="district-tag ${selectedOrigin == 'dhankuta' ? 'active' : ''}">Dhankuta</a>
        <a href="${pageContext.request.contextPath}/products?origin=panchthar#shop-layout"
           class="district-tag ${selectedOrigin == 'panchthar' ? 'active' : ''}">Panchthar</a>
        <a href="${pageContext.request.contextPath}/products?origin=kaski#shop-layout"
           class="district-tag ${selectedOrigin == 'kaski' ? 'active' : ''}">Kaski</a>
        <a href="${pageContext.request.contextPath}/products?origin=sindhupalchok#shop-layout"
           class="district-tag ${selectedOrigin == 'sindhupalchok' ? 'active' : ''}">Sindhupalchok</a>
      </div>
    </div>

    <%-- BRAND FILTER --%>
    <div class="filter-section">
      <div class="filter-title">Brand</div>
      <div class="filter-options">
        <label class="filter-option">
          <a href="${pageContext.request.contextPath}/products?brand=ilam_estate#shop-layout"
             class="brand-link ${selectedBrand == 'ilam_estate' ? 'active' : ''}">
            Ilam Tea Estate
          </a>
        </label>
        <label class="filter-option">
          <a href="${pageContext.request.contextPath}/products?brand=taplejung_organics#shop-layout"
             class="brand-link ${selectedBrand == 'taplejung_organics' ? 'active' : ''}">
            Taplejung Organics
          </a>
        </label>
        <label class="filter-option">
          <a href="${pageContext.request.contextPath}/products?brand=himalayan_brew#shop-layout"
             class="brand-link ${selectedBrand == 'himalayan_brew' ? 'active' : ''}">
            Himalayan Brew Co.
          </a>
        </label>
        <label class="filter-option">
          <a href="${pageContext.request.contextPath}/products?brand=pure_nepal#shop-layout"
             class="brand-link ${selectedBrand == 'pure_nepal' ? 'active' : ''}">
            Pure Nepal Herbs
          </a>
        </label>
        <label class="filter-option">
          <a href="${pageContext.request.contextPath}/products?brand=koshi_garden#shop-layout"
             class="brand-link ${selectedBrand == 'koshi_garden' ? 'active' : ''}">
            Koshi Garden Teas
          </a>
        </label>
      </div>
    </div>

    <a href="${pageContext.request.contextPath}/products" class="clear-filters">
      Clear All Filters
    </a>

  </aside>

  <%-- PRODUCT AREA --%>
  <div class="product-area">

    <%-- TOOLBAR --%>
    <div class="toolbar">
      <div class="toolbar-left">
        <span class="results-count">
          <c:choose>
            <c:when test="${not empty products}">
              Showing <c:out value="${products.size()}"/> products
            </c:when>
            <c:otherwise>
              No products found
            </c:otherwise>
          </c:choose>
        </span>
      </div>
      <div class="toolbar-right">
        <select class="sort-select" id="sortSelect" onchange="applySort()">
          <option value="featured"   ${activeSort == 'featured'   ? 'selected' : ''}>Sort: Featured</option>
          <option value="price_asc"  ${activeSort == 'price_asc'  ? 'selected' : ''}>Price: Low to High</option>
          <option value="price_desc" ${activeSort == 'price_desc' ? 'selected' : ''}>Price: High to Low</option>
          <option value="newest"     ${activeSort == 'newest'     ? 'selected' : ''}>Newest First</option>
        </select>
        <div class="view-toggle">
          <button class="view-btn active" id="gridBtn" onclick="setView('grid')" title="Grid">&#8859;</button>
          <button class="view-btn" id="listBtn" onclick="setView('list')" title="List">&#8801;</button>
        </div>
      </div>
    </div>

    <%-- PRODUCT GRID — loaded from DB via ProductController --%>
    <div class="products-grid" id="productsGrid">

      <c:choose>
        <c:when test="${not empty products}">
          <c:forEach var="p" items="${products}">
            <div class="product-card">
              <div class="card-img">
                <c:choose>
                  <c:when test="${not empty p.imageFile}">
                    <img src="${pageContext.request.contextPath}/images/${p.imageFile}"
                         alt="${p.name}">
                  </c:when>
                  <c:otherwise>
                    <div class="card-img-emoji">&#9749;</div>
                  </c:otherwise>
                </c:choose>

                <div class="card-actions">
                  <form action="${pageContext.request.contextPath}/CartController" method="post" style="flex:1;">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="productId" value="${p.productId}">
                    <input type="hidden" name="quantity" value="1">
                    <button type="submit" class="btn-add">Add to cart</button>
                  </form>
                  <a href="${pageContext.request.contextPath}/productdetail?id=${p.productId}"
                     class="btn-quick">
                    <i class="fas fa-eye"></i>
                  </a>
                </div>
              </div>

              <div class="card-body">
                <div class="card-origin">
                  <c:out value="${p.origin}"/>
                </div>
                <div class="card-name">
                  <a href="${pageContext.request.contextPath}/productdetail?id=${p.productId}">
                    <c:out value="${p.name}"/>
                  </a>
                </div>
                <div class="card-brand">
                  <c:out value="${p.brand}"/>
                </div>
                <div class="card-rating">
                  <span class="card-stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                  </span>
                  <span class="card-review-count">5.0</span>
                </div>
                <div class="card-footer">
                  <div>
                    <span class="card-price">Rs <c:out value="${p.price}"/></span>
                    <c:if test="${not empty p.weight}">
                      <span class="card-price-unit">/ <c:out value="${p.weight}"/></span>
                    </c:if>
                  </div>
                  <c:if test="${not empty p.weight}">
                    <div class="card-weight-tag">
                      <c:out value="${p.weight}"/>
                    </div>
                  </c:if>
                </div>
              </div>
            </div>
          </c:forEach>
        </c:when>
        <c:otherwise>
          <div class="no-products">
            <i class="fas fa-search"></i>
            <p>No products found for this filter.</p>
            <a href="${pageContext.request.contextPath}/products">View all products</a>
          </div>
        </c:otherwise>
      </c:choose>

    </div>

    <%-- CTA BANNER --%>
    <div class="cta-banner">
      <div class="cta-banner-bg"></div>
      <h2 class="cta-heading">Sell your tea<br>on <em>Hiroma</em></h2>
      <div class="cta-actions">
        <button class="btn-cta-primary">Register your brand</button>
        <button class="btn-cta-ghost">Learn more <i class="fas fa-arrow-right"></i></button>
      </div>
    </div>

  </div>
</div>

<%-- FOOTER --%>
<footer class="site-footer">
  <div class="footer-grid">
    <div>
      <div class="footer-logo">H<span>i</span>roma</div>
      <p class="footer-tagline">Nepal's first dedicated marketplace for authentic, organic Himalayan
        teas. From garden to cup.</p>
    </div>
    <div>
      <div class="footer-col-title">Shop</div>
      <ul class="footer-links">
        <li><a href="${pageContext.request.contextPath}/products?category=green">Green Teas</a></li>
        <li><a href="${pageContext.request.contextPath}/products?category=black">Black Teas</a></li>
        <li><a href="${pageContext.request.contextPath}/products?category=white">White Teas</a></li>
        <li><a href="${pageContext.request.contextPath}/products?category=herbal">Herbal Blends</a></li>
      </ul>
    </div>
    <div>
      <div class="footer-col-title">Company</div>
      <ul class="footer-links">
        <li><a href="${pageContext.request.contextPath}/user/home.jsp#about">Our Story</a></li>
        <li><a href="#">Sell on Hiroma</a></li>
        <li><a href="${pageContext.request.contextPath}/user/home.jsp#contact">Contact</a></li>
      </ul>
    </div>
    <div>
      <div class="footer-col-title">Account</div>
      <ul class="footer-links">
        <li><a href="${pageContext.request.contextPath}/user/profile.jsp">My Profile</a></li>
        <li><a href="${pageContext.request.contextPath}/user/orders.jsp">Orders</a></li>
        <li><a href="${pageContext.request.contextPath}/wishlist">Wishlist</a></li>
      </ul>
    </div>
  </div>
  <div class="footer-bottom">
    <div class="footer-copy">&copy; 2025 Hiroma &middot; Himalayan Aroma &middot; Nepal</div>
    <div class="footer-socials">
      <a href="#" title="Instagram"><i class="fab fa-instagram"></i></a>
      <a href="#" title="Facebook"><i class="fab fa-facebook-f"></i></a>
      <a href="#" title="Twitter"><i class="fab fa-twitter"></i></a>
    </div>
  </div>
</footer>

<script>
  function setView(type) {
    document.getElementById('productsGrid').classList.toggle('list-view', type === 'list');
    document.getElementById('gridBtn').classList.toggle('active', type === 'grid');
    document.getElementById('listBtn').classList.toggle('active', type === 'list');
  }

  function applyCategory(cat) {
    window.location.href =
      '${pageContext.request.contextPath}/products?category=' + cat + '#shop-layout';
  }

  function applySort() {
    var cat  = document.querySelector('input[name="cat"]:checked');
    var sort = document.getElementById('sortSelect').value;
    window.location.href =
      '${pageContext.request.contextPath}/products'
      + '?category=' + (cat ? cat.value : 'all')
      + '&sort=' + sort
      + '#shop-layout';
  }

  function clearAllFilters() {
    window.location.href =
      '${pageContext.request.contextPath}/products#shop-layout';
  }
</script>

</body>
</html>

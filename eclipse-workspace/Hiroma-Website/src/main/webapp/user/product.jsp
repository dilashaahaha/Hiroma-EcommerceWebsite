<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- Set defaults for category and sort if not provided --%>
<c:if test="${empty param.category}"><c:set var="activeCategory" value="all"/></c:if>
<c:if test="${not empty param.category}"><c:set var="activeCategory" value="${param.category}"/></c:if>
<c:if test="${empty param.sort}"><c:set var="activeSort" value="featured"/></c:if>
<c:if test="${not empty param.sort}"><c:set var="activeSort" value="${param.sort}"/></c:if>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Shop All Teas &#8212; Hiroma</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/product.css">
</head>
<body>

<!-- NAVBAR -->
<nav class="site-nav">
  <a href="${pageContext.request.contextPath}/user/home.jsp" class="nav-logo">H<span>i</span>roma</a>
  <div class="nav-links">
    <a href="${pageContext.request.contextPath}/user/product.jsp" class="active">Shop</a>
    <a href="${pageContext.request.contextPath}/user/product.jsp?category=all">Collections</a>
    <a href="${pageContext.request.contextPath}/user/home.jsp#about">Our Story</a>
    <a href="${pageContext.request.contextPath}/user/home.jsp#brands">Brands</a>
  </div>
  <div class="nav-right">
    <button class="nav-icon">&#9906;</button>
    <div class="nav-cart">
      <a href="${pageContext.request.contextPath}/user/cart.jsp" class="nav-icon">&#9744;</a>
      <span class="cart-bubble">
        <c:out value="${empty sessionScope.cart ? 0 : sessionScope.cart.size()}"/>
      </span>
    </div>
    <c:choose>
      <c:when test="${not empty sessionScope.user}">
        <a href="${pageContext.request.contextPath}/user/profile.jsp" class="btn-nav">Account</a>
      </c:when>
      <c:otherwise>
        <a href="${pageContext.request.contextPath}/authentication/login.jsp" class="btn-nav">Account</a>
      </c:otherwise>
    </c:choose>
  </div>
</nav>

<!-- PAGE HERO -->
<section class="page-hero">
  <div class="hero-bg"></div>
  <div class="hero-inner">
    <div class="hero-text">
      <div class="eyebrow">Our Collection</div>
      <h1 class="hero-heading">Nepal's finest<br>teas, <em>curated</em><br>for you</h1>
      <p class="hero-sub">46 varieties from 8 districts across Nepal's eastern hills — all organic, all authentic, all sourced directly from verified gardens.</p>
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

<!-- MARQUEE -->
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

<!-- SHOP LAYOUT -->
<div class="shop-layout">

  <!-- SIDEBAR -->
  <aside class="sidebar">

    <c:if test="${not empty sessionScope.successMessage}">
      <div class="alert alert-success"><c:out value="${sessionScope.successMessage}"/></div>
      <c:remove var="successMessage" scope="session"/>
    </c:if>
    <c:if test="${not empty sessionScope.errorMessage}">
      <div class="alert alert-error"><c:out value="${sessionScope.errorMessage}"/></div>
      <c:remove var="errorMessage" scope="session"/>
    </c:if>

    <!-- Category Filter -->
    <div class="filter-section">
      <div class="filter-title">
        Category
        <a href="${pageContext.request.contextPath}/user/product.jsp">Clear</a>
      </div>
      <div class="filter-options">
        <label class="filter-option <c:if test="${activeCategory == 'all'}">active</c:if>">
          <input type="radio" name="cat" value="all"
                 <c:if test="${activeCategory == 'all'}">checked</c:if>
                 onchange="applyCategory(this.value)"> All teas
          <span class="filter-count">46</span>
        </label>
        <label class="filter-option <c:if test="${activeCategory == 'green'}">active</c:if>">
          <input type="radio" name="cat" value="green"
                 <c:if test="${activeCategory == 'green'}">checked</c:if>
                 onchange="applyCategory(this.value)"> Green Tea
          <span class="filter-count">12</span>
        </label>
        <label class="filter-option <c:if test="${activeCategory == 'black'}">active</c:if>">
          <input type="radio" name="cat" value="black"
                 <c:if test="${activeCategory == 'black'}">checked</c:if>
                 onchange="applyCategory(this.value)"> Black Tea
          <span class="filter-count">18</span>
        </label>
        <label class="filter-option <c:if test="${activeCategory == 'white'}">active</c:if>">
          <input type="radio" name="cat" value="white"
                 <c:if test="${activeCategory == 'white'}">checked</c:if>
                 onchange="applyCategory(this.value)"> White Tea
          <span class="filter-count">7</span>
        </label>
        <label class="filter-option <c:if test="${activeCategory == 'herbal'}">active</c:if>">
          <input type="radio" name="cat" value="herbal"
                 <c:if test="${activeCategory == 'herbal'}">checked</c:if>
                 onchange="applyCategory(this.value)"> Herbal Blends
          <span class="filter-count">9</span>
        </label>
      </div>
    </div>

    <!-- Price Range -->
    <div class="filter-section">
      <div class="filter-title">Price Range</div>
      <div class="price-range">
        <input type="range" id="priceSlider" min="0" max="3000" step="50" value="3000"
               oninput="updatePrice(this.value)">
        <div class="price-labels">
          <span>Rs 0</span>
          <span id="priceLabel">Rs 3,000</span>
        </div>
      </div>
    </div>

    <!-- Origin District -->
    <div class="filter-section">
      <div class="filter-title">Origin District</div>
      <div class="district-tags">
        <button class="district-tag <c:if test="${param.district == 'ilam'}">active</c:if>"
                onclick="selectDistrict('ilam')">Ilam</button>
        <button class="district-tag <c:if test="${param.district == 'taplejung'}">active</c:if>"
                onclick="selectDistrict('taplejung')">Taplejung</button>
        <button class="district-tag <c:if test="${param.district == 'dhankuta'}">active</c:if>"
                onclick="selectDistrict('dhankuta')">Dhankuta</button>
        <button class="district-tag <c:if test="${param.district == 'panchthar'}">active</c:if>"
                onclick="selectDistrict('panchthar')">Panchthar</button>
        <button class="district-tag <c:if test="${param.district == 'kaski'}">active</c:if>"
                onclick="selectDistrict('kaski')">Kaski</button>
        <button class="district-tag <c:if test="${param.district == 'sindhupalchok'}">active</c:if>"
                onclick="selectDistrict('sindhupalchok')">Sindhupalchok</button>
      </div>
    </div>

    <!-- Brand -->
    <div class="filter-section">
      <div class="filter-title">Brand</div>
      <div class="filter-options">
        <label class="filter-option"><input type="checkbox" value="ilam_estate"        onchange="applyFilters()"> Ilam Tea Estate</label>
        <label class="filter-option"><input type="checkbox" value="taplejung_organics" onchange="applyFilters()"> Taplejung Organics</label>
        <label class="filter-option"><input type="checkbox" value="himalayan_brew"     onchange="applyFilters()"> Himalayan Brew Co.</label>
        <label class="filter-option"><input type="checkbox" value="pure_nepal"         onchange="applyFilters()"> Pure Nepal Herbs</label>
      </div>
    </div>

    <button class="clear-filters" onclick="clearAllFilters()">Clear All Filters</button>
  </aside>

  <!-- PRODUCT AREA -->
  <div class="product-area">

    <!-- Category Pills -->
    <div class="category-row">
      <a href="${pageContext.request.contextPath}/user/product.jsp?category=all"
         class="cat-pill <c:if test="${activeCategory == 'all'}">active</c:if>">
        <span class="cat-pill-icon"></span> All teas <span class="cat-pill-count">46</span>
      </a>
      <a href="${pageContext.request.contextPath}/user/product.jsp?category=green"
         class="cat-pill <c:if test="${activeCategory == 'green'}">active</c:if>">
        <span class="cat-pill-icon"></span> Green <span class="cat-pill-count">12</span>
      </a>
      <a href="${pageContext.request.contextPath}/user/product.jsp?category=black"
         class="cat-pill <c:if test="${activeCategory == 'black'}">active</c:if>">
        <span class="cat-pill-icon"></span> Black <span class="cat-pill-count">18</span>
      </a>
      <a href="${pageContext.request.contextPath}/user/product.jsp?category=white"
         class="cat-pill <c:if test="${activeCategory == 'white'}">active</c:if>">
        White <span class="cat-pill-count">7</span>
      </a>
      <a href="${pageContext.request.contextPath}/user/product.jsp?category=herbal"
         class="cat-pill <c:if test="${activeCategory == 'herbal'}">active</c:if>">
        <span class="cat-pill-icon"></span> Herbal <span class="cat-pill-count">9</span>
      </a>
    </div>

    <!-- Toolbar -->
    <div class="toolbar">
      <div class="toolbar-left">
        <span class="results-count">Showing <strong>6</strong> of 46 products</span>
        <div class="active-filters" id="activeFilters"></div>
      </div>
      <div class="toolbar-right">
        <select class="sort-select" id="sortSelect" onchange="applyFilters()">
          <option value="featured"   <c:if test="${activeSort == 'featured'}">selected</c:if>>Sort: Featured</option>
          <option value="price_asc"  <c:if test="${activeSort == 'price_asc'}">selected</c:if>>Price: Low to High</option>
          <option value="price_desc" <c:if test="${activeSort == 'price_desc'}">selected</c:if>>Price: High to Low</option>
          <option value="newest"     <c:if test="${activeSort == 'newest'}">selected</c:if>>Newest First</option>
          <option value="rating"     <c:if test="${activeSort == 'rating'}">selected</c:if>>Best Rated</option>
        </select>
        <div class="view-toggle">
          <button class="view-btn active" id="gridBtn" onclick="setView('grid')" title="Grid">&#8859;</button>
          <button class="view-btn"        id="listBtn" onclick="setView('list')" title="List">&#8801;</button>
        </div>
      </div>
    </div>

    <!-- PRODUCT GRID -->
    <div class="products-grid" id="productsGrid">

      <%-- Dynamic: rendered by controller when "products" attribute is set --%>
      <c:choose>
        <c:when test="${not empty requestScope.products}">
          <c:forEach var="p" items="${requestScope.products}">
            <div class="product-card">
              <div class="card-img">
                <div class="card-img-emoji">&#9749;</div>
                <div class="card-badges">
                  <span class="badge badge-new"><c:out value="${p.badge}"/></span>
                </div>
                <div class="card-actions">
                  <form action="${pageContext.request.contextPath}/CartController" method="post" style="flex:1;">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="productId" value="${p.id}">
                    <input type="hidden" name="quantity" value="1">
                    <button type="submit" class="btn-add">Add to cart</button>
                  </form>
                  <a href="${pageContext.request.contextPath}/user/productdetail.jsp?id=${p.id}" class="btn-quick">&#128065;</a>
                </div>
              </div>
              <div class="card-body">
                <div class="card-origin"><c:out value="${p.origin}"/></div>
                <div class="card-name"><c:out value="${p.name}"/></div>
                <div class="card-brand"><c:out value="${p.brand}"/></div>
                <div class="card-footer">
                  <div><span class="card-price">Rs <c:out value="${p.price}"/></span></div>
                </div>
              </div>
            </div>
          </c:forEach>
        </c:when>

        <%-- Static sample cards for UI Milestone --%>
        <c:otherwise>
          <!-- Card 1 -->
          <div class="product-card">
            <div class="card-img">
            <img src="${pageContext.request.contextPath}/images/il_570xN.6426055539_90y2.jpg" alt="Illam First Flush Darjeeling">
              <div class="card-overlay-deco">Tea</div>
              <div class="card-badges"><span class="badge badge-bestseller">Best Seller</span><span class="badge badge-organic">Organic</span></div>
              <button class="wishlist-btn" onclick="toggleWishlist(this,1)">&#9825;</button>
              <div class="card-actions">
                <form action="${pageContext.request.contextPath}/CartController" method="post" style="flex:1;">
                  <input type="hidden" name="action" value="add">
                  <input type="hidden" name="productId" value="1">
                  <input type="hidden" name="quantity" value="1">
                  <button type="submit" class="btn-add">Add to cart</button>
                </form>
                <a href="${pageContext.request.contextPath}/user/productdetail.jsp?id=1" class="btn-quick">&#128065;</a>
              </div>
            </div>
            <div class="card-body">
              <div class="card-origin">Illam &middot; Koshi Province &middot; 1,200m</div>
              <div class="card-name">Illam First Flush Darjeeling</div>
              <div class="card-brand">Illam Tea Estate</div>
              <div class="card-rating"><span class="card-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</span><span class="card-review-count">4.9 (48)</span></div>
              <div class="card-footer"><div><span class="card-price">Rs 850</span> <span class="card-price-unit">/ 100g</span></div><div class="card-weight-tag">100g</div></div>
            </div>
          </div>
         <!-- Card 2 – FIXED: removed duplicate card-img-emoji inside card-img -->
          <div class="product-card">
            <div class="card-img">
              <img src="${pageContext.request.contextPath}/images/9a5609c0471d2c0906e97d04a7239936.jpg" alt="Silver Needle White Tea">
              <div class="card-overlay-deco">White</div>
              <div class="card-badges">
                <span class="badge badge-new">New Arrival</span>
                <span class="badge badge-organic">Organic</span>
              </div>
              <button class="wishlist-btn" onclick="toggleWishlist(this,2)">&#9825;</button>
              <div class="card-actions">
                <form action="${pageContext.request.contextPath}/CartController" method="post" style="flex:1;">
                  <input type="hidden" name="action" value="add">
                  <input type="hidden" name="productId" value="2">
                  <input type="hidden" name="quantity" value="1">
                  <button type="submit" class="btn-add">Add to cart</button>
                </form>
                <a href="${pageContext.request.contextPath}/user/productdetail.jsp?id=2" class="btn-quick">&#128065;</a>
              </div>
            </div>
            <div class="card-body">
              <div class="card-origin">Taplejung &middot; Koshi Province &middot; 1,800m</div>
              <div class="card-name">Silver Needle White Tea</div>
              <div class="card-brand">Taplejung Organics</div>
              <div class="card-rating"><span class="card-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</span><span class="card-review-count">4.8 (31)</span></div>
              <div class="card-footer">
                <div><span class="card-price">Rs 1,200</span> <span class="card-price-unit">/ 50g</span></div>
                <div class="card-weight-tag">50g</div>
              </div>
            </div>
          </div>

          <!-- Card 3 -->
          <div class="product-card">
            <div class="card-img">
            <img src="${pageContext.request.contextPath}/images/Picsart_26-04-14_15-39-49-366.jpg" alt="Himalayan Herbal Blend">
              <div class="card-overlay-deco">Herbal</div>
              <div class="card-badges"><span class="badge badge-organic">Organic</span></div>
              <button class="wishlist-btn" onclick="toggleWishlist(this,3)">&#9825;</button>
              <div class="card-actions">
                <form action="${pageContext.request.contextPath}/CartController" method="post" style="flex:1;">
                  <input type="hidden" name="action" value="add">
                  <input type="hidden" name="productId" value="3">
                  <input type="hidden" name="quantity" value="1">
                  <button type="submit" class="btn-add">Add to cart</button>
                </form>
                <a href="${pageContext.request.contextPath}/user/productdetail.jsp?id=3" class="btn-quick">&#128065;</a>
              </div>
            </div>
            <div class="card-body">
              <div class="card-origin">Dhankuta &middot; Koshi Province &middot; 900m</div>
              <div class="card-name">Himalayan Herbal Blend</div>
              <div class="card-brand">Himalayan Brew Co.</div>
              <div class="card-rating"><span class="card-stars">&#9733;&#9733;&#9733;&#9733;&#9734;</span><span class="card-review-count">4.6 (22)</span></div>
              <div class="card-footer"><div><span class="card-price">Rs 650</span> <span class="card-price-unit">/ 100g</span></div><div class="card-weight-tag">100g</div></div>
            </div>
          </div>
          <!-- Card 4 -->
          <div class="product-card">
            <div class="card-img">
            <img src="${pageContext.request.contextPath}/images/71wJD5e7ML.jpg" alt="Moshi Morning Black">
              <div class="card-img-emoji">&#9749;</div>
              <div class="card-overlay-deco">Black</div>
              <div class="card-badges"><span class="badge badge-bestseller">Best Seller</span></div>
              <button class="wishlist-btn" onclick="toggleWishlist(this,4)">&#9825;</button>
              <div class="card-actions">
                <form action="${pageContext.request.contextPath}/CartController" method="post" style="flex:1;">
                  <input type="hidden" name="action" value="add">
                  <input type="hidden" name="productId" value="4">
                  <input type="hidden" name="quantity" value="1">
                  <button type="submit" class="btn-add">Add to cart</button>
                </form>
                <a href="${pageContext.request.contextPath}/user/productdetail.jsp?id=4" class="btn-quick">&#128065;</a>
              </div>
            </div>
            <div class="card-body">
              <div class="card-origin">Illam &middot; Koshi Province &middot; 1,000m</div>
              <div class="card-name">Koshi Morning Black</div>
              <div class="card-brand">Koshi Garden Teas</div>
              <div class="card-rating"><span class="card-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</span><span class="card-review-count">4.7 (56)</span></div>
              <div class="card-footer"><div><span class="card-price">Rs 720</span> <span class="card-price-unit">/ 100g</span></div><div class="card-weight-tag">100g</div></div>
            </div>
          </div>
          <!-- Card 5 – FIXED: img is now inside card-img div, not a direct child of product-card -->
          <div class="product-card">
            <div class="card-img">
              <img src="${pageContext.request.contextPath}/images/OrganicGreentea1.png" alt="Organic Green Tea">
              <div class="card-overlay-deco">Green</div>
              <div class="card-badges">
                <span class="badge badge-new">New</span>
                <span class="badge badge-organic">Organic</span>
              </div>
              <button class="wishlist-btn" onclick="toggleWishlist(this,5)">&#9825;</button>
              <div class="card-actions">
                <form action="${pageContext.request.contextPath}/CartController" method="post" style="flex:1;">
                  <input type="hidden" name="action" value="add">
                  <input type="hidden" name="productId" value="5">
                  <input type="hidden" name="quantity" value="1">
                  <button type="submit" class="btn-add">Add to cart</button>
                </form>
                <a href="${pageContext.request.contextPath}/user/productdetail.jsp?id=5" class="btn-quick">&#128065;</a>
              </div>
            </div>
            <div class="card-body">
              <div class="card-origin">Panchthar &middot; Koshi Province &middot; 1,100m</div>
              <div class="card-name">Panchthar Spring Green</div>
              <div class="card-brand">Pure Nepal Herbs</div>
              <div class="card-rating"><span class="card-stars">&#9733;&#9733;&#9733;&#9733;&#9734;</span><span class="card-review-count">4.5 (18)</span></div>
              <div class="card-footer">
                <div><span class="card-price">Rs 580</span> <span class="card-price-unit">/ 100g</span></div>
                <div class="card-weight-tag">100g</div>
              </div>
            </div>
          </div>

         <!-- Card 6 – FIXED: removed duplicate nested product-card div -->
          <div class="product-card">
            <div class="card-img">
              <img src="${pageContext.request.contextPath}/images/b8a9c1aca4b03118e36b75331d03f6dc.jpg" alt="Golden Oolong Tea">
              <div class="card-overlay-deco">Oolong</div>
              <div class="card-badges">
                <span class="badge badge-organic">Organic</span>
              </div>
              <button class="wishlist-btn" onclick="toggleWishlist(this,6)">&#9825;</button>
              <div class="card-actions">
                <form action="${pageContext.request.contextPath}/CartController" method="post" style="flex:1;">
                  <input type="hidden" name="action" value="add">
                  <input type="hidden" name="productId" value="6">
                  <input type="hidden" name="quantity" value="1">
                  <button type="submit" class="btn-add">Add to cart</button>
                </form>
                <a href="${pageContext.request.contextPath}/user/productdetail.jsp?id=6" class="btn-quick">&#128065;</a>
              </div>
            </div>
            <div class="card-body">
              <div class="card-origin">Taplejung &middot; Koshi Province &middot; 1,600m</div>
              <div class="card-name">Taplejung Golden Oolong</div>
              <div class="card-brand">Taplejung Organics</div>
              <div class="card-rating"><span class="card-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</span><span class="card-review-count">4.9 (14)</span></div>
              <div class="card-footer">
                <div><span class="card-price">Rs 1,450</span> <span class="card-price-unit">/ 50g</span></div>
                <div class="card-weight-tag">50g</div>
              </div>
            </div>
          </div>
        </c:otherwise>
      </c:choose>

    </div><!-- /products-grid -->

    <!-- Load More -->
    <div class="load-more-section">
      <span class="load-more-text">Showing 6 of 46 products</span>
      <div class="progress-bar"><div class="progress-fill"></div></div>
      <form action="${pageContext.request.contextPath}/user/product.jsp" method="get">
        <input type="hidden" name="category" value="${activeCategory}">
        <button type="submit" class="btn-load-more">Load more products</button>
      </form>
    </div>

    <!-- CTA Banner -->
    <div class="cta-banner">
      <div class="cta-banner-bg"></div>
      <h2 class="cta-heading">Sell your tea<br>on <em>Hiroma</em></h2>
      <div class="cta-actions">
        <button class="btn-cta-primary">Register your brand</button>
        <button class="btn-cta-ghost">Learn more &#8594;</button>
      </div>
    </div>

  </div><!-- /product-area -->
</div><!-- /shop-layout -->

<!-- FOOTER -->
<footer class="site-footer">
  <div class="footer-grid">
    <div>
      <div class="footer-logo">H<span>i</span>roma</div>
      <p class="footer-tagline">Nepal's first dedicated marketplace for authentic, organic Himalayan teas. From garden to cup.</p>
    </div>
    <div>
      <div class="footer-col-title">Shop</div>
      <ul class="footer-links">
        <li><a href="${pageContext.request.contextPath}/user/product.jsp?category=green">Green Teas</a></li>
        <li><a href="${pageContext.request.contextPath}/user/product.jsp?category=black">Black Teas</a></li>
        <li><a href="${pageContext.request.contextPath}/user/product.jsp?category=white">White Teas</a></li>
        <li><a href="${pageContext.request.contextPath}/user/product.jsp?category=herbal">Herbal Blends</a></li>
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
        <li><a href="#">Wishlist</a></li>
      </ul>
    </div>
  </div>
  <div class="footer-bottom">
    <div class="footer-copy">&copy; 2025 Hiroma &middot; Himalayan Aroma &middot; Nepal</div>
    <div class="footer-socials"><a href="#">Instagram</a><a href="#">Facebook</a><a href="#">Twitter</a></div>
  </div>
</footer>

<script>
  function setView(type) {
    document.getElementById('productsGrid').classList.toggle('list-view', type === 'list');
    document.getElementById('gridBtn').classList.toggle('active', type === 'grid');
    document.getElementById('listBtn').classList.toggle('active', type === 'list');
  }
  function toggleWishlist(btn, id) {
    btn.classList.toggle('wishlisted');
    btn.innerHTML = btn.classList.contains('wishlisted') ? '&#9829;' : '&#9825;';
  }
  function updatePrice(val) {
    document.getElementById('priceLabel').textContent = 'Rs ' + parseInt(val).toLocaleString();
  }
  function applyCategory(cat) {
    window.location.href = '${pageContext.request.contextPath}/user/product.jsp?category=' + cat;
  }
  function selectDistrict(d) {
    var p = new URLSearchParams(window.location.search);
    p.set('district', d);
    window.location.href = '${pageContext.request.contextPath}/user/product.jsp?' + p.toString();
  }
  function applyFilters() {
    var cat  = document.querySelector('input[name="cat"]:checked');
    var sort = document.getElementById('sortSelect').value;
    window.location.href = '${pageContext.request.contextPath}/user/product.jsp?category=' + (cat ? cat.value : 'all') + '&sort=' + sort;
  }
  function clearAllFilters() { window.location.href = '${pageContext.request.contextPath}/user/product.jsp'; }
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title><c:out value="${not empty product ? product.name : 'Product'}"/> &#8212; Hiroma</title>
  <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,500;0,600;1,300;1,400;1,500&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/productdetail.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<%-- NAVBAR --%>
<nav>
  <a href="${pageContext.request.contextPath}/user/home" class="nav-logo">H<span>i</span>roma</a>
  <div class="nav-links">
    <a href="${pageContext.request.contextPath}/products">Shop</a>
    <a href="${pageContext.request.contextPath}/products?category=all">Collections</a>
    <a href="${pageContext.request.contextPath}/user/home#about">Our Story</a>
    <a href="${pageContext.request.contextPath}/user/home#brands">Brands</a>
  </div>
  <div class="nav-right">
    <a href="${pageContext.request.contextPath}/wishlist" class="nav-icon-btn">
      <i class="fas fa-heart"></i>
    </a>
    <div class="nav-cart-badge">
      <a href="${pageContext.request.contextPath}/Cart" class="nav-icon-btn">
        <i class="fas fa-shopping-bag"></i>
      </a>
      <span class="cart-count">
        <c:out value="${empty sessionScope.cartCount ? 0 : sessionScope.cartCount}"/>
      </span>
    </div>
    <c:choose>
      <c:when test="${not empty sessionScope.user}">
        <a href="${pageContext.request.contextPath}/user/profile.jsp">
          <button class="btn-account">Account</button>
        </a>
      </c:when>
      <c:otherwise>
        <a href="${pageContext.request.contextPath}/authentication/login.jsp">
          <button class="btn-account">Account</button>
        </a>
      </c:otherwise>
    </c:choose>
  </div>
</nav>

<%-- BREADCRUMB --%>
<div class="breadcrumb">
  <a href="${pageContext.request.contextPath}/user/home">Home</a>
  <span class="bc-sep">/</span>
  <a href="${pageContext.request.contextPath}/products?category=${product.category}">
    <c:out value="${product.category}"/>
  </a>
  <span class="bc-sep">/</span>
  <span><c:out value="${product.name}"/></span>
</div>

<%-- PRODUCT NOT FOUND --%>
<c:if test="${empty product}">
  <div class="not-found">
    <h2>Product not found.</h2>
    <a href="${pageContext.request.contextPath}/products">Back to shop</a>
  </div>
</c:if>

<%-- PRODUCT FOUND — DYNAMIC FROM DB --%>
<c:if test="${not empty product}">

  <section class="product-section">

    <%-- PRODUCT GALLERY --%>
    <div class="product-gallery">
      <div class="gallery-bg"></div>
      <div class="gallery-badge">Best Seller</div>
      <div class="gallery-main">
        <img src="${pageContext.request.contextPath}/images/${product.imageFile}"
             alt="<c:out value='${product.name}'/>">
      </div>
    </div>

    <%-- PRODUCT INFO --%>
    <div class="product-info">
      <div class="product-eyebrow">
        <span class="product-origin-tag"><c:out value="${product.origin}"/></span>
        <span class="product-brand-link">
          <c:out value="${product.brand}"/> <i class="fas fa-arrow-right"></i>
        </span>
      </div>

      <h1 class="product-name"><c:out value="${product.name}"/></h1>

      <div class="product-rating">
        <span class="pd-stars">
          <i class="fas fa-star"></i><i class="fas fa-star"></i>
          <i class="fas fa-star"></i><i class="fas fa-star"></i>
          <i class="fas fa-star"></i>
        </span>
        <span class="rating-count">
          <c:out value="${empty reviews ? '0' : reviews.size()}"/> reviews
        </span>
      </div>

      <p class="product-desc"><c:out value="${product.description}"/></p>

      <div class="specs-row">
        <div class="spec-item">
          <div class="spec-label">Weight</div>
          <div class="spec-value"><c:out value="${product.weight}"/></div>
        </div>
        <div class="spec-item">
          <div class="spec-label">Harvest</div>
          <div class="spec-value">Spring 2025</div>
        </div>
        <div class="spec-item">
          <div class="spec-label">Type</div>
          <div class="spec-value"><c:out value="${product.category}"/></div>
        </div>
        <div class="spec-item">
          <div class="spec-label">Stock</div>
          <div class="spec-value"><c:out value="${product.stock}"/> left</div>
        </div>
      </div>

      <div class="purchase-row">
        <div class="price-block">
          <div class="price-main">
            Rs <fmt:formatNumber value="${product.price}" maxFractionDigits="0"/>
          </div>
          <div class="price-unit">per <c:out value="${product.weight}"/></div>
        </div>
        <div class="qty-control">
          <button class="qty-btn" onclick="changeQty(-1)">
            <i class="fas fa-minus"></i>
          </button>
          <input class="qty-val" type="text" id="qtyInput" value="1" readonly>
          <button class="qty-btn" onclick="changeQty(1)">
            <i class="fas fa-plus"></i>
          </button>
        </div>
      </div>

      <%-- Wishlist check --%>
      <c:set var="alreadyWishlisted" value="false"/>
      <c:forEach var="wItem" items="${sessionScope.wishlist}">
        <c:if test="${wItem.productId == product.productId}">
          <c:set var="alreadyWishlisted" value="true"/>
        </c:if>
      </c:forEach>

      <div class="purchase-actions">
        <%-- ADD TO CART --%>
        <form action="${pageContext.request.contextPath}/Cart" method="post" style="flex:1;">
          <input type="hidden" name="action" value="add">
          <input type="hidden" name="productId" value="${product.productId}">
          <input type="hidden" name="quantity" id="qtyHidden" value="1">
          <button type="submit" class="btn-add-cart" style="width:100%;">Add to cart</button>
        </form>
        <%-- WISHLIST --%>
        <form action="${pageContext.request.contextPath}/wishlist" method="post">
          <input type="hidden" name="productId" value="${product.productId}">
          <c:choose>
            <c:when test="${alreadyWishlisted}">
              <button type="submit" class="btn-wishlist wishlisted" title="In your wishlist">
                <i class="fas fa-heart"></i>
              </button>
            </c:when>
            <c:otherwise>
              <button type="submit" class="btn-wishlist" title="Add to wishlist">
                <i class="far fa-heart"></i>
              </button>
            </c:otherwise>
          </c:choose>
        </form>
      </div>

      <div class="guarantee-row">
        <div class="guarantee-item"><span>Organic certified</span></div>
        <div class="guarantee-item"><span>Free delivery over Rs 2,000</span></div>
        <div class="guarantee-item"><span>7-day return policy</span></div>
      </div>
    </div>
  </section>

  <%-- REVIEWS SECTION — FROM DB --%>
  <section class="reviews-section">
    <div class="reviews-header">
      <div>
        <div class="reviews-eyebrow">Reviews</div>
        <h2 class="reviews-title">What customers say</h2>
      </div>
      <form action="${pageContext.request.contextPath}/review" method="get">
        <input type="hidden" name="productId" value="${product.productId}">
        <button type="submit" class="btn-write-review">Write a review</button>
      </form>
    </div>

    <div class="reviews-grid">
      <c:choose>
        <c:when test="${not empty reviews}">
          <c:forEach var="r" items="${reviews}">
            <div class="review-card">
              <div class="review-header">
                <div>
                  <div class="reviewer-name">User #<c:out value="${r.userId}"/></div>
                  <div class="reviewer-date"><c:out value="${r.createdAt}"/></div>
                </div>
                <div class="review-stars">
                  <c:forEach begin="1" end="${r.rating}">
                    <i class="fas fa-star"></i>
                  </c:forEach>
                </div>
              </div>
              <p class="review-text"><c:out value="${r.comment}"/></p>
              <div class="review-verified">
                <i class="fas fa-check-circle"></i> Verified purchase
              </div>
            </div>
          </c:forEach>
        </c:when>
        <c:otherwise>
          <div class="no-reviews">
            <p>No reviews yet. Be the first to review this product!</p>
          </div>
        </c:otherwise>
      </c:choose>
    </div>
  </section>

</c:if>

<%-- FOOTER --%>
<footer class="site-footer">
  <div class="footer-grid">
    <div>
      <div class="footer-logo">H<span>i</span>roma</div>
      <p class="footer-tagline">Nepal's first dedicated marketplace for authentic, organic Himalayan teas.</p>
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
        <li><a href="${pageContext.request.contextPath}/user/home#about">Our Story</a></li>
        <li><a href="#">Sell on Hiroma</a></li>
        <li><a href="${pageContext.request.contextPath}/user/home#contact">Contact</a></li>
      </ul>
    </div>
    <div>
      <div class="footer-col-title">Account</div>
      <ul class="footer-links">
        <li><a href="${pageContext.request.contextPath}/user/profile.jsp">My Profile</a></li>
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
  function changeQty(delta) {
    var inp    = document.getElementById('qtyInput');
    var hidden = document.getElementById('qtyHidden');
    var newVal = Math.max(1, parseInt(inp.value) + delta);
    inp.value    = newVal;
    hidden.value = newVal;
  }
</script>

</body>
</html>

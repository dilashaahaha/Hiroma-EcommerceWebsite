<%--
    cart.jsp
    Location: src/main/webapp/user/product.jsp
    Author: M3
    Description: Contains items added to cart.
                 Import this into other JSP files using:
                 <%@ include file="/user/cart.jsp" --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Your Cart &#8212; Hiroma</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css">
</head>
<body>

<%-- NAVBAR --%>
<nav class="site-nav">
  <a href="${pageContext.request.contextPath}/user/home.jsp" class="nav-logo">H<span>i</span>roma</a>
  <div class="nav-links">
    <a href="${pageContext.request.contextPath}/user/product.jsp">Shop</a>
    <a href="${pageContext.request.contextPath}/user/product.jsp?category=all">Collections</a>
    <a href="${pageContext.request.contextPath}/user/home.jsp#about">Our Story</a>
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

<%-- HERO PAGE --%>
<div class="page-hero-cart">
  <div class="page-eyebrow">Your cart</div>
  <h1 class="page-title">
    Your selection <em>(<c:out value="${empty sessionScope.cart ? 0 : sessionScope.cart.size()}"/> items)</em>
  </h1>
</div>

<%-- ALERTS --%>
<c:if test="${not empty sessionScope.successMessage}">
  <div style="padding:0 48px;">
    <div class="alert alert-success"><c:out value="${sessionScope.successMessage}"/></div>
  </div>
  <c:remove var="successMessage" scope="session"/>
</c:if>
<c:if test="${not empty sessionScope.errorMessage}">
  <div style="padding:0 48px;">
    <div class="alert alert-error"><c:out value="${sessionScope.errorMessage}"/></div>
  </div>
  <c:remove var="errorMessage" scope="session"/>
</c:if>

<%-- CART LAYOUT --%>
<div class="cart-layout">

  <div class="cart-items">

    <c:choose>
      <c:when test="${not empty requestScope.cartItems}">
        <c:forEach var="item" items="${requestScope.cartItems}">
          <div class="cart-item">
            <div class="item-img">&#9749;</div>
            <div class="item-info">
              <div class="item-origin"><c:out value="${item.origin}"/></div>
              <div class="item-name"><c:out value="${item.productName}"/></div>
              <div class="item-brand"><c:out value="${item.brand}"/> &middot; <c:out value="${item.weight}"/></div>
            </div>
            <div class="item-right">
              <div class="item-price">Rs <c:out value="${item.price}"/></div>
              <div class="qty-control">
                <button class="qty-btn" onclick="changeItemQty(this,-1)">&#8722;</button>
                <input class="qty-val" type="number" value="${item.quantity}" min="1">
                <button class="qty-btn" onclick="changeItemQty(this,1)">+</button>
              </div>
              <form action="${pageContext.request.contextPath}/CartController" method="post" style="display:inline;">
                <input type="hidden" name="action" value="remove">
                <input type="hidden" name="productId" value="${item.productId}">
                <button type="submit" class="remove-btn">Remove</button>
              </form>
            </div>
          </div>
        </c:forEach>
      </c:when>

      <c:otherwise>
        <%-- ITEMS --%>
        <div class="cart-item">
          <div class="item-img">
  <img src="${pageContext.request.contextPath}/images/Ilamtea.jpg" alt="Illam First Flush"></div>
          <div class="item-info">
            <div class="item-origin">Illam, Koshi Province</div>
            <div class="item-name">Illam First Flush Darjeeling</div>
            <div class="item-brand">Illam Tea Estate &middot; 100g</div>
          </div>
          <div class="item-right">
            <div class="item-price">Rs 850</div>
            <div class="qty-control">
              <button class="qty-btn" onclick="changeItemQty(this,-1)">&#8722;</button>
              <input class="qty-val" type="number" value="2" min="1">
              <button class="qty-btn" onclick="changeItemQty(this,1)">+</button>
            </div>
            <form action="${pageContext.request.contextPath}/CartController" method="post" style="display:inline;">
              <input type="hidden" name="action" value="remove">
              <input type="hidden" name="productId" value="1">
              <button type="submit" class="remove-btn">Remove</button>
            </form>
          </div>
        </div>




        <div class="cart-item">
          <div class="item-img">
          <img src="${pageContext.request.contextPath}/images/silverneedle.jpg" alt="Silver Needle White Tea"></div>
          <div class="item-info">
            <div class="item-origin">Taplejung, Koshi Province</div>
            <div class="item-name">Silver Needle White Tea</div>
            <div class="item-brand">Taplejung Organics &middot; 50g</div>
          </div>
          <div class="item-right">
            <div class="item-price">Rs 1,200</div>
            <div class="qty-control">
              <button class="qty-btn" onclick="changeItemQty(this,-1)">&#8722;</button>
              <input class="qty-val" type="number" value="1" min="1">
              <button class="qty-btn" onclick="changeItemQty(this,1)">+</button>
            </div>
            <form action="${pageContext.request.contextPath}/CartController" method="post" style="display:inline;">
              <input type="hidden" name="action" value="remove">
              <input type="hidden" name="productId" value="2">
              <button type="submit" class="remove-btn">Remove</button>
            </form>
          </div>
        </div>



        <div class="cart-item">
             <div class="item-img">
          <img src="${pageContext.request.contextPath}/images/tokla.jpg" alt="Tokla Tea"></div>
          <div class="item-info">
            <div class="item-origin">Dhankuta, Koshi Province</div>
            <div class="item-name">Himalayan Herbal Blend</div>
            <div class="item-brand">Himalayan Brew Co. &middot; 100g</div>
          </div>
          <div class="item-right">
            <div class="item-price">Rs 650</div>
            <div class="qty-control">
              <button class="qty-btn" onclick="changeItemQty(this,-1)">&#8722;</button>
              <input class="qty-val" type="number" value="1" min="1">
              <button class="qty-btn" onclick="changeItemQty(this,1)">+</button>
            </div>
            <form action="${pageContext.request.contextPath}/CartController" method="post" style="display:inline;">
              <input type="hidden" name="action" value="remove">
              <input type="hidden" name="productId" value="3">
              <button type="submit" class="remove-btn">Remove</button>
            </form>
          </div>
        </div>
      </c:otherwise>
    </c:choose>

  </div>

  <%-- ORDER ITEMS --%>
  <div class="cart-summary">
    <div class="summary-title">Order summary</div>
    <div class="summary-row">
      <span>Subtotal (<c:out value="${empty sessionScope.cart ? 0 : sessionScope.cart.size()}"/> items)</span>
      <span>Rs <c:out value="${not empty requestScope.subtotal ? requestScope.subtotal : '3,550'}"/></span>
    </div>
    <div class="summary-row">
      <span>Delivery</span>
      <span style="color:var(--green-soft);">Free</span>
    </div>
    <div class="summary-row">
      <span>Discount</span>
      <span>&#8212;</span>
    </div>
    <div class="summary-row total">
      <span>Total</span>
      <span>Rs <c:out value="${not empty requestScope.total ? requestScope.total : '3,550'}"/></span>
    </div>

    <%-- PROMO CODE --%>
    <div class="promo-row">
      <input class="promo-input" type="text" placeholder="Promo code" id="promoCode">
      <button class="promo-btn" onclick="applyPromo()">Apply</button>
    </div>

    <a href="${pageContext.request.contextPath}/user/checkout.jsp">
      <button class="btn-checkout">Proceed to checkout &#8594;</button>
    </a>
    <a class="continue-shopping" href="${pageContext.request.contextPath}/user/product.jsp">
      &#8592; Continue shopping
    </a>

    <p class="summary-note">
      Free delivery on orders above Rs 2,000. All products are organic certified
      and sourced directly from Nepal.
    </p>
  </div>

</div>

<%-- GUARANTEE STRIP --%>
<div class="guarantee-strip">
  <div class="guarantee-item">• <span>Secure checkout</span></div>
  <div class="guarantee-item">• <span>Free delivery over Rs 2,000</span></div>
  <div class="guarantee-item">• <span>7-day returns</span></div>
  <div class="guarantee-item">• <span>Organic certified products</span></div>
</div>

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
    <div class="footer-socials">
      <a href="#">Instagram</a><a href="#">Facebook</a><a href="#">Twitter</a>
    </div>
  </div>
</footer>

<script>
  function changeItemQty(btn, delta) {
    var inp = btn.parentElement.querySelector('.qty-val');
    var val = Math.max(1, parseInt(inp.value) + delta);
    inp.value = val;
  }
  function applyPromo() {
    var code = document.getElementById('promoCode').value.trim();
    if (!code) { alert('Please enter a promo code.'); return; }
    alert('Promo code "' + code + '" applied (backend pending).');
  }
</script>
</body>
</html>

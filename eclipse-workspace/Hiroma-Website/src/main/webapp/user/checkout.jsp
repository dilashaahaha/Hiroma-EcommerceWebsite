<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Checkout &#8212; Hiroma</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/checkout.css">
</head>
<body>

<!-- NAVBAR (minimal for checkout) -->
<nav class="checkout-nav">
  <a href="${pageContext.request.contextPath}/user/home.jsp" class="nav-logo">H<span>i</span>roma</a>
  <div class="nav-secure">&#128274; Secure checkout</div>
</nav>

<!-- CHECKOUT STEPS -->
<div class="checkout-steps">
  <div class="step">
    <div class="step-num done">&#10003;</div>
    <div class="step-label done-label">Cart</div>
  </div>
  <div class="step-sep"></div>
  <div class="step">
    <div class="step-num active">2</div>
    <div class="step-label active-label">Checkout</div>
  </div>
  <div class="step-sep"></div>
  <div class="step">
    <div class="step-num inactive">3</div>
    <div class="step-label inactive-label">Confirmation</div>
  </div>
</div>

<!-- ALERTS -->
<c:if test="${not empty sessionScope.errorMessage}">
  <div style="padding:0 48px;">
    <div class="alert alert-error"><c:out value="${sessionScope.errorMessage}"/></div>
  </div>
  <c:remove var="errorMessage" scope="session"/>
</c:if>

<!-- CHECKOUT LAYOUT -->
<div class="checkout-layout">

  <!-- FORM SIDE -->
  <div class="checkout-form-side">
    <form action="${pageContext.request.contextPath}/OrderController" method="post" id="checkoutForm">
      <input type="hidden" name="action" value="placeOrder">

      <!-- DELIVERY ADDRESS -->
      <div class="form-section-title">Delivery address</div>

      <div class="address-cards" id="addressCards">
        <div class="addr-card selected" onclick="selectAddress(this, 'home')">
          <div class="addr-radio selected" id="radio-home"></div>
          <div class="addr-text">
            <div class="addr-name">Home &middot; Kathmandu</div>
            <div class="addr-street">Thamel Marg, Ward 26<br>Kathmandu, Bagmati Province</div>
          </div>
        </div>
        <div class="addr-card" onclick="selectAddress(this, 'office')">
          <div class="addr-radio" id="radio-office"></div>
          <div class="addr-text">
            <div class="addr-name">Office &middot; Patan</div>
            <div class="addr-street">Pulchowk Road, Lalitpur<br>Lalitpur, Bagmati Province</div>
          </div>
        </div>
      </div>
      <input type="hidden" name="addressId" value="home" id="selectedAddress">

      <button type="button" class="new-addr-btn" onclick="toggleNewAddress()">
        + Add a new address
      </button>

      <!-- New Address Form -->
      <div id="newAddressForm" style="display:none; margin-top:16px;">
        <div class="form-row">
          <div class="form-group">
            <label class="form-label">Full Name</label>
            <input class="form-input" type="text" name="newName" placeholder="Your full name">
          </div>
          <div class="form-group">
            <label class="form-label">Phone</label>
            <input class="form-input" type="text" name="newPhone" placeholder="98XXXXXXXX">
          </div>
        </div>
        <div class="form-group">
          <label class="form-label">Street Address</label>
          <input class="form-input" type="text" name="newStreet" placeholder="Street, Ward No.">
        </div>
        <div class="form-row">
          <div class="form-group">
            <label class="form-label">City</label>
            <input class="form-input" type="text" name="newCity" placeholder="Kathmandu">
          </div>
          <div class="form-group">
            <label class="form-label">Province</label>
            <select class="form-select" name="newProvince">
              <option value="">Select province</option>
              <option>Koshi Province</option>
              <option>Madhesh Province</option>
              <option>Bagmati Province</option>
              <option>Gandaki Province</option>
              <option>Lumbini Province</option>
              <option>Karnali Province</option>
              <option>Sudurpashchim Province</option>
            </select>
          </div>
        </div>
      </div>

      <!-- PAYMENT METHOD -->
      <div class="form-section-title" style="margin-top:36px;">Payment method</div>
      <div class="payment-methods" id="paymentMethods">
        <div class="pay-card selected" onclick="selectPayment(this,'COD')">
          <div class="pay-icon" style="background:#EDE6D6;">&#128181;</div>
          <div>
            <div class="pay-label">Cash on Delivery</div>
            <div class="pay-desc">Pay when your order arrives</div>
          </div>
        </div>
        <div class="pay-card" onclick="selectPayment(this,'ESEWA')">
          <div class="pay-icon" style="background:#EAF3DE;">&#128241;</div>
          <div>
            <div class="pay-label">eSewa</div>
            <div class="pay-desc">Nepal's leading digital wallet</div>
          </div>
        </div>
        <div class="pay-card" onclick="selectPayment(this,'KHALTI')">
          <div class="pay-icon" style="background:#E6F1FB;">&#128153;</div>
          <div>
            <div class="pay-label">Khalti</div>
            <div class="pay-desc">Fast digital payment</div>
          </div>
        </div>
      </div>
      <input type="hidden" name="paymentMethod" value="COD" id="paymentMethodInput">

    </form>
  </div>

  <!-- ORDER SUMMARY SIDE -->
  <div class="checkout-summary">
    <div class="os-title">Your order</div>

    <%-- Dynamic: rendered by OrderController when "cartItems" is set --%>
    <c:choose>
      <c:when test="${not empty requestScope.cartItems}">
        <c:forEach var="item" items="${requestScope.cartItems}">
          <div class="os-item">
            <div class="os-img">&#9749;</div>
            <div class="os-name">
              <c:out value="${item.productName}"/><br>
              <span class="os-qty">&times; <c:out value="${item.quantity}"/></span>
            </div>
            <div class="os-price">Rs <c:out value="${item.lineTotal}"/></div>
          </div>
        </c:forEach>
      </c:when>
      <%-- Static sample items for UI Milestone --%>
      <c:otherwise>
        <div class="os-item">
          <div class="os-img" style="background:#EAF3DE;">&#127861;</div>
          <div class="os-name">Illam First Flush<br><span class="os-qty">&times; 2</span></div>
          <div class="os-price">Rs 1,700</div>
        </div>
        <div class="os-item">
          <div class="os-img" style="background:#FAEEDA;">&#127807;</div>
          <div class="os-name">Silver Needle White<br><span class="os-qty">&times; 1</span></div>
          <div class="os-price">Rs 1,200</div>
        </div>
        <div class="os-item">
          <div class="os-img" style="background:#E8F0EB;">&#127808;</div>
          <div class="os-name">Himalayan Herbal Blend<br><span class="os-qty">&times; 1</span></div>
          <div class="os-price">Rs 650</div>
        </div>
      </c:otherwise>
    </c:choose>

    <div class="os-totals">
      <div class="os-total-row"><span>Subtotal</span><span>Rs <c:out value="${not empty requestScope.subtotal ? requestScope.subtotal : '3,550'}"/></span></div>
      <div class="os-total-row"><span>Delivery</span><span style="color:var(--green-soft);">Free</span></div>
      <div class="os-total-row grand"><span>Total</span><span>Rs <c:out value="${not empty requestScope.total ? requestScope.total : '3,550'}"/></span></div>
    </div>

    <button class="btn-place-order" onclick="submitOrder()">
      Place order &#8594;
    </button>
    <div class="secure-note">&#128274; Your payment info is always secure</div>
  </div>

</div><!-- /checkout-layout -->

<script>
  function selectAddress(card, id) {
    document.querySelectorAll('.addr-card').forEach(function(c) {
      c.classList.remove('selected');
      c.querySelector('.addr-radio').classList.remove('selected');
    });
    card.classList.add('selected');
    card.querySelector('.addr-radio').classList.add('selected');
    document.getElementById('selectedAddress').value = id;
  }
  function selectPayment(card, method) {
    document.querySelectorAll('.pay-card').forEach(function(c) { c.classList.remove('selected'); });
    card.classList.add('selected');
    document.getElementById('paymentMethodInput').value = method;
  }
  function toggleNewAddress() {
    var f = document.getElementById('newAddressForm');
    f.style.display = f.style.display === 'none' ? 'block' : 'none';
  }
  function submitOrder() {
    document.getElementById('checkoutForm').submit();
  }
</script>
</body>
</html>
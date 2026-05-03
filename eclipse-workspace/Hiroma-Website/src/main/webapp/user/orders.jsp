<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Orders &#8212; Hiroma</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/orders.css">
</head>
<body>

<!-- NAV -->
<nav class="oh-nav">
  <a href="${pageContext.request.contextPath}/user/home.jsp" class="nav-logo">
    H<span>i</span>roma
  </a>
  <div class="nav-actions">
    <a href="${pageContext.request.contextPath}/user/account.jsp" class="btn-account">Account</a>
  </div>
</nav>

<!-- PAGE HEADER -->
<div class="page-header">
  <div class="page-eyebrow">Your account</div>
  <h1 class="page-title">Order <em>history</em></h1>
</div>

<!-- ALERTS -->
<c:if test="${not empty sessionScope.successMessage}">
  <div class="alert-wrap">
    <div class="alert alert-success"><c:out value="${sessionScope.successMessage}"/></div>
  </div>
  <c:remove var="successMessage" scope="session"/>
</c:if>

<!-- ORDER LIST -->
<div class="oh-content">

  <c:choose>
    <c:when test="${not empty requestScope.orders}">
      <c:forEach var="order" items="${requestScope.orders}">
        <div class="order-card">

          <!-- CARD HEADER -->
          <div class="order-header">
            <div class="order-meta">
              <div class="order-id">Order #<c:out value="${order.orderId}"/></div>
              <div class="order-date">
                <c:out value="${order.orderDate}"/> &middot;
                Rs <c:out value="${order.total}"/> &middot;
                <c:out value="${order.itemCount}"/> item<c:if test="${order.itemCount != 1}">s</c:if>
              </div>
            </div>
            <span class="badge badge-${fn:toLowerCase(order.status)}">
              <c:out value="${order.status}"/>
            </span>
          </div>

          <!-- ORDER ITEMS -->
          <div class="order-items">
            <c:forEach var="item" items="${order.items}">
              <div class="order-item-thumb">
                <div class="item-img">
                  <img src="${pageContext.request.contextPath}/images/${item.imageFile}"
                       alt="${item.productName}">
                </div>
                <div class="item-info">
                  <div class="item-name"><c:out value="${item.productName}"/></div>
                  <div class="item-qty">&times; <c:out value="${item.quantity}"/> &middot; Rs <c:out value="${item.lineTotal}"/></div>
                </div>
              </div>
            </c:forEach>
          </div>

          <!-- TRACKING BAR (shown only when not delivered) -->
          <c:if test="${order.status != 'DELIVERED'}">
            <div class="tracking-bar">
              <div class="track-steps">
                <div class="track-step">
                  <div class="track-dot done"></div>
                  <div class="track-label done">Placed</div>
                </div>
                <div class="track-line ${order.status == 'PROCESSING' or order.status == 'SHIPPED' ? 'done' : ''}"></div>
                <div class="track-step">
                  <div class="track-dot ${order.status == 'PROCESSING' or order.status == 'SHIPPED' ? 'done' : ''}"></div>
                  <div class="track-label ${order.status == 'PROCESSING' or order.status == 'SHIPPED' ? 'done' : ''}">Processing</div>
                </div>
                <div class="track-line ${order.status == 'SHIPPED' ? 'done' : ''}"></div>
                <div class="track-step">
                  <div class="track-dot ${order.status == 'SHIPPED' ? 'active' : ''}"></div>
                  <div class="track-label ${order.status == 'SHIPPED' ? 'active' : ''}">Shipped</div>
                </div>
                <div class="track-line"></div>
                <div class="track-step">
                  <div class="track-dot"></div>
                  <div class="track-label">Delivered</div>
                </div>
              </div>
            </div>
          </c:if>

          <!-- CARD FOOTER -->
          <div class="order-footer">
            <div class="order-total">Rs <c:out value="${order.total}"/></div>
            <div class="order-actions">
              <a class="btn btn-ghost"
                 href="${pageContext.request.contextPath}/OrderController?action=viewOrder&orderId=${order.orderId}">
                View details
              </a>
              <c:choose>
                <c:when test="${order.status == 'DELIVERED'}">
                  <a class="btn btn-outline"
                     href="${pageContext.request.contextPath}/user/review.jsp?orderId=${order.orderId}">
                    Leave review
                  </a>
                </c:when>
                <c:otherwise>
                  <a class="btn btn-outline"
                     href="${pageContext.request.contextPath}/OrderController?action=trackOrder&orderId=${order.orderId}">
                    Track order
                  </a>
                </c:otherwise>
              </c:choose>
            </div>
          </div>

        </div>
      </c:forEach>
    </c:when>

    <%-- Static fallback for UI milestone / no orders --%>
    <c:otherwise>

      <!-- ORDER CARD 1 -->
      <div class="order-card">
        <div class="order-header">
          <div class="order-meta">
            <div class="order-id">Order #1042</div>
            <div class="order-date">April 3, 2025 &middot; Rs 3,550 &middot; 4 items</div>
          </div>
          <span class="badge badge-shipped">Shipped</span>
        </div>
        <div class="order-items">
          <div class="order-item-thumb">
            <div class="item-img" style="background:#EAF3DE;">
              <img src="${pageContext.request.contextPath}/images/il_570xN.6426055539_90y2.jpg" alt="Illam First Flush">
            </div>
            <div class="item-info">
              <div class="item-name">Illam First Flush</div>
              <div class="item-qty">&times; 2 &middot; Rs 1,700</div>
            </div>
          </div>
          <div class="order-item-thumb">
            <div class="item-img" style="background:#FAEEDA;">
              <img src="${pageContext.request.contextPath}/images/9a5609c0471d2c0906e97d04a7239936.jpg" alt="Silver Needle White">
            </div>
            <div class="item-info">
              <div class="item-name">Silver Needle White</div>
              <div class="item-qty">&times; 1 &middot; Rs 1,200</div>
            </div>
          </div>
          <div class="order-item-thumb">
            <div class="item-img" style="background:#E8F0EB;">
              <img src="${pageContext.request.contextPath}/images/Picsart_26-04-14_15-39-49-366.jpg" alt="Himalayan Herbal Blend">
            </div>
            <div class="item-info">
              <div class="item-name">Himalayan Herbal Blend</div>
              <div class="item-qty">&times; 1 &middot; Rs 650</div>
            </div>
          </div>
        </div>
        <div class="tracking-bar">
          <div class="track-steps">
            <div class="track-step">
              <div class="track-dot done"></div>
              <div class="track-label done">Placed</div>
            </div>
            <div class="track-line done"></div>
            <div class="track-step">
              <div class="track-dot done"></div>
              <div class="track-label done">Processing</div>
            </div>
            <div class="track-line done"></div>
            <div class="track-step">
              <div class="track-dot active"></div>
              <div class="track-label active">Shipped</div>
            </div>
            <div class="track-line"></div>
            <div class="track-step">
              <div class="track-dot"></div>
              <div class="track-label">Delivered</div>
            </div>
          </div>
        </div>
        <div class="order-footer">
          <div class="order-total">Rs 3,550</div>
          <div class="order-actions">
            <a class="btn btn-ghost" href="#">View details</a>
            <a class="btn btn-outline" href="#">Track order</a>
          </div>
        </div>
      </div>

      <!-- ORDER CARD 2 -->
      <div class="order-card">
        <div class="order-header">
          <div class="order-meta">
            <div class="order-id">Order #1035</div>
            <div class="order-date">March 18, 2025 &middot; Rs 1,200 &middot; 1 item</div>
          </div>
          <span class="badge badge-delivered">Delivered</span>
        </div>
        <div class="order-items">
          <div class="order-item-thumb">
            <div class="item-img" style="background:#FAEEDA;">
              <img src="${pageContext.request.contextPath}/images/9a5609c0471d2c0906e97d04a7239936.jpg" alt="Silver Needle White Tea">
            </div>
            <div class="item-info">
              <div class="item-name">Silver Needle White Tea</div>
              <div class="item-qty">&times; 1 &middot; Rs 1,200</div>
            </div>
          </div>
        </div>
        <div class="order-footer">
          <div class="order-total">Rs 1,200</div>
          <div class="order-actions">
            <a class="btn btn-ghost" href="#">View details</a>
            <a class="btn btn-outline" href="#">Leave review</a>
          </div>
        </div>
      </div>

      <!-- ORDER CARD 3 -->
      <div class="order-card">
        <div class="order-header">
          <div class="order-meta">
            <div class="order-id">Order #1028</div>
            <div class="order-date">February 4, 2025 &middot; Rs 850 &middot; 1 item</div>
          </div>
          <span class="badge badge-delivered">Delivered</span>
        </div>
        <div class="order-items">
          <div class="order-item-thumb">
            <div class="item-img" style="background:#EAF3DE;">
              <img src="${pageContext.request.contextPath}/images/il_570xN.6426055539_90y2.jpg" alt="Illam First Flush Darjeeling">
            </div>
            <div class="item-info">
              <div class="item-name">Illam First Flush Darjeeling</div>
              <div class="item-qty">&times; 1 &middot; Rs 850</div>
            </div>
          </div>
        </div>
        <div class="order-footer">
          <div class="order-total">Rs 850</div>
          <div class="order-actions">
            <a class="btn btn-ghost" href="#">View details</a>
            <a class="btn btn-outline" href="#">Leave review</a>
          </div>
        </div>
      </div>

    </c:otherwise>
  </c:choose>

</div>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${tea.name} – Hiroma</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/shop.css">
</head>
<body>

<nav class="navbar">
    <a href="${pageContext.request.contextPath}/home" class="nav-brand">H<span>/</span>ROMA</a>
    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/shop">Shop</a>
        <a href="${pageContext.request.contextPath}/about">About Us</a>
        <a href="${pageContext.request.contextPath}/contact">Contact</a>
    </div>
    <div class="nav-actions">
        <c:if test="${not empty sessionScope.loggedInUser}">
            <a href="${pageContext.request.contextPath}/dashboard">Account</a>
            <a href="${pageContext.request.contextPath}/wishlist">Wishlist</a>
        </c:if>
        <c:if test="${empty sessionScope.loggedInUser}">
            <a href="${pageContext.request.contextPath}/login">Login</a>
        </c:if>
    </div>
</nav>

<div class="detail-wrapper">

    <!-- BREADCRUMB -->
    <p class="breadcrumb">
        <a href="${pageContext.request.contextPath}/shop">Home</a> /
        <a href="${pageContext.request.contextPath}/shop?categoryId=${tea.categoryId}">${tea.categoryName}</a> /
        ${tea.name}
    </p>

    <c:if test="${not empty param.success}">
        <div class="alert-inline alert-success">${param.success}</div>
    </c:if>

    <div class="detail-grid">
        <!-- LEFT: image -->
        <div class="detail-img-wrap">
            <div class="detail-img-placeholder">
                <span>${fn:substring(tea.name,0,1)}</span>
            </div>
        </div>

        <!-- RIGHT: info -->
        <div class="detail-info">
            <p class="detail-brand">${tea.brandName} · ${tea.categoryName}</p>
            <h1 class="detail-name">${tea.name}</h1>
            <p class="detail-desc">${tea.description}</p>

            <div class="detail-meta">
                <div class="meta-item">
                    <span class="meta-label">CATEGORY</span>
                    <span class="meta-val">${tea.categoryName}</span>
                </div>
                <div class="meta-item">
                    <span class="meta-label">STOCK</span>
                    <span class="meta-val">${tea.stock} units</span>
                </div>
            </div>

            <p class="detail-price">Rs. <fmt:formatNumber value="${tea.price}" pattern="#,##0"/></p>

            <div class="detail-actions">
                <c:choose>
                    <c:when test="${not empty sessionScope.loggedInUser}">
                        <form action="${pageContext.request.contextPath}/wishlist" method="post" style="display:inline">
                            <input type="hidden" name="action" value="add"/>
                            <input type="hidden" name="teaId" value="${tea.id}"/>
                            <input type="hidden" name="redirect" value="wishlist"/>
                            <button type="submit" class="btn-wishlist-lg">♡ ADD TO WISHLIST</button>
                        </form>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/login" class="btn-wishlist-lg">Login to add to wishlist</a>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="detail-badges">
                <span>Organic certified</span>
                <span>Free delivery over Rs. 2,000</span>
                <span>7-day return policy</span>
            </div>
        </div>
    </div>

    <!-- REVIEWS -->
    <div class="reviews-section">
        <div class="reviews-header">
            <div>
                <p class="reviews-label">— REVIEWS</p>
                <h2>What customers say</h2>
            </div>
            <c:if test="${not empty sessionScope.loggedInUser}">
                <a href="#write-review" class="btn-write-review">WRITE A REVIEW</a>
            </c:if>
        </div>

        <div class="reviews-grid">
            <c:choose>
                <c:when test="${empty reviews}">
                    <p style="color:#aaa;font-size:0.85rem">No reviews yet. Be the first to review!</p>
                </c:when>
                <c:otherwise>
                    <c:forEach var="review" items="${reviews}">
                        <div class="review-card">
                            <div class="review-top">
                                <strong>${review.fullName}</strong>
                                <span class="review-stars">
                                    <c:forEach begin="1" end="${review.rating}" var="i">★</c:forEach>
                                </span>
                            </div>
                            <p class="review-comment">${review.comment}</p>
                            <p class="review-date">${review.createdAt}</p>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>

        <!-- Write Review Form -->
        <c:if test="${not empty sessionScope.loggedInUser}">
            <div class="write-review-form" id="write-review">
                <h3>Write a review</h3>
                <form action="${pageContext.request.contextPath}/review" method="post">
                    <input type="hidden" name="productId" value="${tea.id}"/>
                    <div class="field-group">
                        <label>RATING *</label>
                        <select name="rating" required>
                            <option value="5">★★★★★ Excellent</option>
                            <option value="4">★★★★ Good</option>
                            <option value="3">★★★ Average</option>
                            <option value="2">★★ Poor</option>
                            <option value="1">★ Terrible</option>
                        </select>
                    </div>
                    <div class="field-group">
                        <label>YOUR REVIEW *</label>
                        <textarea name="comment" rows="4" placeholder="Share your experience with this tea..." required></textarea>
                    </div>
                    <button type="submit" class="btn-primary-form">PUBLISH MY REVIEW</button>
                </form>
            </div>
        </c:if>
    </div>
</div>

<footer class="footer">
    <div class="footer-brand">H<span>/</span>ROMA</div>
    <p class="footer-copy">© 2025 Hiroma Tea. All rights reserved.</p>
</footer>

</body>
</html>

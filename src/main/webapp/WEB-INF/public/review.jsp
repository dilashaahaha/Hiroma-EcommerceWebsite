<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Write a Review - H/ROMA</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/review.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>

    <nav class="navbar">
        <div class="nav-logo">H/ROMA</div>
        <ul class="nav-links">
            <li><a href="${pageContext.request.contextPath}/ProductController">SHOP</a></li>
            <li><a href="${pageContext.request.contextPath}/ProductController?category=all">COLLECTIONS</a></li>
            <li><a href="${pageContext.request.contextPath}/user/home.jsp#about">ABOUT US</a></li>
            <li><a href="${pageContext.request.contextPath}/user/home.jsp#brands">BRANDS</a></li>
        </ul>
        <div class="nav-actions">
            <c:choose>
                <c:when test="${not empty sessionScope.user}">
                    <a href="${pageContext.request.contextPath}/user/profile.jsp" class="nav-account">ACCOUNT</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/authentication/login.jsp" class="nav-account">ACCOUNT</a>
                </c:otherwise>
            </c:choose>
            <a href="${pageContext.request.contextPath}/CartController" class="nav-cart">
                CART (<c:out value="${empty sessionScope.cartCount ? 0 : sessionScope.cartCount}"/>)
            </a>
        </div>
    </nav>

    <div class="review-hero">
        <a href="${pageContext.request.contextPath}/ProductDetailController?id=${product.productId}" class="back-link">
            <i class="fas fa-arrow-left"></i> BACK TO PRODUCT
        </a>
        <p class="hero-label">— SHARE YOUR EXPERIENCE</p>
        <h1 class="hero-title">Write a <em>review</em></h1>
    </div>

    <%-- Show error if rating was missing --%>
    <c:if test="${param.error == 'rating'}">
        <div class="error-banner">
            Please select a star rating before submitting.
        </div>
    </c:if>

    <div class="review-main">

        <div class="review-form-section">

            <%-- DYNAMIC PRODUCT CARD FROM DB --%>
            <c:if test="${not empty product}">
                <div class="product-card">
                    <div class="product-img">
                        <img src="${pageContext.request.contextPath}/images/${product.imageFile}"
                             alt="${product.name}">
                    </div>
                    <div class="product-details">
                        <span class="product-origin">
                            <c:out value="${product.origin}"/>
                        </span>
                        <h3 class="product-name">
                            <c:out value="${product.name}"/>
                        </h3>
                        <p class="product-sub">
                            <c:out value="${product.brand}"/> &bull; <c:out value="${product.weight}"/>
                        </p>
                    </div>
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/review" method="post">
                <input type="hidden" name="productId" value="${product.productId}">

                <div class="form-group">
                    <label class="form-label">OVERALL RATING <span class="required">*</span></label>
                    <div class="star-rating" id="overallRating">
                        <span class="star" data-value="1">&#9733;</span>
                        <span class="star" data-value="2">&#9733;</span>
                        <span class="star" data-value="3">&#9733;</span>
                        <span class="star" data-value="4">&#9733;</span>
                        <span class="star" data-value="5">&#9733;</span>
                    </div>
                    <p class="rating-hint">Tap a star to rate</p>
                    <input type="hidden" name="overall_rating" id="overallRatingValue" value="0">
                </div>

                <div class="form-group">
                    <label class="form-label">RATE SPECIFIC ASPECTS</label>
                    <div class="aspects-grid">
                        <div class="aspect">
                            <span class="aspect-label">AROMA</span>
                            <div class="star-rating aspect-stars" id="aromaRating">
                                <span class="star" data-value="1">&#9733;</span>
                                <span class="star" data-value="2">&#9733;</span>
                                <span class="star" data-value="3">&#9733;</span>
                                <span class="star" data-value="4">&#9733;</span>
                                <span class="star" data-value="5">&#9733;</span>
                            </div>
                            <input type="hidden" name="aroma_rating" id="aromaRatingValue" value="0">
                        </div>
                        <div class="aspect">
                            <span class="aspect-label">FLAVOUR</span>
                            <div class="star-rating aspect-stars" id="flavourRating">
                                <span class="star" data-value="1">&#9733;</span>
                                <span class="star" data-value="2">&#9733;</span>
                                <span class="star" data-value="3">&#9733;</span>
                                <span class="star" data-value="4">&#9733;</span>
                                <span class="star" data-value="5">&#9733;</span>
                            </div>
                            <input type="hidden" name="flavour_rating" id="flavourRatingValue" value="0">
                        </div>
                        <div class="aspect">
                            <span class="aspect-label">PACKAGING</span>
                            <div class="star-rating aspect-stars" id="packagingRating">
                                <span class="star" data-value="1">&#9733;</span>
                                <span class="star" data-value="2">&#9733;</span>
                                <span class="star" data-value="3">&#9733;</span>
                                <span class="star" data-value="4">&#9733;</span>
                                <span class="star" data-value="5">&#9733;</span>
                            </div>
                            <input type="hidden" name="packaging_rating" id="packagingRatingValue" value="0">
                        </div>
                        <div class="aspect">
                            <span class="aspect-label">VALUE FOR MONEY</span>
                            <div class="star-rating aspect-stars" id="valueRating">
                                <span class="star" data-value="1">&#9733;</span>
                                <span class="star" data-value="2">&#9733;</span>
                                <span class="star" data-value="3">&#9733;</span>
                                <span class="star" data-value="4">&#9733;</span>
                                <span class="star" data-value="5">&#9733;</span>
                            </div>
                            <input type="hidden" name="value_rating" id="valueRatingValue" value="0">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label" for="reviewTitle">REVIEW TITLE</label>
                    <input type="text" id="reviewTitle" name="review_title"
                           placeholder="Give your review a headline...">
                </div>

                <div class="tips-box">
                    <p class="tips-heading">
                        <i class="fas fa-lightbulb"></i> TIPS FOR A GREAT REVIEW
                    </p>
                    <ul class="tips-list">
                        <li>Describe how the tea tasted, smelled and looked when brewed</li>
                        <li>Mention the brewing method you used (temperature, steep time)</li>
                        <li>Share if it matched the product description</li>
                        <li>Keep it honest — your experience helps other tea lovers</li>
                    </ul>
                </div>

                <div class="form-group">
                    <label class="form-label" for="reviewBody">
                        YOUR REVIEW <span class="required">*</span>
                    </label>
                    <textarea id="reviewBody" name="review_body" rows="6"
                        maxlength="1000"
                        placeholder="Share your experience with this tea. What did it taste like? How did it brew? Would you recommend it?"
                        oninput="updateCharCount(this)" required></textarea>
                    <p class="char-count"><span id="charCount">0</span> / 1000 characters</p>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn-publish">
                        <i class="fas fa-paper-plane"></i> PUBLISH MY REVIEW
                    </button>
                    <a href="${pageContext.request.contextPath}/ProductDetailController?id=${product.productId}"
                       class="btn-cancel">
                        <i class="fas fa-times"></i> CANCEL
                    </a>
                </div>

            </form>
        </div>

        <aside class="review-sidebar">

            <%-- RECENT REVIEWS FROM DB --%>
            <div class="sidebar-card">
                <h3 class="sidebar-heading">Recent reviews</h3>
                <c:choose>
                    <c:when test="${not empty reviews}">
                        <c:forEach var="r" items="${reviews}">
                            <div class="review-item">
                                <div class="review-meta">
                                    <span class="reviewer-name">User #<c:out value="${r.userId}"/></span>
                                    <span class="review-date"><c:out value="${r.createdAt}"/></span>
                                </div>
                                <div class="review-stars">
                                    <c:forEach begin="1" end="${r.rating}">&#9733;</c:forEach>
                                </div>
                                <p class="review-text"><c:out value="${r.comment}"/></p>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p class="no-reviews">No reviews yet. Be the first!</p>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="sidebar-card">
                <h3 class="sidebar-heading">Review guidelines</h3>
                <ul class="guidelines-list">
                    <li class="guideline-ok"><i class="fas fa-check"></i> Share your honest and personal experience</li>
                    <li class="guideline-ok"><i class="fas fa-check"></i> Focus on the product, not delivery speed</li>
                    <li class="guideline-no"><i class="fas fa-times"></i> No promotional content or advertisements</li>
                    <li class="guideline-no"><i class="fas fa-times"></i> No offensive or inappropriate language</li>
                    <li class="guideline-no"><i class="fas fa-times"></i> Reviews must be for your own purchase</li>
                </ul>
            </div>

        </aside>
    </div>

    <script>
        function updateCharCount(textarea) {
            document.getElementById('charCount').textContent = textarea.value.length;
        }
        function initStarRating(containerId, hiddenInputId) {
            var container = document.getElementById(containerId);
            if (!container) return;
            var stars = container.querySelectorAll('.star');
            var hidden = document.getElementById(hiddenInputId);
            stars.forEach(function(star) {
                star.addEventListener('click', function () {
                    var val = this.getAttribute('data-value');
                    hidden.value = val;
                    stars.forEach(function(s) {
                        s.classList.toggle('selected', s.getAttribute('data-value') <= val);
                    });
                });
                star.addEventListener('mouseover', function () {
                    var val = this.getAttribute('data-value');
                    stars.forEach(function(s) {
                        s.classList.toggle('hovered', s.getAttribute('data-value') <= val);
                    });
                });
                star.addEventListener('mouseout', function () {
                    stars.forEach(function(s) { s.classList.remove('hovered'); });
                });
            });
        }
        initStarRating('overallRating', 'overallRatingValue');
        initStarRating('aromaRating', 'aromaRatingValue');
        initStarRating('flavourRating', 'flavourRatingValue');
        initStarRating('packagingRating', 'packagingRatingValue');
        initStarRating('valueRating', 'valueRatingValue');
    </script>

</body>
</html>
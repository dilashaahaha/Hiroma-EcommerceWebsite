<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Write a Review - H/ROMA</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/review.css">
</head>
<body>

    <!-- ===== NAVBAR ===== -->
    <nav class="navbar">
        <div class="nav-logo">H/ROMA</div>
        <ul class="nav-links">
            <li><a href="${pageContext.request.contextPath}/shop">SHOP</a></li>
            <li><a href="${pageContext.request.contextPath}/collections">COLLECTIONS</a></li>
            <li><a href="${pageContext.request.contextPath}/about">ABOUT US</a></li>
            <li><a href="${pageContext.request.contextPath}/brands">BRANDS</a></li>
            <li><a href="${pageContext.request.contextPath}/contact">CONTACT US</a></li>
        </ul>
        <div class="nav-actions">
            <a href="${pageContext.request.contextPath}/account" class="nav-account">ACCOUNT</a>
            <a href="${pageContext.request.contextPath}/cart" class="nav-cart">CART (0)</a>
        </div>
    </nav>

    <!-- ===== HERO BANNER ===== -->
    <div class="review-hero">
        <a href="${pageContext.request.contextPath}/orders" class="back-link">&#8592; BACK TO ORDERS</a>
        <p class="hero-label">— SHARE YOUR EXPERIENCE</p>
        <h1 class="hero-title">Write a <em>review</em></h1>
    </div>

    <!-- ===== MAIN LAYOUT ===== -->
    <div class="review-main">

        <!-- LEFT: Review Form -->
        <div class="review-form-section">

            <!-- Product Card -->
            <div class="product-card">
                <div class="product-img">
                <img src="${pageContext.request.contextPath}/images/illamflush.jpeg" 
             		alt="Illam First Flush"
             		style="width:100%; height:100%; object-fit:cover;">
                </div>
                <div class="product-details">
                    <span class="product-origin">ILLAM &bull; KOSHI PROVINCE</span>
                    <h3 class="product-name">Illam First Flush</h3>
                    <p class="product-sub">Illam Tea Estate &bull; 100g</p>
                </div>
                <div class="product-order">
                    <span class="order-label">FROM ORDER</span>
                    <span class="order-id">#1028</span>
                    <span class="order-date">Feb 4, 2025</span>
                </div>
            </div>

            <!-- Review Form -->
            <form action="${pageContext.request.contextPath}/submitReview" method="post">

                <!-- Overall Rating -->
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

                <!-- Specific Aspects -->
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

                <!-- Review Title -->
                <div class="form-group">
                    <label class="form-label" for="reviewTitle">REVIEW TITLE</label>
                    <input type="text" id="reviewTitle" name="review_title" placeholder="Give your review a headline...">
                </div>

                <!-- Tips -->
                <div class="tips-box">
                    <p class="tips-heading">&#8227; TIPS FOR A GREAT REVIEW</p>
                    <ul class="tips-list">
                        <li>Describe how the tea tasted, smelled and looked when brewed</li>
                        <li>Mention the brewing method you used (temperature, steep time)</li>
                        <li>Share if it matched the product description</li>
                        <li>Keep it honest — your experience helps other tea lovers</li>
                    </ul>
                </div>

                <!-- Review Body -->
                <div class="form-group">
                    <label class="form-label" for="reviewBody">YOUR REVIEW <span class="required">*</span></label>
                    <textarea id="reviewBody" name="review_body" rows="6"
                        maxlength="1000"
                        placeholder="Share your experience with this tea. What did it taste like? How did it brew? Would you recommend it?"
                        oninput="updateCharCount(this)" required></textarea>
                    <p class="char-count"><span id="charCount">0</span> / 1000 characters</p>
                </div>

                <!-- Photo Upload -->
                <div class="form-group">
                    <label class="form-label">ADD PHOTOS <span class="optional">(optional)</span></label>
                    <div class="photo-upload">
                        <span class="upload-icon">+</span>
                        <p class="upload-text">Upload photos of your brew</p>
                        <p class="upload-hint">JPG, PNG up to 5MB each &bull; Max 4 photos</p>
                    </div>
                </div>

                <!-- Submit -->
                <div class="form-actions">
                    <button type="submit" class="btn-publish">PUBLISH MY REVIEW</button>
                    <a href="${pageContext.request.contextPath}/orders" class="btn-cancel">CANCEL</a>
                </div>

            </form>
        </div>

        <!-- RIGHT: Sidebar -->
        <aside class="review-sidebar">

            <!-- Community Rating -->
            <div class="sidebar-card">
                <h3 class="sidebar-heading">Community rating</h3>
                <div class="community-rating">
                    <span class="big-rating">4.9</span>
                    <div class="rating-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
                    <p class="rating-base">Based on 48 reviews</p>
                </div>
                <div class="rating-bars">
                    <div class="bar-row"><span>5 &#9733;</span><div class="bar"><div class="bar-fill" style="width:90%"></div></div><span>39</span></div>
                    <div class="bar-row"><span>4 &#9733;</span><div class="bar"><div class="bar-fill" style="width:15%"></div></div><span>6</span></div>
                    <div class="bar-row"><span>3 &#9733;</span><div class="bar"><div class="bar-fill" style="width:6%"></div></div><span>2</span></div>
                    <div class="bar-row"><span>2 &#9733;</span><div class="bar"><div class="bar-fill" style="width:2%"></div></div><span>1</span></div>
                    <div class="bar-row"><span>1 &#9733;</span><div class="bar"><div class="bar-fill" style="width:0%"></div></div><span>0</span></div>
                </div>
            </div>

            <!-- Recent Reviews -->
            <div class="sidebar-card">
                <h3 class="sidebar-heading">Recent reviews</h3>
                <div class="review-item">
                    <div class="review-meta"><span class="reviewer-name">Priya S.</span><span class="review-date">Mar 28</span></div>
                    <div class="review-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
                    <p class="review-text">Absolutely beautiful tea. The muscatel notes are unmistakable and the brew is so clear and golden.</p>
                </div>
                <div class="review-item">
                    <div class="review-meta"><span class="reviewer-name">Binod R.</span><span class="review-date">Apr 1</span></div>
                    <div class="review-stars">&#9733;&#9733;&#9733;&#9733;&#9734;</div>
                    <p class="review-text">Great tea, very fresh and aromatic. Shipping was fast and packaging excellent.</p>
                </div>
                <div class="review-item">
                    <div class="review-meta"><span class="reviewer-name">Meera T.</span><span class="review-date">Apr 3</span></div>
                    <div class="review-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
                    <p class="review-text">The best Darjeeling I've had from Nepal. Delicate, floral, and completely worth the price.</p>
                </div>
            </div>

            <!-- Review Guidelines -->
            <div class="sidebar-card">
                <h3 class="sidebar-heading">Review guidelines</h3>
                <ul class="guidelines-list">
                    <li class="guideline-ok">&#10003; Share your honest and personal experience</li>
                    <li class="guideline-ok">&#10003; Focus on the product, not delivery speed</li>
                    <li class="guideline-no">&#10005; No promotional content or advertisements</li>
                    <li class="guideline-no">&#10005; No offensive or inappropriate language</li>
                    <li class="guideline-no">&#10005; Reviews must be for your own purchase</li>
                </ul>
            </div>

        </aside>
    </div>

    <script>
        // Character counter
        function updateCharCount(textarea) {
            document.getElementById('charCount').textContent = textarea.value.length;
        }

        // Star rating handler
        function initStarRating(containerId, hiddenInputId) {
            const container = document.getElementById(containerId);
            if (!container) return;
            const stars = container.querySelectorAll('.star');
            const hidden = document.getElementById(hiddenInputId);

            stars.forEach(star => {
                star.addEventListener('click', function () {
                    const val = this.getAttribute('data-value');
                    hidden.value = val;
                    stars.forEach(s => {
                        s.classList.toggle('selected', s.getAttribute('data-value') <= val);
                    });
                });

                star.addEventListener('mouseover', function () {
                    const val = this.getAttribute('data-value');
                    stars.forEach(s => {
                        s.classList.toggle('hovered', s.getAttribute('data-value') <= val);
                    });
                });

                star.addEventListener('mouseout', function () {
                    stars.forEach(s => s.classList.remove('hovered'));
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
    
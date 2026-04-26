<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>H/ROMA - Pure Teas from the Himalayas</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/index.css">
</head>
<body>

    <!-- ===== NAVBAR ===== -->
    <nav class="navbar">
        <div class="nav-logo">H/ROMA</div>
        <ul class="nav-links">
            <li><a href="${pageContext.request.contextPath}/shop" class="active">SHOP</a></li>
            <li><a href="${pageContext.request.contextPath}/collections">COLLECTIONS</a></li>
            <li><a href="${pageContext.request.contextPath}/about">ABOUT US</a></li>
            <li><a href="${pageContext.request.contextPath}/brands">BRANDS</a></li>
            <li><a href="${pageContext.request.contextPath}/contact">CONTACT US</a></li>
        </ul>
        <div class="nav-actions">
            <a href="${pageContext.request.contextPath}/account" class="nav-account">ACCOUNT</a>
            <a href="${pageContext.request.contextPath}/cart" class="nav-cart">CART (2)</a>
        </div>
    </nav>

    <!-- ===== HERO SECTION ===== -->
    <section class="hero">
        <div class="hero-left">
            <p class="hero-label">— 100% NATURAL · FROM NEPAL</p>
            <h1 class="hero-title">Pure teas from the <span class="accent">Himalayas.</span></h1>
            <p class="hero-desc">Handpicked from the mountain gardens of Nepal.<br>Brewed for your body. Crafted for your soul.</p>
            <div class="hero-buttons">
                <a href="${pageContext.request.contextPath}/shop" class="btn-primary">SHOP NOW</a>
                <a href="${pageContext.request.contextPath}/collections" class="btn-secondary">BROWSE COLLECTIONS</a>
            </div>
        </div>
        <div class="hero-right">
            <div class="hero-img-circle">
                <img src="${pageContext.request.contextPath}/images/hero-himalaya.jpg"
                     alt="Himalayan mountains and tea"
                     onerror="this.style.background='#2d4a3a'">
            </div>
            <div class="hero-tags">
                <span class="hero-tag">ORGANIC</span>
                <span class="hero-tag">HANDPICKED</span>
                <span class="hero-tag">NEPAL</span>
            </div>
        </div>
    </section>

    <!-- ===== SHOP SECTION ===== -->
    <section class="shop-section">

        <!-- Search Bar -->
        <div class="search-bar">
            <span class="search-icon">&#128269;</span>
            <input type="text" placeholder="Search teas, herbs, blends..." id="searchInput" oninput="filterProducts()">
            <button class="search-btn">SEARCH</button>
        </div>

        <!-- Category Filter Tabs -->
        <div class="filter-tabs">
            <button class="filter-tab active" onclick="filterTab(this, 'all')">ALL</button>
            <button class="filter-tab" onclick="filterTab(this, 'green')">GREEN TEA</button>
            <button class="filter-tab" onclick="filterTab(this, 'herbal')">HERBAL</button>
            <button class="filter-tab" onclick="filterTab(this, 'black')">BLACK TEA</button>
            <button class="filter-tab" onclick="filterTab(this, 'detox')">DETOX</button>
            <button class="filter-tab" onclick="filterTab(this, 'wellness')">WELLNESS</button>
            <button class="filter-tab" onclick="filterTab(this, 'sleep')">SLEEP</button>
        </div>

        <!-- Product Grid -->
        <div class="product-grid" id="productGrid">

            <!-- Product 1 -->
            <div class="product-card" data-category="herbal">
                <div class="product-img-wrapper">
                    <img src="${pageContext.request.contextPath}/images/tea-tulsi.jpg"
                         alt="Tulsi Green Tea" class="product-img"
                         onerror="this.parentElement.style.background='#e8c87a'">
                    <span class="product-badge popular">POPULAR</span>
                </div>
                <div class="product-info">
                    <p class="product-origin">HIMALAYAN HERBS</p>
                    <h3 class="product-name">Tulsi Green Tea</h3>
                    <div class="product-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
                    <p class="product-weight">100g &middot; 50 cups</p>
                    <div class="product-footer">
                        <span class="product-price">Rs. 350</span>
                        <button class="btn-add" onclick="addToCart(this)">+ ADD</button>
                    </div>
                </div>
            </div>

            <!-- Product 2 -->
            <div class="product-card" data-category="herbal">
                <div class="product-img-wrapper">
                    <img src="${pageContext.request.contextPath}/images/tea-lavender.jpg"
                         alt="Lavender Sleep Blend" class="product-img"
                         onerror="this.parentElement.style.background='#c8a8d8'">
                    <span class="product-badge new">NEW</span>
                </div>
                <div class="product-info">
                    <p class="product-origin">NEPAL BLENDS</p>
                    <h3 class="product-name">Lavender Sleep Blend</h3>
                    <div class="product-stars">&#9733;&#9733;&#9733;&#9733;&#9734;</div>
                    <p class="product-weight">70g &middot; 35 cups</p>
                    <div class="product-footer">
                        <span class="product-price">Rs. 450</span>
                        <button class="btn-add" onclick="addToCart(this)">+ ADD</button>
                    </div>
                </div>
            </div>

            <!-- Product 3 -->
            <div class="product-card" data-category="herbal">
                <div class="product-img-wrapper">
                    <img src="${pageContext.request.contextPath}/images/tea-hibiscus.jpg"
                         alt="Hibiscus Tea Blend" class="product-img"
                         onerror="this.parentElement.style.background='#e87a8a'">
                    <span class="product-badge new">NEW</span>
                </div>
                <div class="product-info">
                    <p class="product-origin">NEPAL BLENDS</p>
                    <h3 class="product-name">Hibiscus Tea Blend</h3>
                    <div class="product-stars">&#9733;&#9733;&#9733;&#9733;&#9734;</div>
                    <p class="product-weight">70g &middot; 35 cups</p>
                    <div class="product-footer">
                        <span class="product-price">Rs. 450</span>
                        <button class="btn-add" onclick="addToCart(this)">+ ADD</button>
                    </div>
                </div>
            </div>

            <!-- Product 4 -->
            <div class="product-card" data-category="herbal wellness">
                <div class="product-img-wrapper">
                    <img src="${pageContext.request.contextPath}/images/tea-chamomile.jpg"
                         alt="Chamomile Dream" class="product-img"
                         onerror="this.parentElement.style.background='#e8d87a'">
                    <span class="product-badge new">NEW</span>
                </div>
                <div class="product-info">
                    <p class="product-origin">NEPAL BLENDS</p>
                    <h3 class="product-name">Chamomile Dream</h3>
                    <div class="product-stars">&#9733;&#9733;&#9733;&#9733;&#9734;</div>
                    <p class="product-weight">80g &middot; 40 cups</p>
                    <div class="product-footer">
                        <span class="product-price">Rs. 420</span>
                        <button class="btn-add" onclick="addToCart(this)">+ ADD</button>
                    </div>
                </div>
            </div>

            <!-- Product 5 -->
            <div class="product-card" data-category="green">
                <div class="product-img-wrapper">
                    <img src="${pageContext.request.contextPath}/images/tea-organic-green.jpg"
                         alt="Organic Green Tea" class="product-img"
                         onerror="this.parentElement.style.background='#7ac87a'">
                    <span class="product-badge organic">ORGANIC</span>
                </div>
                <div class="product-info">
                    <p class="product-origin">HIMALAYAN HERBS</p>
                    <h3 class="product-name">Organic Green Tea</h3>
                    <div class="product-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
                    <p class="product-weight">90g &middot; 45 cups</p>
                    <div class="product-footer">
                        <span class="product-price">Rs. 380</span>
                        <button class="btn-add" onclick="addToCart(this)">+ ADD</button>
                    </div>
                </div>
            </div>

        </div>
    </section>

    <!-- ===== FOOTER BANNER ===== -->
    <section class="footer-banner">
        <div class="footer-banner-left">
            <h2 class="footer-banner-title">From the mountains<br>to your <span class="accent">cup.</span></h2>
            <p class="footer-banner-desc">Every blend is sourced directly from farmers in the Himalayas. No middlemen. Pure quality.</p>
        </div>
        <div class="footer-banner-stats">
            <div class="stat">
                <span class="stat-number">50+</span>
                <span class="stat-label">TEA VARIETIES</span>
            </div>
            <div class="stat">
                <span class="stat-number">100%</span>
                <span class="stat-label">ORGANIC</span>
            </div>
            <div class="stat">
                <span class="stat-number">12k+</span>
                <span class="stat-label">CUSTOMERS</span>
            </div>
        </div>
    </section>

    <script>
        var cartCount = 2;

        function addToCart(btn) {
            cartCount++;
            document.querySelector('.nav-cart').textContent = 'CART (' + cartCount + ')';
            btn.textContent = '✓ ADDED';
            btn.classList.add('added');
            setTimeout(function() {
                btn.textContent = '+ ADD';
                btn.classList.remove('added');
            }, 1500);
        }

        function filterTab(el, category) {
            document.querySelectorAll('.filter-tab').forEach(t => t.classList.remove('active'));
            el.classList.add('active');

            const cards = document.querySelectorAll('.product-card');
            cards.forEach(card => {
                if (category === 'all' || card.dataset.category.includes(category)) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
        }

        function filterProducts() {
            const query = document.getElementById('searchInput').value.toLowerCase();
            document.querySelectorAll('.product-card').forEach(card => {
                const name = card.querySelector('.product-name').textContent.toLowerCase();
                card.style.display = name.includes(query) ? 'block' : 'none';
            });
        }
    </script>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>H/ROMA – Pure Himalayan Teas</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@300;400;500&display=swap" rel="stylesheet">
</head>
<body>

<!--NAVBAR -->
<header class="navbar">
    <div class="container flex-between">

        <a href="${pageContext.request.contextPath}/user/home.jsp" class="navbar-brand">
            H<span class="brand-slash">/</span>ROMA
        </a>

        <nav class="nav-links">
            <a href="${pageContext.request.contextPath}/user/product.jsp" class="nav-link active">SHOP</a>
            <a href="${pageContext.request.contextPath}/user/product.jsp?category=all" class="nav-link">COLLECTIONS</a>
            <a href="#about" class="nav-link">ABOUT US</a>
            <a href="#brands" class="nav-link">BRANDS</a>
            <a href="#contact" class="nav-link">CONTACT US</a>
        </nav>

        <div class="nav-right">
            <c:choose>
                <c:when test="${not empty sessionScope.user}">
                    <a href="${pageContext.request.contextPath}/user/profile.jsp" class="nav-account">ACCOUNT</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/user/login.jsp" class="nav-account">ACCOUNT</a>
                </c:otherwise>
            </c:choose>
            <a href="${pageContext.request.contextPath}/user/cart.jsp" class="nav-cart">
                CART (${empty sessionScope.cart ? 0 : fn:length(sessionScope.cart)})
            </a>
        </div>

    </div>
</header>


<!-- HERO SECTION -->
<section class="hero">
    <div class="container">
        <div class="hero-inner">

            <div class="hero-text">
                <p class="hero-eyebrow">&#8592; 100% NATURAL / FROM NEPAL</p>
                <h1>Pure teas from the <em>Himalayas.</em></h1>
                <p class="hero-subtitle">
                    Handpicked from the mountain gardens of Nepal.<br>
                    Brewed for your body. Crafted for your soul.
                </p>
                <div class="hero-buttons">
                    <a href="#shop" class="btn-primary">SHOP NOW</a>
                    <a href="${pageContext.request.contextPath}/user/product.jsp?category=all" class="btn-outline">BROWSE COLLECTIONS</a>
                </div>
            </div>

            <div class="hero-image">
                <div class="hero-img-placeholder">
  <img src="${pageContext.request.contextPath}/images/WhatsApp Image 2026-04-15 at 9.25.01 AM.jpeg" 
       alt="Himalayan Tea" class="hero-img-circle">
</div>
                <div class="hero-tags">
                    <span class="hero-tag">ORGANIC</span>
                    <span class="hero-tag">HANDPICKED</span>
                    <span class="hero-tag">NEPAL</span>
                </div>
            </div>

        </div>
    </div>
</section>


<!-- PRODUCT LIST SECTION -->
<section class="shop-section" id="shop">
    <div class="container">

        <%-- Flash messages set by controller --%>
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

        <!-- Search Bar -->
        <div class="search-row">
            <form class="search-form" method="GET"
                  action="${pageContext.request.contextPath}/user/home.jsp">
                <input
                    type="text"
                    name="search"
                    placeholder="Search teas, herbs, blends..."
                    value="${param.search}"
                    autocomplete="off"
                />
                <button type="submit" class="search-btn">SEARCH</button>
            </form>
        </div>

        <!-- Category Filter Tabs -->
        <c:set var="activeCategory" value="${empty param.category ? 'all' : param.category}"/>

        <div class="filter-tabs">
            <a href="home.jsp?category=all"
               class="filter-tab ${activeCategory == 'all' ? 'active' : ''}">ALL</a>
            <a href="home.jsp?category=green"
               class="filter-tab ${activeCategory == 'green' ? 'active' : ''}">GREEN TEA</a>
            <a href="home.jsp?category=herbal"
               class="filter-tab ${activeCategory == 'herbal' ? 'active' : ''}">HERBAL</a>
            <a href="home.jsp?category=black"
               class="filter-tab ${activeCategory == 'black' ? 'active' : ''}">BLACK TEA</a>
            <a href="home.jsp?category=detox"
               class="filter-tab ${activeCategory == 'detox' ? 'active' : ''}">DETOX</a>
            <a href="home.jsp?category=wellness"
               class="filter-tab ${activeCategory == 'wellness' ? 'active' : ''}">WELLNESS</a>
            <a href="home.jsp?category=sleep"
               class="filter-tab ${activeCategory == 'sleep' ? 'active' : ''}">SLEEP</a>
        </div>

        <!-- Product Grid -->
        <div class="products-grid">

            <c:choose>
                <c:when test="${not empty requestScope.productList}">
                    <c:forEach var="p" items="${requestScope.productList}">
                        <div class="product-card">
                            <div class="product-img-wrap">
                                <div class="product-img-emoji">&#9749;</div>
                            </div>
                            <div class="product-body">
                                <p class="product-origin"><c:out value="${p.origin}"/></p>
                                <span class="badge badge-new">NEW</span>
                                <p class="product-name"><c:out value="${p.name}"/></p>
                                <div class="stars">&#9733;&#9733;&#9733;&#9733;&#9734;</div>
                                <p class="product-meta"><c:out value="${p.weight}"/> &bull; <c:out value="${p.cups}"/> cups</p>
                                <div class="product-footer">
                                    <span class="product-price">
                                        <span class="currency">Rs.</span> <c:out value="${p.price}"/>
                                    </span>
                                    <form method="POST" action="${pageContext.request.contextPath}/cart">
                                        <input type="hidden" name="action" value="add"/>
                                        <input type="hidden" name="productId" value="${p.id}"/>
                                        <button type="submit" class="btn-add">+ ADD</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>

                <c:otherwise>
                    <!-- Card 1: Tulsi Green Tea -->
<div class="product-card">
    <div class="product-img-wrap">
        <img src="${pageContext.request.contextPath}/images/WhatsApp Image 2026-04-15 at 9.23.41 AM.jpeg" alt="Tulsi Green Tea">
        <span class="card-sale-tag">5 OFF</span>
    </div>

    <div class="product-body">
        <p class="product-origin">HIMALAYAN HERBS</p>
        <span class="badge badge-popular">POPULAR</span>
        <p class="product-name">Tulsi Green Tea</p>
        <div class="stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
        <p class="product-meta">100g &bull; 50 cups</p>
        <div class="product-footer">
            <span class="product-price"><span class="currency">Rs.</span> 350</span>
            <form method="POST" action="${pageContext.request.contextPath}/cart">
                <input type="hidden" name="action" value="add"/>
                <input type="hidden" name="productId" value="1"/>
                <button type="submit" class="btn-add">+ ADD</button>
            </form>
        </div>
    </div>
</div>
                    <!-- Card 2: Lavender Sleep Blend -->
 <div class="product-card">
    <div class="product-img-wrap">
        <img src="${pageContext.request.contextPath}/images/WhatsApp Image 2026-04-15 at 11.00.04 AM.jpeg" alt="Lavender Sleep Blend">
    </div>
    <div class="product-body">
        <p class="product-origin">NEPAL BLENDS</p>
        <span class="badge badge-new">NEW</span>
        <p class="product-name">Lavender Sleep Blend</p>
        <div class="stars">&#9733;&#9733;&#9733;&#9733;&#9734;</div>
        <p class="product-meta">70g &bull; 35 cups</p>
        <div class="product-footer">
            <span class="product-price"><span class="currency">Rs.</span> 450</span>
            <form method="POST" action="${pageContext.request.contextPath}/cart">
                <input type="hidden" name="action" value="add"/>
                <input type="hidden" name="productId" value="2"/>
                <button type="submit" class="btn-add">+ ADD</button>
            </form>
        </div>
    </div>
</div>

                    <!-- Card 3: Hibiscus Tea Blend -->
                    <div class="product-card">
                        <div class="product-img-wrap">
                            <img src="${pageContext.request.contextPath}/images/WhatsApp Image 2026-04-15 at 11.00.07 AM.jpeg" alt="Hibiscus Tea Blend">
                        </div>
                        <div class="product-body">
                            <p class="product-origin">NEPAL BLENDS</p>
                            <span class="badge badge-new">NEW</span>
                            <p class="product-name">Hibiscus Tea Blend</p>
                            <div class="stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
                            <p class="product-meta">70g &bull; 30 cups</p>
                            <div class="product-footer">
                                <span class="product-price"><span class="currency">Rs.</span> 450</span>
                                <form method="POST" action="${pageContext.request.contextPath}/cart">
                                    <input type="hidden" name="action" value="add"/>
                                    <input type="hidden" name="productId" value="3"/>
                                    <button type="submit" class="btn-add">+ ADD</button>
                                </form>
                            </div>
                        </div>
                    </div>

                    <!-- Card 4: Chamomile Dream -->
                    <div class="product-card">
                        <div class="product-img-wrap">
                            <img src="${pageContext.request.contextPath}/images/WhatsApp Image 2026-04-15 at 11.00.04 AM (1).jpeg" alt="Chamomile Dream">
                        </div>
                        <div class="product-body">
                            <p class="product-origin">NEPAL BLENDS</p>
                            <span class="badge badge-new">NEW</span>
                            <p class="product-name">Chamomile Dream</p>
                            <div class="stars">&#9733;&#9733;&#9733;&#9733;&#9734;</div>
                            <p class="product-meta">80g &bull; 40 cups</p>
                            <div class="product-footer">
                                <span class="product-price"><span class="currency">Rs.</span> 420</span>
                                <form method="POST" action="${pageContext.request.contextPath}/cart">
                                    <input type="hidden" name="action" value="add"/>
                                    <input type="hidden" name="productId" value="4"/>
                                    <button type="submit" class="btn-add">+ ADD</button>
                                </form>
                            </div>
                        </div>
                    </div>

                    <!-- Card 5: Organic Green Tea -->
                    <div class="product-card">
                        <div class="product-img-wrap">
                            <img src="${pageContext.request.contextPath}/images/WhatsApp Image 2026-04-15 at 11.00.05 AM.jpeg" alt="Organic Green Tea">
                        </div>
                        <div class="product-body">
                            <p class="product-origin">HIMALAYAN HERBS</p>
                            <span class="badge badge-organic">ORGANIC</span>
                            <p class="product-name">Organic Green Tea</p>
                            <div class="stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
                            <p class="product-meta">80g &bull; 45 cups</p>
                            <div class="product-footer">
                                <span class="product-price"><span class="currency">Rs.</span> 380</span>
                                <form method="POST" action="${pageContext.request.contextPath}/cart">
                                    <input type="hidden" name="action" value="add"/>
                                    <input type="hidden" name="productId" value="5"/>
                                    <button type="submit" class="btn-add">+ ADD</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>

        </div><!-- /products-grid -->
    </div><!-- /container -->
</section>


<!-- ===================================================
     TAGLINE / STATS STRIP
     =================================================== -->
<section class="tagline-strip">
    <div class="container">
        <div class="tagline-inner">
            <div class="tagline-text">
                <h2>From the mountains<br>to your <em>cup.</em></h2>
                <p>Every blend is sourced directly from farmers in the Himalayas. No middlemen. Pure quality.</p>
            </div>
            <div class="stats-row">
                <div class="stat-item">
                    <div class="stat-number">50+</div>
                    <div class="stat-label">Tea Varieties</div>
                </div>
                <div class="stat-item">
                    <div class="stat-number">100%</div>
                    <div class="stat-label">Organic</div>
                </div>
                <div class="stat-item">
                    <div class="stat-number">12k+</div>
                    <div class="stat-label">Customers</div>
                </div>
            </div>
        </div>
    </div>
</section>


<!-- ===================================================
     FOOTER
     =================================================== -->
<footer class="footer">
    <div class="container">
        <div class="footer-grid">

            <div class="footer-brand-col">
                <div class="footer-logo">H<span>/</span>ROMA</div>
                <p class="footer-tagline">
                    Pure herbal teas from the heart of the Himalayas.<br>
                    Bringing Nepal's finest blends to your doorstep.
                </p>
            </div>

            <div class="footer-col">
                <h4 class="footer-col-title">SHOP</h4>
                <ul class="footer-links">
                    <li><a href="home.jsp?category=green">Green Tea</a></li>
                    <li><a href="home.jsp?category=herbal">Herbal Blends</a></li>
                    <li><a href="home.jsp?category=black">Black Tea</a></li>
                    <li><a href="home.jsp?category=detox">Detox Teas</a></li>
                </ul>
            </div>

            <div class="footer-col">
                <h4 class="footer-col-title">ACCOUNT</h4>
                <ul class="footer-links">
                    <li><a href="${pageContext.request.contextPath}/user/profile.jsp">My Profile</a></li>
                    <li><a href="${pageContext.request.contextPath}/user/orders.jsp">My Orders</a></li>
                    <li><a href="${pageContext.request.contextPath}/user/cart.jsp">My Cart</a></li>
                    <li><a href="home.jsp#reviews">Reviews</a></li>
                </ul>
            </div>

            <div class="footer-col">
                <h4 class="footer-col-title">COMPANY</h4>
                <ul class="footer-links">
                    <li><a href="#about">About Us</a></li>
                    <li><a href="#contact">Contact</a></li>
                    <li><a href="#farmers">Our Farmers</a></li>
                </ul>
            </div>

        </div>
        <div class="footer-bottom">
            <p>&copy; 2025 Hiroma Tea. All rights reserved.</p>
            <p class="footer-made">Made in <strong>Nepal</strong> &#9749;</p>
        </div>
    </div>
</footer>

</body>
</html>

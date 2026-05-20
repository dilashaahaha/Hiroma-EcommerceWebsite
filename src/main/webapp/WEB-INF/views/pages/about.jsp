<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us – Hiroma</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/about.css">
</head>
<body>

<nav class="navbar">
    <a href="${pageContext.request.contextPath}/home" class="nav-brand">H<span>/</span>ROMA</a>
    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/shop">Shop</a>
        <a href="${pageContext.request.contextPath}/about" class="active">About Us</a>
        <a href="${pageContext.request.contextPath}/contact">Contact Us</a>
    </div>
    <div class="nav-actions">
        <c:choose>
            <c:when test="${not empty sessionScope.loggedInUser}">
                <a href="${pageContext.request.contextPath}/dashboard">Account</a>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/login">Login</a>
            </c:otherwise>
        </c:choose>
    </div>
</nav>

<!-- HERO -->
<section class="about-hero">
    <p class="about-label">— OUR STORY</p>
    <h1>Where the mountains<br>meet your <em>cup.</em></h1>
    <p class="about-hero-sub">Born from a love of Nepal's highlands and a belief that great tea should reach every home — Hiroma is a bridge between the ancient gardens of the Himalayas and the world.</p>
    <a href="${pageContext.request.contextPath}/shop" class="btn-outline-dark">DISCOVER OUR TEAS</a>
</section>

<!-- STORY SECTION -->
<section class="about-story">
    <div class="about-story-img"></div>
    <div class="about-story-text">
        <p class="about-label">— HOW IT BEGAN</p>
        <h2>A walk through<br>Ilam changed everything.</h2>
        <p>It started in 2019 when our founder, trekking through the tea gardens of Ilam, realized that the most extraordinary teas in Nepal rarely made it beyond the village market.</p>
        <p>We set out to change that — building direct relationships with small garden families, learning their craft, and bringing those flavors to people who would truly appreciate them.</p>
        <p>Every product in our collection is traceable, seasonal, and sourced with full transparency from the farmers who grow it.</p>
    </div>
</section>

<!-- VALUES -->
<section class="about-values">
    <p class="about-label" style="text-align:center">— WHAT WE STAND FOR</p>
    <h2 style="text-align:center;margin-bottom:2rem">Our values</h2>
    <div class="values-grid">
        <div class="value-card">
            <h3>Direct sourcing</h3>
            <p>We work directly with garden families in Ilam, Taplejung, and Dhankuta — no middlemen, fair prices, real relationships.</p>
        </div>
        <div class="value-card">
            <h3>Full transparency</h3>
            <p>Every product shows the garden, district, harvest season, and altitude. You know exactly where your tea comes from.</p>
        </div>
        <div class="value-card">
            <h3>Sustainable practice</h3>
            <p>Our partners follow organic and regenerative methods. We offset our delivery footprint and use minimal, recyclable packaging.</p>
        </div>
    </div>
</section>

<!-- CTA -->
<section class="about-cta">
    <div class="about-cta-left">
        <h2>Ready to find your<br>perfect <em>blend?</em></h2>
        <p>Browse our full collection of Himalayan teas. Free delivery on orders above Rs. 2,000.</p>
    </div>
    <div class="about-cta-right">
        <a href="${pageContext.request.contextPath}/shop" class="btn-cta-dark">SHOP THE COLLECTION</a>
        <a href="${pageContext.request.contextPath}/contact" class="btn-cta-outline">CONTACT OUR TEAM</a>
    </div>
</section>

<footer class="footer">
    <div class="footer-brand">H<span>/</span>ROMA</div>
    <p class="footer-copy">© 2025 Hiroma Tea. All rights reserved.</p>
</footer>

</body>
</html>

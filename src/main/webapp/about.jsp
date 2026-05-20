<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - H/ROMA</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/about.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>

    <!-- ===== NAVBAR ===== -->
    <nav class="navbar">
        <div class="nav-logo">H/ROMA</div>
        <ul class="nav-links">
            <li><a href="${pageContext.request.contextPath}/shop">SHOP</a></li>
            <li><a href="${pageContext.request.contextPath}/collections">COLLECTIONS</a></li>
            <li><a href="${pageContext.request.contextPath}/about" class="active">ABOUT US</a></li>
            <li><a href="${pageContext.request.contextPath}/brands">BRANDS</a></li>
            <li><a href="${pageContext.request.contextPath}/contact">CONTACT US</a></li>
        </ul>
        <div class="nav-actions">
            <a href="${pageContext.request.contextPath}/account" class="nav-account">ACCOUNT</a>
            <a href="${pageContext.request.contextPath}/cart" class="nav-cart">CART (0)</a>
        </div>
    </nav>

    <!-- ===== HERO SECTION ===== -->
    <section class="hero">
        <div class="hero-text">
            <p class="section-label">— OUR STORY</p>
            <h1 class="hero-title">Where the mountains<br>meet your <span class="accent">cup.</span></h1>
            <p class="hero-desc">Born from a love of Nepal's Highlands and a belief that great tea should reach every home — Hiroma is a bridge between the ancient gardens of the Himalayas and the world.</p>
            <a href="${pageContext.request.contextPath}/shop" class="btn-outline">
                <i class="fas fa-bag-shopping"></i> DISCOVER OUR TEAS
            </a>
        </div>
        <div class="hero-image">
            <img src="${pageContext.request.contextPath}/images/mountain.jpg"
                 alt="Himalayan mountains with tea cup"
                 class="hero-img"
                 onerror="this.style.display='none'">
        </div>
    </section>

    <!-- ===== STATS ===== -->
    <section class="stats">
        <div class="stat-item">
            <span class="stat-number">46+</span>
            <span class="stat-label">TEA VARIETIES</span>
        </div>
        <div class="stat-divider"></div>
        <div class="stat-item">
            <span class="stat-number">12</span>
            <span class="stat-label">GARDEN PARTNERS</span>
        </div>
        <div class="stat-divider"></div>
        <div class="stat-item">
            <span class="stat-number">2019</span>
            <span class="stat-label">EST. IN KATHMANDU</span>
        </div>
        <div class="stat-divider"></div>
        <div class="stat-item">
            <span class="stat-number">8</span>
            <span class="stat-label">DISTRICTS SOURCED</span>
        </div>
    </section>

    <!-- ===== STORY SECTION ===== -->
    <section class="story">
        <div class="story-image">
            <img src="${pageContext.request.contextPath}/images/illam.jpg"
                 alt="Ilam tea garden"
                 class="story-img"
                 onerror="this.style.background='#3a5a40'">
        </div>
        <div class="story-text">
            <p class="section-label">— HOW IT BEGAN</p>
            <h2 class="story-title">A walk through<br>Ilam changed everything.</h2>
            <p class="story-desc">It started in 2019 when our founder, trekking through the tea gardens of Ilam, realized that the most extraordinary teas in Nepal rarely made it beyond the village market.</p>
            <p class="story-desc">We set out to change that — building direct relationships with small garden families, learning their craft, and bringing those flavors to people who would truly appreciate them.</p>
            <p class="story-desc">Every product in our collection is traceable, seasonal, and sourced with full transparency from the farmers who grow it.</p>
        </div>
    </section>

    <!-- ===== VALUES SECTION ===== -->
    <section class="values">
        <p class="section-label centered">— WHAT WE STAND FOR</p>
        <h2 class="values-title">Our values</h2>
        <div class="values-grid">
            <div class="value-card">
                <i class="fas fa-handshake"></i>
                <h3 class="value-heading">Direct sourcing</h3>
                <p class="value-desc">We work directly with garden families in Ilam, Taplejung, and Dhankuta — no middlemen, fair prices, real relationships.</p>
            </div>
            <div class="value-card">
                <i class="fas fa-eye"></i>
                <h3 class="value-heading">Full transparency</h3>
                <p class="value-desc">Every product shows the garden, district, harvest season, and altitude. You know exactly where your tea comes from.</p>
            </div>
            <div class="value-card">
                <i class="fas fa-leaf"></i>
                <h3 class="value-heading">Sustainable practice</h3>
                <p class="value-desc">Our partners follow organic and regenerative methods. We offset our delivery footprint and use minimal, recyclable packaging.</p>
            </div>
        </div>
    </section>

    <!-- ===== TEAM SECTION ===== -->
    <section class="team">
        <p class="section-label centered">— THE PEOPLE BEHIND HIROMA</p>
        <h2 class="team-title">Meet the team</h2>
        <div class="team-grid">
            <div class="team-card">
                <img src="${pageContext.request.contextPath}/images/Dilasha.jpg"
                     alt="Dilasha Vaidya" class="team-img"
                     onerror="this.style.background='#c8b89a'; this.style.minHeight='180px'; this.style.display='block'">
                <div class="team-info">
                    <h4 class="team-name">Dilasha Vaidya</h4>
                    <span class="team-role"><i class="fas fa-star"></i> Founder</span>
                    <p class="team-desc">Raised in Kathmandu, Dilasha has personal ties to half our garden partners. She ensures quality at the source, every season.</p>
                </div>
            </div>
            <div class="team-card">
                <img src="${pageContext.request.contextPath}/images/Dibyani.jpg"
                     alt="Dibyani Basnet" class="team-img"
                     onerror="this.style.background='#c8b89a'; this.style.minHeight='180px'; this.style.display='block'">
                <div class="team-info">
                    <h4 class="team-name">Dibyani Basnet</h4>
                    <span class="team-role"><i class="fas fa-chart-line"></i> Director</span>
                    <p class="team-desc">Raised in Dharan, Dibyani has personal ties to half our garden partners. She ensures quality at the source, every season.</p>
                </div>
            </div>
            <div class="team-card">
                <img src="${pageContext.request.contextPath}/images/Prashansa.jpg"
                     alt="Prashansa Magar" class="team-img"
                     onerror="this.style.background='#c8b89a'; this.style.minHeight='180px'; this.style.display='block'">
                <div class="team-info">
                    <h4 class="team-name">Prashansa Magar</h4>
                    <span class="team-role"><i class="fas fa-clipboard-list"></i> Manager</span>
                    <p class="team-desc">Raised in Dharan, Prashansa has personal ties to half our garden partners. She ensures quality at the source, every season.</p>
                </div>
            </div>
            <div class="team-card">
                <img src="${pageContext.request.contextPath}/images/Brishika.jpg"
                     alt="Brishika Thapa Magar" class="team-img"
                     onerror="this.style.background='#c8b89a'; this.style.minHeight='180px'; this.style.display='block'">
                <div class="team-info">
                    <h4 class="team-name">Brishika Thapa Magar</h4>
                    <span class="team-role"><i class="fas fa-crown"></i> CEO</span>
                    <p class="team-desc">Raised in Kathmandu, Brishika has personal ties to half our garden partners. She ensures quality at the source, every season.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- ===== CTA SECTION ===== -->
    <section class="cta">
        <div class="cta-text">
            <h2 class="cta-title">Ready to find your<br>perfect <span class="accent">blend?</span></h2>
            <p class="cta-desc">Browse our full collection of Himalayan teas — filtered by mood, garden, or flavour. Free delivery on orders over Rs. 2,000.</p>
        </div>
        <div class="cta-buttons">
            <a href="${pageContext.request.contextPath}/shop" class="btn-gold">
                <i class="fas fa-bag-shopping"></i> SHOP THE COLLECTION
            </a>
            <a href="${pageContext.request.contextPath}/contact" class="btn-outline-white">
                <i class="fas fa-envelope"></i> CONTACT OUR TEAM
            </a>
        </div>
    </section>

    <!-- ===== FOOTER ===== -->
    <footer class="footer">
        <p>&copy; 2025 Hiroma Tea. All rights reserved.</p>
        <p>Crafted with care in Kathmandu, Nepal.</p>
    </footer>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hiroma — Himalayan Aroma · Nepal's Finest Teas</title>

    <!-- Global shared styles -->
    <link rel="stylesheet" href="css/global.css">

    <!-- Shared layout styles -->
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">

    <!-- Page-specific styles -->
    <style>
        /* ── HERO ──────────────────────────────────────────────── */
        .hero {
            min-height: 100vh;
            background: var(--green-deep);
            position: relative;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            justify-content: flex-end;
            padding: 0 48px 72px;
        }
        .hero-bg {
            position: absolute;
            inset: 0;
            background:
                radial-gradient(ellipse 60% 80% at 70% 30%, rgba(74, 124, 95, 0.35) 0%, transparent 70%),
                radial-gradient(ellipse 40% 60% at 20% 80%, rgba(200, 137, 58, 0.15) 0%, transparent 60%),
                var(--green-deep);
        }

        /* ── HERO CIRCLES (decorative + image) ─────────────────── */
        .hero-circles {
            position: absolute;
            top: 10%; right: 8%;
            width: 420px; height: 420px;
        }
        .hero-circles .c1 {
            position: absolute;
            width: 420px; height: 420px;
            border-radius: 50%;
            border: 1px solid rgba(200, 137, 58, 0.2);
        }
        .hero-circles .c2 {
            position: absolute;
            top: 40px; left: 40px;
            width: 340px; height: 340px;
            border-radius: 50%;
            background: radial-gradient(ellipse at 40% 40%, rgba(74, 124, 95, 0.5) 0%, rgba(26, 51, 40, 0.8) 70%);
            border: 1px solid rgba(200, 137, 58, 0.15);
            overflow: hidden;
        }
        /* Hero image fills the inner circle */
        .hero-circles .c2 img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            opacity: 0.75;
            border-radius: 50%;
        }
        .hero-circles .c3 {
            position: absolute;
            top: 90px; left: 90px;
            width: 240px; height: 240px;
            border-radius: 50%;
            border: 1px solid rgba(232, 184, 109, 0.3);
            pointer-events: none;
            /* subtle inner glow over the image */
            background: radial-gradient(ellipse at 35% 35%, rgba(200, 137, 58, 0.12), transparent 70%);
        }
        .hero-circles .leaf {
            position: absolute;
            top: 120px; left: 160px;
            font-size: 72px;
            transform: rotate(-20deg);
            opacity: 0.4;
            filter: hue-rotate(20deg);
            pointer-events: none;
        }

        .hero-tag {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            font-size: 11px;
            letter-spacing: 0.18em;
            text-transform: uppercase;
            color: var(--amber-light);
            margin-bottom: 28px;
        }
        .hero-tag::before {
            content: '';
            width: 32px; height: 1px;
            background: var(--amber);
        }
        .hero-heading {
            font-family: 'Cormorant Garamond', serif;
            font-size: clamp(62px, 8vw, 110px);
            font-weight: 300;
            line-height: 0.95;
            color: var(--cream);
            letter-spacing: -0.01em;
            max-width: 700px;
            margin-bottom: 32px;
        }
        .hero-heading em {
            font-style: italic;
            color: var(--amber-light);
            font-weight: 300;
        }
        .hero-bottom {
            display: flex;
            align-items: flex-end;
            justify-content: space-between;
            gap: 40px;
        }
        .hero-desc {
            max-width: 360px;
            font-size: 14px;
            line-height: 1.8;
            color: rgba(245, 240, 230, 0.6);
            font-weight: 300;
        }
        .hero-actions {
            display: flex;
            gap: 16px;
            align-items: center;
            flex-shrink: 0;
        }
        .btn-ghost {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 12px;
            letter-spacing: 0.1em;
            text-transform: uppercase;
            color: rgba(245, 240, 230, 0.7);
            cursor: pointer;
            border: none;
            background: none;
            font-family: 'DM Sans', sans-serif;
        }
        .btn-ghost::after {
            content: '→';
            font-size: 16px;
            transition: transform 0.2s;
        }
        .btn-ghost:hover::after { transform: translateX(4px); }
        .hero-scroll {
            position: absolute;
            bottom: 72px; right: 48px;
            writing-mode: vertical-rl;
            font-size: 10px;
            letter-spacing: 0.2em;
            text-transform: uppercase;
            color: rgba(245, 240, 230, 0.3);
            display: flex;
            align-items: center;
            gap: 12px;
        }
        .hero-scroll::after {
            content: '';
            width: 1px; height: 48px;
            background: rgba(245, 240, 230, 0.2);
            display: block;
        }

        /* ── MARQUEE STRIP ─────────────────────────────────────── */
        .marquee-strip {
            background: var(--amber);
            padding: 14px 0;
            overflow: hidden;
        }
        .marquee-inner {
            display: flex;
            gap: 0;
            white-space: nowrap;
            animation: marquee 18s linear infinite;
        }
        .marquee-item {
            display: inline-flex;
            align-items: center;
            gap: 20px;
            padding: 0 32px;
            font-size: 11px;
            font-weight: 500;
            letter-spacing: 0.15em;
            text-transform: uppercase;
            color: var(--cream);
        }
        .marquee-dot {
            width: 4px; height: 4px;
            border-radius: 50%;
            background: rgba(245, 240, 230, 0.5);
        }
        @keyframes marquee {
            from { transform: translateX(0); }
            to   { transform: translateX(-50%); }
        }

        /* ── CATEGORIES ────────────────────────────────────────── */
        .section-cats {
            padding: 96px 48px;
            background: var(--cream);
        }
        .cats-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 2px;
        }
        .cat-card {
            position: relative;
            aspect-ratio: 3/4;
            overflow: hidden;
            cursor: pointer;
        }
        .cat-card-bg {
            width: 100%; height: 100%;
            transition: transform 0.5s ease;
        }
        .cat-card:hover .cat-card-bg { transform: scale(1.04); }
        .cat-card-overlay {
            position: absolute;
            inset: 0;
            display: flex;
            flex-direction: column;
            justify-content: flex-end;
            padding: 28px 24px;
        }
        .cat-name {
            font-family: 'Cormorant Garamond', serif;
            font-size: 26px;
            font-weight: 400;
            color: var(--cream);
            line-height: 1.1;
            margin-bottom: 6px;
        }
        .cat-count {
            font-size: 11px;
            letter-spacing: 0.12em;
            color: rgba(245, 240, 230, 0.6);
            text-transform: uppercase;
        }

        /* ── PRODUCTS ──────────────────────────────────────────── */
        .section-products {
            padding: 96px 48px;
            background: var(--cream-warm);
        }
        .products-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            margin-bottom: 56px;
        }
        .view-all {
            font-size: 12px;
            letter-spacing: 0.1em;
            text-transform: uppercase;
            color: var(--green-soft);
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .view-all::after { content: '→'; }
        .products-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 24px;
        }
        .product-card {
            background: var(--cream);
            border-radius: 4px;
            overflow: hidden;
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .product-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 20px 48px rgba(26, 51, 40, 0.12);
        }
        .product-img {
            width: 100%;
            aspect-ratio: 4/3;
            position: relative;
            overflow: hidden;
        }
        /* Real product images */
        .product-img img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
            transition: transform 0.5s ease;
        }
        .product-card:hover .product-img img {
            transform: scale(1.05);
        }
        .product-badge {
            position: absolute;
            top: 16px; left: 16px;
            font-size: 9px;
            font-weight: 500;
            letter-spacing: 0.12em;
            text-transform: uppercase;
            padding: 5px 10px;
            border-radius: 2px;
            z-index: 2;
        }
        .badge-new  { background: var(--green-deep); color: var(--cream); }
        .badge-best { background: var(--amber);      color: var(--cream); }
        .product-info { padding: 22px 24px 28px; }
        .product-origin {
            font-size: 10px;
            letter-spacing: 0.15em;
            text-transform: uppercase;
            color: var(--green-soft);
            margin-bottom: 6px;
        }
        .product-name {
            font-family: 'Cormorant Garamond', serif;
            font-size: 22px;
            font-weight: 500;
            color: var(--green-deep);
            margin-bottom: 8px;
            line-height: 1.2;
        }
        .product-desc {
            font-size: 13px;
            color: var(--text-light);
            line-height: 1.7;
            margin-bottom: 20px;
        }
        .product-footer {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .product-price {
            font-family: 'Cormorant Garamond', serif;
            font-size: 24px;
            font-weight: 400;
            color: var(--green-deep);
        }
        .product-price span { font-size: 13px; color: var(--text-light); }
        .btn-cart {
            width: 40px; height: 40px;
            border-radius: 50%;
            background: var(--green-deep);
            border: none;
            color: var(--cream);
            cursor: pointer;
            font-size: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: background 0.2s;
        }
        .btn-cart:hover { background: var(--amber); }

        /* ── ORIGIN SECTION ────────────────────────────────────── */
        .section-origin {
            padding: 0;
            display: grid;
            grid-template-columns: 1fr 1fr;
            min-height: 600px;
        }
        .origin-visual {
            background: var(--green-deep);
            position: relative;
            overflow: hidden;
            min-height: 600px;
        }
        .origin-visual-inner {
            position: absolute;
            inset: 0;
            background:
                radial-gradient(ellipse 80% 80% at 60% 50%, rgba(74, 124, 95, 0.5), transparent),
                radial-gradient(ellipse 40% 40% at 20% 20%, rgba(200, 137, 58, 0.2), transparent),
                var(--green-deep);
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .origin-map-art {
            font-family: 'Cormorant Garamond', serif;
            font-size: 180px;
            color: rgba(74, 124, 95, 0.25);
            font-weight: 300;
            font-style: italic;
            user-select: none;
            line-height: 1;
        }
        .origin-badge {
            position: absolute;
            bottom: 48px; left: 48px;
            background: var(--amber);
            padding: 20px 28px;
            border-radius: 2px;
        }
        .origin-badge-num {
            font-family: 'Cormorant Garamond', serif;
            font-size: 42px;
            font-weight: 300;
            color: var(--cream);
            line-height: 1;
        }
        .origin-badge-text {
            font-size: 10px;
            letter-spacing: 0.15em;
            text-transform: uppercase;
            color: rgba(245, 240, 230, 0.8);
            margin-top: 4px;
        }
        .origin-content {
            background: var(--cream-warm);
            padding: 80px 64px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .origin-quote {
            font-family: 'Cormorant Garamond', serif;
            font-size: 32px;
            font-weight: 300;
            font-style: italic;
            color: var(--green-deep);
            line-height: 1.4;
            margin-bottom: 32px;
            border-left: 2px solid var(--amber);
            padding-left: 24px;
        }
        .origin-text {
            font-size: 14px;
            line-height: 1.9;
            color: var(--text-mid);
            margin-bottom: 40px;
            font-weight: 300;
        }
        .origin-features {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 24px;
            margin-bottom: 40px;
        }
        .origin-feat {
            display: flex;
            align-items: flex-start;
            gap: 12px;
        }
        .feat-dot {
            width: 6px; height: 6px;
            border-radius: 50%;
            background: var(--amber);
            flex-shrink: 0;
            margin-top: 6px;
        }
        .feat-text { font-size: 13px; color: var(--text-mid); line-height: 1.5; }
        .feat-text strong { color: var(--green-deep); font-weight: 500; display: block; }

        /* ── BRANDS ────────────────────────────────────────────── */
        .section-brands {
            padding: 80px 48px;
            background: var(--cream);
            text-align: center;
        }
        .brands-row {
            display: flex;
            gap: 0;
            margin-top: 48px;
            border: 1px solid rgba(26, 51, 40, 0.1);
        }
        .brand-item {
            flex: 1;
            padding: 32px 24px;
            border-right: 1px solid rgba(26, 51, 40, 0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 12px;
            cursor: pointer;
            transition: background 0.25s;
        }
        .brand-item:last-child { border-right: none; }
        .brand-item:hover { background: var(--green-deep); }
        .brand-item:hover .brand-name  { color: var(--cream); }
        .brand-item:hover .brand-region { color: rgba(245, 240, 230, 0.6); }
        .brand-icon {
            width: 48px; height: 48px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 22px;
            background: var(--cream-warm);
        }
        .brand-item:hover .brand-icon { background: rgba(245, 240, 230, 0.1); }
        .brand-name {
            font-family: 'Cormorant Garamond', serif;
            font-size: 17px;
            font-weight: 500;
            color: var(--green-deep);
            transition: color 0.25s;
        }
        .brand-region {
            font-size: 10px;
            letter-spacing: 0.12em;
            text-transform: uppercase;
            color: var(--text-light);
            transition: color 0.25s;
        }

        /* ── CTA STRIP ─────────────────────────────────────────── */
        .section-cta {
            background: var(--green-deep);
            padding: 100px 48px;
            display: grid;
            grid-template-columns: 1fr 1fr;
            align-items: center;
            gap: 80px;
        }
        .cta-heading {
            font-family: 'Cormorant Garamond', serif;
            font-size: clamp(40px, 4vw, 60px);
            font-weight: 300;
            color: var(--cream);
            line-height: 1.1;
        }
        .cta-heading em { font-style: italic; color: var(--amber-light); }
        .cta-right { display: flex; flex-direction: column; gap: 24px; }
        .cta-input-row {
            display: flex;
            gap: 0;
            border: 1px solid rgba(245, 240, 230, 0.2);
        }
        .cta-input {
            flex: 1;
            background: transparent;
            border: none;
            outline: none;
            padding: 16px 20px;
            font-size: 13px;
            color: var(--cream);
            font-family: 'DM Sans', sans-serif;
        }
        .cta-input::placeholder { color: rgba(245, 240, 230, 0.35); }
        .cta-btn {
            padding: 16px 28px;
            background: var(--amber);
            border: none;
            color: var(--cream);
            font-size: 11px;
            font-weight: 500;
            letter-spacing: 0.12em;
            text-transform: uppercase;
            cursor: pointer;
            transition: background 0.2s;
            font-family: 'DM Sans', sans-serif;
        }
        .cta-btn:hover { background: var(--amber-light); }
        .cta-note {
            font-size: 12px;
            color: rgba(245, 240, 230, 0.35);
            line-height: 1.6;
        }
    </style>
</head>
<body>

<%-- ═══════════════════════════════════════════════════════════
     HEADER — pulled in from layout/header.jsp
     ═══════════════════════════════════════════════════════════ --%>
<jsp:include page="/layout/header.jsp" />


<!-- ═══════════════════════════════════════════════════════════
     HERO
     ═══════════════════════════════════════════════════════════ -->
<section class="hero">
    <div class="hero-bg"></div>

    <!-- ── Decorative circles with hero image ─────────────────
         Uses himal.jpeg as the main circular hero visual.
         c1 = outermost ring (border only)
         c2 = mid ring with the actual image inside
         c3 = inner ring overlay / glow
         leaf = decorative emoji layered on top
    ─────────────────────────────────────────────────────────── -->
    <div class="hero-circles">
        <div class="c1"></div>
        <div class="c2">
            <img src="${pageContext.request.contextPath}/images/himal.jpeg"
                 alt="Himalayan tea garden">
        </div>
        <div class="c3"></div>
        <div class="leaf">🍃</div>
    </div>

    <div class="hero-scroll">Scroll</div>

    <div style="position: relative; z-index: 2;">
        <div class="hero-tag">Himalayan Aroma · Est. Nepal</div>
        <h1 class="hero-heading">
            Pure teas from<br>Nepal's <em>finest</em><br>gardens
        </h1>
        <div class="hero-bottom">
            <p class="hero-desc">
                From the misty slopes of Illam and Taplejung to your cup — every tea on Hiroma
                is authentic, organic, and sourced directly from Nepal's most trusted gardens.
            </p>
            <div class="hero-actions">
                <%--
                    TODO: Wire to shop/product listing servlet.
                    e.g. <a href="shop" class="btn-primary">Explore Teas</a>
                --%>
                <button class="btn-primary">Explore Teas</button>
                <button class="btn-ghost">Our Story</button>
            </div>
        </div>
    </div>
</section>


<!-- ═══════════════════════════════════════════════════════════
     MARQUEE STRIP
     ═══════════════════════════════════════════════════════════ -->
<div class="marquee-strip">
    <div class="marquee-inner">
        <span class="marquee-item">Illam First Flush<span class="marquee-dot"></span></span>
        <span class="marquee-item">Organic Certified<span class="marquee-dot"></span></span>
        <span class="marquee-item">Taplejung White Tea<span class="marquee-dot"></span></span>
        <span class="marquee-item">Direct from Garden<span class="marquee-dot"></span></span>
        <span class="marquee-item">Himalayan Herbal Blends<span class="marquee-dot"></span></span>
        <span class="marquee-item">100% Nepal Origin<span class="marquee-dot"></span></span>
        <!-- Duplicate set for seamless loop -->
        <span class="marquee-item">Illam First Flush<span class="marquee-dot"></span></span>
        <span class="marquee-item">Organic Certified<span class="marquee-dot"></span></span>
        <span class="marquee-item">Taplejung White Tea<span class="marquee-dot"></span></span>
        <span class="marquee-item">Direct from Garden<span class="marquee-dot"></span></span>
        <span class="marquee-item">Himalayan Herbal Blends<span class="marquee-dot"></span></span>
        <span class="marquee-item">100% Nepal Origin<span class="marquee-dot"></span></span>
    </div>
</div>


<!-- ═══════════════════════════════════════════════════════════
     CATEGORIES
     ═══════════════════════════════════════════════════════════ -->
<section class="section-cats">
    <div class="section-label">Browse by type</div>
    <h2 class="section-heading">Every kind of Himalayan tea, in one place</h2>
    <div class="cats-grid">

        <!-- Green Tea -->
        <div class="cat-card">
            <div class="cat-card-bg" style="background: linear-gradient(160deg,#2A5C3F,#1A3328); height:100%; width:100%; position:absolute; inset:0;">
                <div style="position:absolute; top:32px; right:32px; font-size:64px; opacity:0.18; font-family:'Cormorant Garamond',serif; color:#F5F0E6; font-weight:300; line-height:1;">Green</div>
                <div style="position:absolute; bottom:0; left:0; right:0; height:60%; background:linear-gradient(to top,rgba(26,51,40,0.9),transparent);"></div>
            </div>
            <div class="cat-card-overlay">
                <div class="cat-name">Green Tea</div>
                <div class="cat-count">12 varieties</div>
            </div>
        </div>

        <!-- Black Tea -->
        <div class="cat-card">
            <div class="cat-card-bg" style="background: linear-gradient(160deg,#5C3020,#3A1C10); height:100%; width:100%; position:absolute; inset:0;">
                <div style="position:absolute; top:32px; right:32px; font-size:64px; opacity:0.18; font-family:'Cormorant Garamond',serif; color:#F5F0E6; font-weight:300; line-height:1;">Black</div>
                <div style="position:absolute; bottom:0; left:0; right:0; height:60%; background:linear-gradient(to top,rgba(58,28,16,0.9),transparent);"></div>
            </div>
            <div class="cat-card-overlay">
                <div class="cat-name">Black Tea</div>
                <div class="cat-count">18 varieties</div>
            </div>
        </div>

        <!-- White Tea -->
        <div class="cat-card">
            <div class="cat-card-bg" style="background: linear-gradient(160deg,#C8893A,#8A5A20); height:100%; width:100%; position:absolute; inset:0;">
                <div style="position:absolute; top:32px; right:32px; font-size:64px; opacity:0.18; font-family:'Cormorant Garamond',serif; color:#F5F0E6; font-weight:300; line-height:1;">White</div>
                <div style="position:absolute; bottom:0; left:0; right:0; height:60%; background:linear-gradient(to top,rgba(138,90,32,0.9),transparent);"></div>
            </div>
            <div class="cat-card-overlay">
                <div class="cat-name">White Tea</div>
                <div class="cat-count">7 varieties</div>
            </div>
        </div>

        <!-- Herbal Blends -->
        <div class="cat-card">
            <div class="cat-card-bg" style="background: linear-gradient(160deg,#3A5C4A,#223830); height:100%; width:100%; position:absolute; inset:0;">
                <div style="position:absolute; top:32px; right:32px; font-size:64px; opacity:0.18; font-family:'Cormorant Garamond',serif; color:#F5F0E6; font-weight:300; line-height:1;">Herbal</div>
                <div style="position:absolute; bottom:0; left:0; right:0; height:60%; background:linear-gradient(to top,rgba(34,56,48,0.9),transparent);"></div>
            </div>
            <div class="cat-card-overlay">
                <div class="cat-name">Herbal Blends</div>
                <div class="cat-count">9 varieties</div>
            </div>
        </div>

    </div>
</section>


<!-- ═══════════════════════════════════════════════════════════
     FEATURED PRODUCTS
     ═══════════════════════════════════════════════════════════ -->
<section class="section-products">
    <div class="products-header">
        <div>
            <div class="section-label">Handpicked for you</div>
            <h2 class="section-heading" style="margin-bottom: 0;">Featured teas</h2>
        </div>
        <%--
            TODO: Wire to product listing servlet.
            e.g. <a class="view-all" href="shop">View all products</a>
        --%>
        <a class="view-all" href="#">View all products</a>
    </div>

    <div class="products-grid">

        <!-- Product 1 — Illam First Flush  →  yellow.jpeg -->
        <div class="product-card">
            <div class="product-img">
                <span class="product-badge badge-best">Best Seller</span>
                <img src="${pageContext.request.contextPath}/images/yellow.jpeg"
                     alt="Illam First Flush Darjeeling tea">
            </div>
            <div class="product-info">
                <div class="product-origin">Illam, Koshi Province</div>
                <div class="product-name">Illam First Flush Darjeeling</div>
                <div class="product-desc">Delicate muscatel notes with a bright, floral finish. Harvested at 1,200m elevation in early spring.</div>
                <div class="product-footer">
                    <div class="product-price">Rs 850 <span>/ 100g</span></div>
                    <%--
                        TODO: Wire add-to-cart to CartServlet.
                        e.g. <button class="btn-cart" onclick="addToCart(1)">+</button>
                    --%>
                    <button class="btn-cart">+</button>
                </div>
            </div>
        </div>

        <!-- Product 2 — Silver Needle White Tea  →  lipton.jpeg -->
        <div class="product-card">
            <div class="product-img">
                <span class="product-badge badge-new">New Arrival</span>
                <img src="${pageContext.request.contextPath}/images/lipton.jpeg"
                     alt="Silver Needle White Tea">
            </div>
            <div class="product-info">
                <div class="product-origin">Taplejung, Koshi Province</div>
                <div class="product-name">Silver Needle White Tea</div>
                <div class="product-desc">One of Nepal's rarest teas. Only young, unopened buds are harvested by hand at sunrise.</div>
                <div class="product-footer">
                    <div class="product-price">Rs 1,200 <span>/ 50g</span></div>
                    <button class="btn-cart">+</button>
                </div>
            </div>
        </div>

        <!-- Product 3 — Himalayan Herbal Blend  →  lavender.jpeg -->
        <div class="product-card">
            <div class="product-img">
                <span class="product-badge badge-new">New Arrival</span>
                <img src="${pageContext.request.contextPath}/images/lavender.jpeg"
                     alt="Himalayan Herbal Blend">
            </div>
            <div class="product-info">
                <div class="product-origin">Dhankuta, Koshi Province</div>
                <div class="product-name">Himalayan Herbal Blend</div>
                <div class="product-desc">Tulsi, ginger, lemongrass and cardamom sourced from organic farms in the eastern hills.</div>
                <div class="product-footer">
                    <div class="product-price">Rs 650 <span>/ 100g</span></div>
                    <button class="btn-cart">+</button>
                </div>
            </div>
        </div>

    </div>
</section>


<!-- ═══════════════════════════════════════════════════════════
     ORIGIN / WHY HIROMA
     ═══════════════════════════════════════════════════════════ -->
<section class="section-origin">
    <div class="origin-visual">
        <div class="origin-visual-inner">
            <div class="origin-map-art">नेपाल</div>
        </div>
        <div class="origin-badge">
            <div class="origin-badge-num">1,200m</div>
            <div class="origin-badge-text">Average altitude of<br>our tea gardens</div>
        </div>
    </div>

    <div class="origin-content">
        <div class="section-label">Why Hiroma</div>
        <div class="origin-quote">"Where the Himalayas meet the mist, the finest teas are born."</div>
        <div class="origin-text">
            Nepal's eastern hills — Illam, Taplejung, Dhankuta — produce some of the world's
            most prized teas, yet they remain largely unknown outside the region. Hiroma exists
            to change that. We connect authentic Nepali tea brands directly with buyers who
            value quality and origin.
        </div>
        <div class="origin-features">
            <div class="origin-feat">
                <div class="feat-dot"></div>
                <div class="feat-text">
                    <strong>100% Organic</strong>No synthetic fertilizers or pesticides on any listed product
                </div>
            </div>
            <div class="origin-feat">
                <div class="feat-dot"></div>
                <div class="feat-text">
                    <strong>Direct Trade</strong>Brands sell directly — no middlemen, better prices for both sides
                </div>
            </div>
            <div class="origin-feat">
                <div class="feat-dot"></div>
                <div class="feat-text">
                    <strong>Verified Origin</strong>Every brand lists their origin district, garden name and altitude
                </div>
            </div>
            <div class="origin-feat">
                <div class="feat-dot"></div>
                <div class="feat-text">
                    <strong>Admin Approved</strong>All brands are reviewed before listing on the platform
                </div>
            </div>
        </div>
        <%--
            TODO: Wire to about/story servlet.
            e.g. <a href="about" class="btn-primary">Discover Our Story</a>
        --%>
        <button class="btn-primary" style="align-self: flex-start;">Discover Our Story</button>
    </div>
</section>


<!-- ═══════════════════════════════════════════════════════════
     BRANDS
     ═══════════════════════════════════════════════════════════ -->
<section class="section-brands">
    <div class="section-label" style="justify-content: center;">Trusted sellers</div>
    <h2 class="section-heading" style="margin: 0 auto; text-align: center; max-width: none;">Featured tea brands</h2>
    <div class="brands-row">
        <div class="brand-item">
            <div class="brand-name">Illam Tea Estate</div>
            <div class="brand-region">Illam · Koshi</div>
        </div>
        <div class="brand-item">
            <div class="brand-name">Taplejung Organics</div>
            <div class="brand-region">Taplejung · Koshi</div>
        </div>
        <div class="brand-item">
            <div class="brand-name">Himalayan Brew Co.</div>
            <div class="brand-region">Dhankuta · Koshi</div>
        </div>
        <div class="brand-item">
            <div class="brand-name">Koshi Garden Teas</div>
            <div class="brand-region">Panchthar · Koshi</div>
        </div>
        <div class="brand-item">
            <div class="brand-name">Pure Nepal Herbs</div>
            <div class="brand-region">Kaski · Gandaki</div>
        </div>
    </div>
</section>


<!-- ═══════════════════════════════════════════════════════════
     CTA / NEWSLETTER
     ═══════════════════════════════════════════════════════════ -->
<section class="section-cta">
    <h2 class="cta-heading">Stay close to the <em>harvest</em></h2>
    <div class="cta-right">
        <p style="font-size:14px; color:rgba(245,240,230,0.6); line-height:1.8;">
            Get notified about new arrivals, seasonal flushes, and exclusive drops from Nepal's
            finest gardens. No spam — just tea.
        </p>
        <div class="cta-input-row">
            <input class="cta-input" type="email" placeholder="your@email.com">
            <%--
                TODO: Wire to NewsletterServlet for email capture.
                e.g. <form action="newsletter" method="post">...</form>
            --%>
            <button class="cta-btn">Subscribe</button>
        </div>
        <p class="cta-note">Join 2,000+ tea lovers already on our list. Unsubscribe anytime.</p>
    </div>
</section>


<%-- ═══════════════════════════════════════════════════════════
     FOOTER — pulled in from layout/footer.jsp
     ═══════════════════════════════════════════════════════════ --%>
<jsp:include page="/layout/footer.jsp" />

</body>
</html>

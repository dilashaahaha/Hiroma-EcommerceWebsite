<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ page import="com.hiroma.model.Product" %>
<%
    String ctx = request.getContextPath();
    java.util.List<?> cartSession = (java.util.List<?>) session.getAttribute("cart");
    int cartCount = (cartSession != null) ? cartSession.size() : 0;
    Object loggedInUser = session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Illam First Flush &#8212; Hiroma</title>
  <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,500;0,600;1,300;1,400;1,500&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet">
  <style>
    :root {
      --green-deep:#1A3328; --green-mid:#2A4F3C; --green-soft:#4A7C5F;
      --cream:#F5F0E6; --cream-warm:#EDE6D6;
      --amber:#C8893A; --amber-light:#E8B86D;
      --text-dark:#1A1A14; --text-mid:#4A4A3A; --text-light:#8A8A72;
      --border:rgba(26,51,40,0.1); --white:#fff;
    }
    *{margin:0;padding:0;box-sizing:border-box;}
    body{font-family:'DM Sans',sans-serif;background:var(--cream);-webkit-font-smoothing:antialiased;}
    a{text-decoration:none;color:inherit;}
    ul{list-style:none;}
    button{font-family:inherit;cursor:pointer;}

    /* ── NAVBAR ── */
    nav{position:sticky;top:0;z-index:100;display:flex;align-items:center;justify-content:space-between;padding:18px 48px;background:rgba(245,240,230,0.95);backdrop-filter:blur(14px);border-bottom:1px solid var(--border);}
    .nav-logo{font-family:'Cormorant Garamond',serif;font-size:22px;font-weight:600;letter-spacing:0.14em;text-transform:uppercase;color:var(--green-deep);}
    .nav-logo span{color:var(--amber);font-style:italic;}
    .nav-links{display:flex;gap:32px;}
    .nav-links a{font-size:11px;font-weight:400;letter-spacing:0.1em;text-transform:uppercase;color:var(--text-mid);transition:color 0.2s;}
    .nav-links a:hover{color:var(--green-deep);}
    .nav-right{display:flex;align-items:center;gap:16px;}
    .nav-icon-btn{background:none;border:none;cursor:pointer;font-size:18px;color:var(--green-deep);padding:4px;}
    .nav-cart-badge{position:relative;}
    .cart-count{position:absolute;top:-6px;right:-6px;width:16px;height:16px;background:var(--amber);border-radius:50%;font-size:9px;color:var(--cream);display:flex;align-items:center;justify-content:center;font-weight:500;}
    .btn-account{padding:9px 20px;background:var(--green-deep);color:var(--cream);border:none;border-radius:2px;font-size:10px;font-weight:500;letter-spacing:0.12em;text-transform:uppercase;cursor:pointer;transition:background 0.2s;}
    .btn-account:hover{background:var(--green-mid);}

    /* ── BREADCRUMB ── */
    .breadcrumb{padding:16px 48px;display:flex;align-items:center;gap:8px;font-size:12px;color:var(--text-light);}
    .breadcrumb a{color:var(--green-soft);}
    .breadcrumb a:hover{color:var(--green-deep);}
    .bc-sep{color:var(--text-light);}

    /* ── PRODUCT SECTION ── */
    .product-section{display:grid;grid-template-columns:1fr 1fr;min-height:600px;}
    .product-gallery{background:var(--green-deep);position:relative;overflow:hidden;display:flex;align-items:center;justify-content:center;padding:60px;}
    .gallery-bg{position:absolute;inset:0;background:radial-gradient(ellipse 60% 70% at 50% 40%,rgba(74,124,95,0.5),transparent),radial-gradient(ellipse 40% 40% at 80% 80%,rgba(200,137,58,0.2),transparent),var(--green-deep);}
    .gallery-badge{position:absolute;top:32px;left:32px;z-index:2;background:var(--amber);padding:6px 14px;border-radius:2px;font-size:9px;font-weight:500;letter-spacing:0.14em;text-transform:uppercase;color:var(--cream);}
    .gallery-main{position:relative;z-index:2;width:280px;height:280px;border-radius:50%;background:radial-gradient(ellipse at 35% 35%,rgba(200,137,58,0.3),rgba(42,79,60,0.6));display:flex;align-items:center;justify-content:center;font-size:120px;}
    .gallery-thumbs{position:absolute;bottom:32px;left:32px;z-index:2;display:flex;gap:10px;}
    .thumb{width:56px;height:56px;border-radius:4px;background:rgba(245,240,230,0.1);border:1.5px solid rgba(245,240,230,0.2);display:flex;align-items:center;justify-content:center;font-size:24px;cursor:pointer;transition:border-color 0.2s;}
    .thumb.active,.thumb:hover{border-color:var(--amber-light);}

    /* ── PRODUCT INFO ── */
    .product-info{padding:56px;background:var(--cream);display:flex;flex-direction:column;justify-content:center;}
    .product-eyebrow{display:flex;align-items:center;gap:12px;margin-bottom:14px;flex-wrap:wrap;}
    .product-origin-tag{font-size:10px;letter-spacing:0.2em;text-transform:uppercase;color:var(--green-soft);display:flex;align-items:center;gap:8px;}
    .product-origin-tag::before{content:'';display:inline-block;width:20px;height:1px;background:var(--green-soft);vertical-align:middle;}
    .product-brand-link{font-size:12px;color:var(--amber);cursor:pointer;letter-spacing:0.06em;}
    .product-name{font-family:'Cormorant Garamond',serif;font-size:clamp(32px,4vw,52px);font-weight:400;color:var(--green-deep);line-height:1.05;margin-bottom:16px;}
    .product-rating{display:flex;align-items:center;gap:10px;margin-bottom:24px;}
    .pd-stars{color:var(--amber);font-size:14px;letter-spacing:1px;}
    .rating-count{font-size:12px;color:var(--text-light);}
    .product-desc{font-size:14px;line-height:1.9;color:var(--text-mid);font-weight:300;margin-bottom:28px;max-width:480px;}

    /* ── SPECS ── */
    .specs-row{display:flex;margin-bottom:32px;border:1px solid var(--border);border-radius:4px;overflow:hidden;}
    .spec-item{flex:1;padding:14px 18px;border-right:1px solid var(--border);}
    .spec-item:last-child{border-right:none;}
    .spec-label{font-size:9px;letter-spacing:0.18em;text-transform:uppercase;color:var(--text-light);margin-bottom:4px;}
    .spec-value{font-size:14px;color:var(--text-dark);font-weight:400;}

    /* ── PURCHASE ── */
    .purchase-row{display:flex;align-items:center;gap:16px;margin-bottom:20px;}
    .price-block .price-main{font-family:'Cormorant Garamond',serif;font-size:40px;font-weight:300;color:var(--green-deep);line-height:1;}
    .price-block .price-unit{font-size:12px;color:var(--text-light);}
    .qty-control{display:flex;align-items:center;border:1px solid var(--border);border-radius:3px;overflow:hidden;}
    .qty-btn{width:40px;height:48px;background:var(--white);border:none;font-size:18px;cursor:pointer;color:var(--text-mid);transition:background 0.2s;display:flex;align-items:center;justify-content:center;}
    .qty-btn:hover{background:var(--cream-warm);}
    .qty-val{width:48px;text-align:center;font-size:16px;color:var(--text-dark);border:none;outline:none;background:var(--white);height:48px;}
    .qty-val::-webkit-inner-spin-button,.qty-val::-webkit-outer-spin-button{-webkit-appearance:none;}
    .purchase-actions{display:flex;gap:12px;margin-bottom:20px;}
    .btn-add-cart{flex:1;padding:16px;background:var(--green-deep);color:var(--cream);font-size:11px;font-weight:500;letter-spacing:0.14em;text-transform:uppercase;border:none;border-radius:3px;cursor:pointer;transition:background 0.25s;display:flex;align-items:center;justify-content:center;gap:8px;}
    .btn-add-cart:hover{background:var(--green-mid);}
    .btn-wishlist{width:52px;height:52px;border:1.5px solid var(--border);border-radius:3px;background:var(--white);cursor:pointer;font-size:20px;display:flex;align-items:center;justify-content:center;transition:all 0.2s;}
    .btn-wishlist:hover,.btn-wishlist.wishlisted{border-color:var(--amber);color:#C0392B;}
    .guarantee-row{display:flex;gap:24px;padding:18px 0;border-top:1px solid var(--border);flex-wrap:wrap;}
    .guarantee-item{display:flex;align-items:center;gap:8px;font-size:12px;color:var(--text-mid);}

    /* ── TABS ── */
    .tabs-section{padding:72px 48px;background:var(--cream-warm);}
    .tabs-nav{display:flex;border-bottom:2px solid var(--border);margin-bottom:40px;}
    .tab{padding:14px 28px;font-size:11px;font-weight:500;letter-spacing:0.1em;text-transform:uppercase;color:var(--text-light);cursor:pointer;border-bottom:2px solid transparent;margin-bottom:-2px;transition:all 0.2s;background:none;border-top:none;border-left:none;border-right:none;}
    .tab.active{color:var(--green-deep);border-bottom-color:var(--amber);}
    .tab:hover{color:var(--green-deep);}
    .brew-grid{display:grid;grid-template-columns:repeat(4,1fr);gap:16px;}
    .brew-card{background:var(--white);border:1px solid var(--border);border-radius:4px;padding:20px;text-align:center;}
    .brew-icon{font-size:28px;margin-bottom:10px;}
    .brew-label{font-size:10px;letter-spacing:0.14em;text-transform:uppercase;color:var(--text-light);margin-bottom:4px;}
    .brew-value{font-family:'Cormorant Garamond',serif;font-size:22px;color:var(--green-deep);}

    /* ── REVIEWS ── */
    .reviews-section{padding:72px 48px;background:var(--cream);}
    .reviews-header{display:flex;align-items:flex-end;justify-content:space-between;margin-bottom:36px;}
    .reviews-eyebrow{font-size:10px;letter-spacing:0.2em;text-transform:uppercase;color:var(--green-soft);margin-bottom:8px;display:flex;align-items:center;gap:10px;}
    .reviews-eyebrow::before{content:'';display:inline-block;width:20px;height:1px;background:var(--green-soft);vertical-align:middle;}
    .reviews-title{font-family:'Cormorant Garamond',serif;font-size:36px;font-weight:400;color:var(--green-deep);}
    .btn-write-review{padding:11px 22px;background:transparent;border:1.5px solid var(--green-deep);color:var(--green-deep);font-size:10px;font-weight:500;letter-spacing:0.12em;text-transform:uppercase;border-radius:2px;cursor:pointer;transition:all 0.2s;}
    .btn-write-review:hover{background:var(--green-deep);color:var(--cream);}
    .reviews-grid{display:grid;grid-template-columns:1fr 1fr;gap:20px;}
    .review-card{background:var(--white);border:1px solid var(--border);border-radius:4px;padding:24px;}
    .review-header{display:flex;align-items:flex-start;justify-content:space-between;margin-bottom:12px;}
    .reviewer-name{font-size:14px;font-weight:500;color:var(--text-dark);margin-bottom:2px;}
    .reviewer-date{font-size:11px;color:var(--text-light);}
    .review-stars{color:var(--amber);font-size:13px;}
    .review-text{font-size:13px;color:var(--text-mid);line-height:1.7;}
    .review-verified{display:inline-flex;align-items:center;gap:4px;font-size:10px;letter-spacing:0.1em;text-transform:uppercase;color:var(--green-soft);margin-top:10px;}

    /* ── FOOTER ── */
    .site-footer{background:#111A14;padding:72px 48px 40px;}
    .footer-grid{display:grid;grid-template-columns:2fr 1fr 1fr 1fr;gap:48px;padding-bottom:48px;border-bottom:1px solid rgba(245,240,230,0.07);}
    .footer-logo{font-family:'Cormorant Garamond',serif;font-size:26px;color:var(--cream);letter-spacing:0.1em;text-transform:uppercase;margin-bottom:14px;}
    .footer-logo span{color:var(--amber);font-style:italic;}
    .footer-tagline{font-size:13px;color:rgba(245,240,230,0.38);line-height:1.8;max-width:240px;}
    .footer-col-title{font-size:10px;letter-spacing:0.2em;text-transform:uppercase;color:var(--amber-light);margin-bottom:18px;}
    .footer-links{display:flex;flex-direction:column;gap:11px;}
    .footer-links a{font-size:13px;color:rgba(245,240,230,0.45);transition:color 0.2s;}
    .footer-links a:hover{color:var(--cream);}
    .footer-bottom{display:flex;justify-content:space-between;align-items:center;padding-top:28px;}
    .footer-copy{font-size:11px;letter-spacing:0.06em;color:rgba(245,240,230,0.2);text-transform:uppercase;}
    .footer-socials{display:flex;gap:18px;}
    .footer-socials a{font-size:11px;letter-spacing:0.1em;text-transform:uppercase;color:rgba(245,240,230,0.3);transition:color 0.2s;}
    .footer-socials a:hover{color:var(--amber-light);}

    /* ── RESPONSIVE ── */
    @media(max-width:900px){
      .product-section{grid-template-columns:1fr;}
      .product-gallery{min-height:320px;padding:40px;}
      .product-info{padding:32px 24px;}
      .brew-grid{grid-template-columns:repeat(2,1fr);}
      .reviews-grid{grid-template-columns:1fr;}
      .tabs-section,.reviews-section{padding:48px 20px;}
      .breadcrumb,.footer-grid{padding:16px 20px;}
      nav{padding:14px 20px;}
      .footer-grid{grid-template-columns:1fr 1fr;gap:28px;}
      .site-footer{padding:48px 20px 32px;}
    }
    @media(max-width:560px){
      .nav-links{display:none;}
      .purchase-row{flex-wrap:wrap;}
      .guarantee-row{flex-direction:column;gap:12px;}
      .reviews-header{flex-direction:column;align-items:flex-start;gap:16px;}
      .footer-grid{grid-template-columns:1fr;}
    }
  </style>
</head>
<body>

<!-- NAVBAR -->
<nav>
  <a href="<%= ctx %>/user/home.jsp" class="nav-logo">H<span>i</span>roma</a>
  <div class="nav-links">
    <a href="<%= ctx %>/user/product.jsp">Shop</a>
    <a href="<%= ctx %>/user/product.jsp?category=all">Collections</a>
    <a href="<%= ctx %>/user/home.jsp#about">Our Story</a>
    <a href="<%= ctx %>/user/home.jsp#brands">Brands</a>
  </div>
  <div class="nav-right">
    <button class="nav-icon-btn">&#9906;</button>
    <div class="nav-cart-badge">
      <a href="<%= ctx %>/user/cart.jsp" class="nav-icon-btn">&#9744;</a>
      <span class="cart-count"><%= cartCount %></span>
    </div>
    <% if (loggedInUser != null) { %>
      <a href="<%= ctx %>/user/profile.jsp"><button class="btn-account">Account</button></a>
    <% } else { %>
      <a href="<%= ctx %>/authentication/login.jsp"><button class="btn-account">Account</button></a>
    <% } %>
  </div>
</nav>

<!-- BREADCRUMB -->
<div class="breadcrumb">
  <a href="<%= ctx %>/user/home.jsp">Home</a>
  <span class="bc-sep">/</span>
  <a href="<%= ctx %>/user/product.jsp?category=black">Black Tea</a>
  <span class="bc-sep">/</span>
  <span>Illam First Flush Darjeeling</span>
</div>

<!-- PRODUCT SECTION -->
<section class="product-section">

  <!-- GALLERY -->
  <div class="product-gallery">
    <div class="gallery-bg"></div>
    <div class="gallery-badge">Best Seller</div>
    <div class="gallery-main">&#127861;</div>
    <div class="gallery-thumbs">
      <div class="thumb active">&#127861;</div>
      <div class="thumb">&#127807;</div>
      <div class="thumb">&#128230;</div>
    </div>
  </div>

  <!-- INFO -->
  <div class="product-info">
    <div class="product-eyebrow">
      <span class="product-origin-tag">Illam, Koshi Province &middot; 1,200m</span>
      <span class="product-brand-link">Illam Tea Estate &#8594;</span>
    </div>

    <h1 class="product-name">Illam First Flush<br>Darjeeling</h1>

    <div class="product-rating">
      <span class="pd-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</span>
      <span class="rating-count">4.9 &middot; 48 reviews</span>
    </div>

    <p class="product-desc">
      Delicate muscatel notes with a bright, floral finish. Harvested at 1,200m elevation
      in early spring, this first flush is prized for its light colour and complex aroma —
      reminiscent of fresh apricots and jasmine with a clean, lingering aftertaste.
    </p>

    <div class="specs-row">
      <div class="spec-item"><div class="spec-label">Weight</div><div class="spec-value">100g</div></div>
      <div class="spec-item"><div class="spec-label">Harvest</div><div class="spec-value">Spring 2025</div></div>
      <div class="spec-item"><div class="spec-label">Altitude</div><div class="spec-value">1,200m</div></div>
      <div class="spec-item"><div class="spec-label">Type</div><div class="spec-value">Black Tea</div></div>
    </div>

    <div class="purchase-row">
      <div class="price-block">
        <div class="price-main">Rs 850</div>
        <div class="price-unit">per 100g</div>
      </div>
      <div class="qty-control">
        <button class="qty-btn" onclick="changeQty(-1)">&#8722;</button>
        <input class="qty-val" type="number" id="qtyInput" value="1" min="1" max="99">
        <button class="qty-btn" onclick="changeQty(1)">+</button>
      </div>
    </div>

    <div class="purchase-actions">
      <%-- For now links to cart page directly (frontend milestone) --%>
      <a href="<%= ctx %>/user/cart.jsp" style="flex:1;">
        <button class="btn-add-cart" style="width:100%;">&#128722; Add to cart</button>
      </a>
      <button class="btn-wishlist" onclick="toggleWishlist(this)" title="Add to wishlist">&#9825;</button>
    </div>

    <div class="guarantee-row">
      <div class="guarantee-item">&#10003; <span>Organic certified</span></div>
      <div class="guarantee-item">&#10003; <span>Free delivery over Rs 2,000</span></div>
      <div class="guarantee-item">&#10003; <span>7-day return policy</span></div>
    </div>
  </div>
</section>


<!-- TABS -->
<section class="tabs-section">
  <div class="tabs-nav">
    <button class="tab active" onclick="showTab(this,'brew')">Brewing guide</button>
    <button class="tab" onclick="showTab(this,'taste')">Tasting notes</button>
    <button class="tab" onclick="showTab(this,'garden')">About the garden</button>
  </div>

  <div class="tab-content" id="tab-brew">
    <div class="brew-grid">
      <div class="brew-card"><div class="brew-icon">&#128167;</div><div class="brew-label">Water temp</div><div class="brew-value">85&#8211;90&#176;C</div></div>
      <div class="brew-card"><div class="brew-icon">&#9201;</div><div class="brew-label">Steep time</div><div class="brew-value">2&#8211;3 min</div></div>
      <div class="brew-card"><div class="brew-icon">&#129749;</div><div class="brew-label">Amount</div><div class="brew-value">2g / 150ml</div></div>
      <div class="brew-card"><div class="brew-icon">&#128260;</div><div class="brew-label">Re-steeps</div><div class="brew-value">2&#8211;3 times</div></div>
    </div>
  </div>

  <div class="tab-content" id="tab-taste" style="display:none;">
    <p style="font-size:14px;color:var(--text-mid);line-height:1.9;max-width:680px;">
      Bright golden liquor with a delicate muscatel character. Notes of fresh apricot, white peach,
      and jasmine blossom lead into a clean finish with a pleasant floral aftertaste. Low tannin, exceptionally smooth.
    </p>
  </div>

  <div class="tab-content" id="tab-garden" style="display:none;">
    <p style="font-size:14px;color:var(--text-mid);line-height:1.9;max-width:680px;">
      Illam Tea Estate sits at 1,200m in the eastern hills of Nepal's Koshi Province. Founded in 1863,
      the garden spans 55 hectares of certified organic land and employs over 200 local farmers.
    </p>
  </div>
</section>


<!-- REVIEWS -->
<section class="reviews-section">
  <div class="reviews-header">
    <div>
      <div class="reviews-eyebrow">Reviews</div>
      <h2 class="reviews-title">What customers say</h2>
    </div>
    <button class="btn-write-review">Write a review</button>
  </div>
  <div class="reviews-grid">
    <div class="review-card">
      <div class="review-header">
        <div><div class="reviewer-name">Priya Sharma</div><div class="reviewer-date">March 28, 2025</div></div>
        <div class="review-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
      </div>
      <p class="review-text">Absolutely beautiful tea. The muscatel notes are unmistakable and the brew is so clear and golden. I've tried many Darjeeling teas but this one from Illam is genuinely exceptional.</p>
      <div class="review-verified">&#10003; Verified purchase</div>
    </div>
    <div class="review-card">
      <div class="review-header">
        <div><div class="reviewer-name">Binod Rai</div><div class="reviewer-date">April 1, 2025</div></div>
        <div class="review-stars">&#9733;&#9733;&#9733;&#9733;&#9734;</div>
      </div>
      <p class="review-text">Great tea, very fresh and aromatic. Shipped quickly and packed well. Brewing at 87&#176;C for 2.5 minutes gives the perfect cup. Would definitely reorder.</p>
      <div class="review-verified">&#10003; Verified purchase</div>
    </div>
  </div>
</section>


<!-- FOOTER -->
<footer class="site-footer">
  <div class="footer-grid">
    <div>
      <div class="footer-logo">H<span>i</span>roma</div>
      <p class="footer-tagline">Nepal's first dedicated marketplace for authentic, organic Himalayan teas. From garden to cup.</p>
    </div>
    <div>
      <div class="footer-col-title">Shop</div>
      <ul class="footer-links">
        <li><a href="<%= ctx %>/user/product.jsp?category=green">Green Teas</a></li>
        <li><a href="<%= ctx %>/user/product.jsp?category=black">Black Teas</a></li>
        <li><a href="<%= ctx %>/user/product.jsp?category=white">White Teas</a></li>
        <li><a href="<%= ctx %>/user/product.jsp?category=herbal">Herbal Blends</a></li>
      </ul>
    </div>
    <div>
      <div class="footer-col-title">Company</div>
      <ul class="footer-links">
        <li><a href="<%= ctx %>/user/home.jsp#about">Our Story</a></li>
        <li><a href="#">Sell on Hiroma</a></li>
        <li><a href="<%= ctx %>/user/home.jsp#contact">Contact</a></li>
      </ul>
    </div>
    <div>
      <div class="footer-col-title">Account</div>
      <ul class="footer-links">
        <li><a href="<%= ctx %>/user/profile.jsp">My Profile</a></li>
        <li><a href="<%= ctx %>/user/orders.jsp">Orders</a></li>
        <li><a href="#">Wishlist</a></li>
      </ul>
    </div>
  </div>
  <div class="footer-bottom">
    <div class="footer-copy">&copy; 2025 Hiroma &middot; Himalayan Aroma &middot; Nepal</div>
    <div class="footer-socials">
      <a href="#">Instagram</a><a href="#">Facebook</a><a href="#">Twitter</a>
    </div>
  </div>
</footer>

<script>
  function changeQty(delta) {
    var inp = document.getElementById('qtyInput');
    inp.value = Math.max(1, parseInt(inp.value) + delta);
  }
  function toggleWishlist(btn) {
    btn.classList.toggle('wishlisted');
    btn.innerHTML = btn.classList.contains('wishlisted') ? '&#9829;' : '&#9825;';
  }
  function showTab(btn, id) {
    document.querySelectorAll('.tab').forEach(function(t){ t.classList.remove('active'); });
    document.querySelectorAll('.tab-content').forEach(function(c){ c.style.display='none'; });
    btn.classList.add('active');
    document.getElementById('tab-' + id).style.display = 'block';
  }
  document.querySelectorAll('.thumb').forEach(function(t) {
    t.addEventListener('click', function() {
      document.querySelectorAll('.thumb').forEach(function(x){ x.classList.remove('active'); });
      t.classList.add('active');
    });
  });
</script>
</body>
</html>

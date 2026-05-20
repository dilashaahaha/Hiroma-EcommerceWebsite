<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - H/ROMA</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/contact.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>

    <nav class="navbar">
        <div class="nav-logo">H/ROMA</div>
        <ul class="nav-links">
            <li><a href="${pageContext.request.contextPath}/shop">SHOP</a></li>
            <li><a href="${pageContext.request.contextPath}/collections">COLLECTIONS</a></li>
            <li><a href="${pageContext.request.contextPath}/about">ABOUT US</a></li>
            <li><a href="${pageContext.request.contextPath}/brands">BRANDS</a></li>
            <li><a href="${pageContext.request.contextPath}/contact" class="active">CONTACT US</a></li>
        </ul>
        <div class="nav-actions">
            <a href="${pageContext.request.contextPath}/account" class="nav-account">ACCOUNT</a>
            <a href="${pageContext.request.contextPath}/cart" class="nav-cart">CART (0)</a>
        </div>
    </nav>

    <section class="hero">
        <h1 class="hero-title">We'd love to hear<br>from <span class="accent">you.</span></h1>
        <p class="hero-sub">Questions about an order, a tea recommendation, or just want to talk<br>about Himalayan gardens — we're here.</p>
    </section>

    <main class="contact-main">

        <section class="contact-info">
            <p class="section-label">— CONTACT INFORMATION</p>
            <h2 class="info-heading">Reach us anytime.</h2>
            <p class="info-desc">Our team is based in Kathmandu and typically responds within one business day. For urgent order issues, use WhatsApp for the fastest response.</p>

            <div class="info-block">
                <div class="info-icon">
                    <i class="fas fa-location-dot"></i>
                </div>
                <div>
                    <span class="info-label">ADDRESS</span>
                    <p>Jhamsikhel, Lalitpur<br>Kathmandu Valley, Nepal</p>
                </div>
            </div>

            <div class="info-block">
                <div class="info-icon">
                    <i class="fas fa-envelope"></i>
                </div>
                <div>
                    <span class="info-label">EMAIL</span>
                    <p>hello@hiroma.com.np<br>support@hiroma.com.np</p>
                </div>
            </div>

            <div class="info-block">
                <div class="info-icon">
                    <i class="fas fa-phone"></i>
                </div>
                <div>
                    <span class="info-label">PHONE / WHATSAPP</span>
                    <p>+977 98-4100-0000<br>Available Sun-Fri, 9am–6pm</p>
                </div>
            </div>

            <div class="support-hours">
                <p class="hours-label">SUPPORT HOURS</p>
                <div class="hours-row">
                    <span>Sunday – Friday</span>
                    <span>9:00 AM – 6:00 PM</span>
                </div>
                <div class="hours-row">
                    <span>Saturday</span>
                    <span>10:00 AM – 2:00 PM</span>
                </div>
                <div class="hours-row">
                    <span>Public Holidays</span>
                    <span>Closed</span>
                </div>
            </div>
        </section>

        <section class="contact-form-wrapper">
            <p class="section-label">— SEND A MESSAGE</p>
            <h2 class="form-heading">How can we help?</h2>

            <form action="${pageContext.request.contextPath}/contact" method="post">
                <div class="form-group">
                    <label class="form-label">I WANT TO TALK ABOUT</label>
                    <div class="topic-grid">
                        <button type="button" class="topic-btn active" onclick="selectTopic(this)">Order &amp; Delivery</button>
                        <button type="button" class="topic-btn" onclick="selectTopic(this)">Tea Recommendations</button>
                        <button type="button" class="topic-btn" onclick="selectTopic(this)">Wholesale Inquiry</button>
                        <button type="button" class="topic-btn" onclick="selectTopic(this)">Something else</button>
                    </div>
                    <input type="hidden" name="topic" id="topicValue" value="Order & Delivery">
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label" for="firstName">FIRST NAME</label>
                        <input type="text" id="firstName" name="first_name" placeholder="Aarati" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="lastName">LAST NAME</label>
                        <input type="text" id="lastName" name="last_name" placeholder="Shrestha" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label" for="email">EMAIL ADDRESS</label>
                    <input type="email" id="email" name="email" placeholder="you@example.com" required>
                </div>

                <div class="form-group">
                    <label class="form-label" for="phone">PHONE (OPTIONAL)</label>
                    <input type="text" id="phone" name="phone" placeholder="98XXXXXXXX">
                </div>

                <div class="form-group">
                    <label class="form-label" for="orderId">ORDER ID (IF APPLICABLE)</label>
                    <input type="text" id="orderId" name="order_id" placeholder="e.g. #1042">
                </div>

                <div class="form-group">
                    <label class="form-label" for="message">MESSAGE</label>
                    <textarea id="message" name="message" rows="5" placeholder="Tell us how we can help you..." required></textarea>
                </div>
                <c:if test="${not empty success}">
                    <p class="success-message">${success}</p>
                </c:if>

                <button type="submit" class="btn-submit">
                    <i class="fas fa-paper-plane"></i> SEND MESSAGE
                </button>
                <p class="form-note">We typically respond within 1 business day.</p>
            </form>
        </section>

    </main>

    <script>
        function selectTopic(btn) {
            document.querySelectorAll('.topic-btn').forEach(b => b.classList.remove('active'));
            btn.classList.add('active');
            document.getElementById('topicValue').value = btn.textContent;
        }
    </script>

</body>
</html>
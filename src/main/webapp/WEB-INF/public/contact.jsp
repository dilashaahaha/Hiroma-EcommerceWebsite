<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact – Hiroma</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/about.css">
</head>
<body>

<nav class="navbar">
    <a href="${pageContext.request.contextPath}/home" class="nav-brand">H<span>/</span>ROMA</a>
    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/shop">Shop</a>
        <a href="${pageContext.request.contextPath}/about">About Us</a>
        <a href="${pageContext.request.contextPath}/contact" class="active">Contact Us</a>
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
<section class="contact-hero">
    <h1>We'd love to hear<br>from <em>you.</em></h1>
    <p>Questions about an order, a tea recommendation, or just want to talk about Himalayan gardens — we're here.</p>
</section>

<!-- BODY -->
<div class="contact-body">

    <!-- LEFT: info -->
    <div class="contact-info">
        <p class="about-label">— CONTACT INFORMATION</p>
        <h2>Reach us anytime.</h2>
        <p class="contact-desc">Our team is based in Kathmandu and typically responds within one business day.</p>

        <div class="contact-item">
            <div class="contact-icon">📍</div>
            <div>
                <p class="contact-item-label">ADDRESS</p>
                <p>Jhamsikhel, Lalitpur<br>Kathmandu Valley, Nepal</p>
            </div>
        </div>
        <div class="contact-item">
            <div class="contact-icon">✉</div>
            <div>
                <p class="contact-item-label">EMAIL</p>
                <p>hello@hiroma.com.np<br>support@hiroma.com.np</p>
            </div>
        </div>
        <div class="contact-item">
            <div class="contact-icon">📞</div>
            <div>
                <p class="contact-item-label">PHONE & WHATSAPP</p>
                <p>+977 98-4100-0000<br>Available Sun–Fri, 9am–6pm</p>
            </div>
        </div>

        <div class="support-hours">
            <p class="support-title">SUPPORT HOURS</p>
            <div class="hours-row"><span>Sunday – Friday</span><span>9:00 AM – 6:00 PM</span></div>
            <div class="hours-row"><span>Saturday</span><span>10:00 AM – 2:00 PM</span></div>
            <div class="hours-row"><span>Public Holidays</span><span>Closed</span></div>
        </div>
    </div>

    <!-- RIGHT: form -->
    <div class="contact-form-card">
        <p class="about-label">— SEND A MESSAGE</p>
        <h2>How can we help?</h2>

        <c:if test="${not empty success}">
            <div class="alert-inline alert-success">${success}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/contact" method="post">
            <div class="field-group">
                <label>SUBJECT</label>
                <select name="subject">
                    <option>Order &amp; Delivery</option>
                    <option>Tea Recommendations</option>
                    <option>Wholesale Inquiry</option>
                    <option>Something else</option>
                </select>
            </div>
            <div class="contact-name-row">
                <div class="field-group">
                    <label>FIRST NAME</label>
                    <input type="text" name="firstName" placeholder="Aarati" required/>
                </div>
                <div class="field-group">
                    <label>LAST NAME</label>
                    <input type="text" name="lastName" placeholder="Shrestha" required/>
                </div>
            </div>
            <div class="field-group">
                <label>EMAIL ADDRESS</label>
                <input type="email" name="email" placeholder="you@example.com" required/>
            </div>
            <div class="field-group">
                <label>PHONE (OPTIONAL)</label>
                <input type="text" name="phone" placeholder="98XXXXXXXX"/>
            </div>
            <div class="field-group">
                <label>MESSAGE</label>
                <textarea name="message" rows="5" placeholder="Tell us how we can help you..." required></textarea>
            </div>
            <button type="submit" class="btn-send">SEND MESSAGE →</button>
            <p class="contact-note">We typically respond within 1 business day.</p>
        </form>
    </div>
</div>

<footer class="footer">
    <div class="footer-brand">H<span>/</span>ROMA</div>
    <p class="footer-copy">© 2025 Hiroma Tea. All rights reserved.</p>
</footer>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Create Account &#8212; Hiroma</title>
  <style>
    /* ── Reset ── */
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
    body {
      font-family: 'Segoe UI', Arial, sans-serif;
      background: #F5F0E6;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }
    a { text-decoration: none; color: inherit; }

    /* ── Navbar ── */
    .nav {
      background: #1A3328;
      height: 58px;
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 0 48px;
    }
    .nav-logo {
      font-size: 1.2rem;
      font-weight: 700;
      letter-spacing: 3px;
      color: #F5F0E6;
      text-transform: uppercase;
    }
    .nav-logo span { color: #C8893A; }
    .nav-back {
      font-size: 0.8rem;
      color: rgba(245,240,230,0.6);
      letter-spacing: 0.5px;
      transition: color 0.2s;
    }
    .nav-back:hover { color: #F5F0E6; }

    /* ── Page layout ── */
    .page {
      flex: 1;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 48px 20px;
    }

    /* ── Card ── */
    .card {
      background: #FFFFFF;
      border: 1px solid #E0D8CC;
      border-radius: 6px;
      width: 100%;
      max-width: 480px;
      padding: 44px 40px 40px;
      box-shadow: 0 4px 24px rgba(26,51,40,0.08);
    }

    /* ── Card header ── */
    .card-eyebrow {
      font-size: 10px;
      font-weight: 600;
      letter-spacing: 0.2em;
      text-transform: uppercase;
      color: #4A7C5F;
      margin-bottom: 8px;
      display: flex;
      align-items: center;
      gap: 8px;
    }
    .card-eyebrow::before {
      content: '';
      width: 20px;
      height: 1px;
      background: #4A7C5F;
    }
    .card-title {
      font-size: 1.9rem;
      font-weight: 300;
      color: #1A3328;
      margin-bottom: 6px;
      line-height: 1.2;
    }
    .card-title em {
      font-style: italic;
      color: #C8893A;
    }
    .card-sub {
      font-size: 0.85rem;
      color: #8A8A7A;
      margin-bottom: 32px;
    }

    /* ── Alerts ── */
    .alert {
      padding: 11px 14px;
      border-radius: 4px;
      font-size: 0.83rem;
      margin-bottom: 20px;
      border: 1px solid transparent;
    }
    .alert-error   { background: #F5DADA; color: #8C2B2B; border-color: #E0AAAA; }
    .alert-success { background: #D8EDD8; color: #2A5C2A; border-color: #A8CCA8; }

    /* ── Form ── */
    .form-group { margin-bottom: 18px; }
    .form-row {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 14px;
    }
    .form-label {
      display: block;
      font-size: 0.78rem;
      font-weight: 600;
      letter-spacing: 0.08em;
      text-transform: uppercase;
      color: #4A4A3A;
      margin-bottom: 6px;
    }
    .form-input {
      width: 100%;
      padding: 11px 14px;
      border: 1.5px solid #E0D8CC;
      border-radius: 4px;
      font-size: 0.92rem;
      color: #1C1C1C;
      background: #FAFAF8;
      outline: none;
      transition: border-color 0.2s, background 0.2s;
    }
    .form-input:focus {
      border-color: #1A3328;
      background: #FFFFFF;
    }
    .form-input::placeholder { color: #AEAE9E; }
    .form-input.error { border-color: #C0392B; }

    /* ── Password strength ── */
    .password-hint {
      font-size: 0.75rem;
      color: #8A8A7A;
      margin-top: 5px;
    }

    /* ── Terms checkbox ── */
    .terms-row {
      display: flex;
      align-items: flex-start;
      gap: 10px;
      margin-bottom: 24px;
      font-size: 0.82rem;
      color: #4A4A3A;
      line-height: 1.5;
    }
    .terms-row input[type="checkbox"] {
      accent-color: #1A3328;
      width: 15px;
      height: 15px;
      margin-top: 2px;
      flex-shrink: 0;
      cursor: pointer;
    }
    .terms-row a {
      color: #4A7C5F;
      font-weight: 600;
    }
    .terms-row a:hover { color: #1A3328; }

    /* ── Submit button ── */
    .btn-submit {
      width: 100%;
      padding: 13px;
      background: #1A3328;
      color: #F5F0E6;
      border: none;
      border-radius: 4px;
      font-size: 0.82rem;
      font-weight: 600;
      letter-spacing: 0.14em;
      text-transform: uppercase;
      cursor: pointer;
      transition: background 0.2s;
      margin-bottom: 16px;
    }
    .btn-submit:hover { background: #2A5C3F; }

    /* ── Divider ── */
    .divider {
      display: flex;
      align-items: center;
      gap: 12px;
      margin: 20px 0;
      color: #AEAE9E;
      font-size: 0.75rem;
    }
    .divider::before,
    .divider::after {
      content: '';
      flex: 1;
      height: 1px;
      background: #E0D8CC;
    }

    /* ── Login link ── */
    .login-row {
      text-align: center;
      font-size: 0.83rem;
      color: #8A8A7A;
    }
    .login-row a {
      color: #1A3328;
      font-weight: 600;
      transition: color 0.2s;
    }
    .login-row a:hover { color: #4A7C5F; }

    /* ── Footer ── */
    .footer {
      text-align: center;
      padding: 20px;
      font-size: 0.75rem;
      color: #AEAE9E;
    }

    /* ── Responsive ── */
    @media (max-width: 520px) {
      .nav { padding: 0 20px; }
      .card { padding: 32px 24px 28px; }
      .card-title { font-size: 1.6rem; }
      .form-row { grid-template-columns: 1fr; }
    }
  </style>
</head>
<body>

<!-- NAVBAR -->
<nav class="nav">
  <a href="${pageContext.request.contextPath}/user/home.jsp" class="nav-logo">
    H<span>i</span>roma
  </a>
  <a href="${pageContext.request.contextPath}/user/home.jsp" class="nav-back">
    &#8592; Back to shop
  </a>
</nav>

<!-- PAGE -->
<div class="page">
  <div class="card">

    <div class="card-eyebrow">Join Hiroma</div>
    <h1 class="card-title">Create your <em>account</em></h1>
    <p class="card-sub">Start your journey with Nepal's finest teas.</p>

    <%-- Flash messages --%>
    <c:if test="${not empty sessionScope.successMessage}">
      <div class="alert alert-success">
        <c:out value="${sessionScope.successMessage}"/>
      </div>
      <c:remove var="successMessage" scope="session"/>
    </c:if>
    <c:if test="${not empty requestScope.errorMessage}">
      <div class="alert alert-error">
        <c:out value="${requestScope.errorMessage}"/>
      </div>
    </c:if>

    <form action="${pageContext.request.contextPath}/RegisterController" method="post">

      <!-- Full Name -->
      <div class="form-group">
        <label class="form-label" for="fullName">Full name</label>
        <input
          class="form-input"
          type="text"
          id="fullName"
          name="fullName"
          placeholder="Your full name"
          value="${not empty requestScope.enteredName ? requestScope.enteredName : ''}"
          required
          autocomplete="name"
        />
      </div>

      <!-- Email + Phone (side by side) -->
      <div class="form-row">
        <div class="form-group">
          <label class="form-label" for="email">Email address</label>
          <input
            class="form-input"
            type="email"
            id="email"
            name="email"
            placeholder="you@example.com"
            value="${not empty requestScope.enteredEmail ? requestScope.enteredEmail : ''}"
            required
            autocomplete="email"
          />
        </div>
        <div class="form-group">
          <label class="form-label" for="phone">Phone number</label>
          <input
            class="form-input"
            type="tel"
            id="phone"
            name="phone"
            placeholder="98XXXXXXXX"
            value="${not empty requestScope.enteredPhone ? requestScope.enteredPhone : ''}"
            autocomplete="tel"
          />
        </div>
      </div>

      <!-- Password -->
      <div class="form-group">
        <label class="form-label" for="password">Password</label>
        <input
          class="form-input"
          type="password"
          id="password"
          name="password"
          placeholder="At least 6 characters"
          required
          autocomplete="new-password"
        />
        <p class="password-hint">Must be at least 6 characters.</p>
      </div>

      <!-- Confirm Password -->
      <div class="form-group">
        <label class="form-label" for="confirmPassword">Confirm password</label>
        <input
          class="form-input"
          type="password"
          id="confirmPassword"
          name="confirmPassword"
          placeholder="Re-enter your password"
          required
          autocomplete="new-password"
        />
      </div>

      <!-- Terms & Conditions -->
      <div class="terms-row">
        <input type="checkbox" id="terms" name="terms" required/>
        <label for="terms">
          I agree to the <a href="#">Terms of Service</a> and
          <a href="#">Privacy Policy</a> of Hiroma.
        </label>
      </div>

      <button type="submit" class="btn-submit">Create account &#8594;</button>

    </form>

    <div class="divider">or</div>

    <div class="login-row">
      Already have an account?
      <a href="${pageContext.request.contextPath}/LoginController">Sign in</a>
    </div>

  </div>
</div>

<!-- FOOTER -->
<div class="footer">
  &copy; 2025 Hiroma &middot; Himalayan Aroma &middot; Nepal
</div>

</body>
</html>
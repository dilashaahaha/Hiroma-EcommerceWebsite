<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login &#8212; Hiroma</title>
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
      max-width: 440px;
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

    /* ── Remember me row ── */
    .remember-row {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-bottom: 24px;
    }
    .remember-label {
      display: flex;
      align-items: center;
      gap: 8px;
      font-size: 0.82rem;
      color: #4A4A3A;
      cursor: pointer;
    }
    .remember-label input[type="checkbox"] {
      accent-color: #1A3328;
      width: 15px;
      height: 15px;
      cursor: pointer;
    }
    .forgot-link {
      font-size: 0.82rem;
      color: #4A7C5F;
      transition: color 0.2s;
    }
    .forgot-link:hover { color: #1A3328; }

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

    /* ── Register link ── */
    .register-row {
      text-align: center;
      font-size: 0.83rem;
      color: #8A8A7A;
    }
    .register-row a {
      color: #1A3328;
      font-weight: 600;
      transition: color 0.2s;
    }
    .register-row a:hover { color: #4A7C5F; }

    /* ── Footer ── */
    .footer {
      text-align: center;
      padding: 20px;
      font-size: 0.75rem;
      color: #AEAE9E;
    }

    /* ── Responsive ── */
    @media (max-width: 480px) {
      .nav { padding: 0 20px; }
      .card { padding: 32px 24px 28px; }
      .card-title { font-size: 1.6rem; }
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

    <div class="card-eyebrow">Your account</div>
    <h1 class="card-title">Welcome <em>back</em></h1>
    <p class="card-sub">Sign in to continue to your Hiroma account.</p>

    <%-- Flash messages from session --%>
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

    <form action="${pageContext.request.contextPath}/LoginController" method="post">

      <!-- Email -->
      <div class="form-group">
        <label class="form-label" for="email">Email address</label>
        <input
          class="form-input"
          type="email"
          id="email"
          name="email"
          placeholder="you@example.com"
          value="${not empty requestScope.enteredEmail
                   ? requestScope.enteredEmail
                   : (not empty requestScope.rememberedEmail
                      ? requestScope.rememberedEmail : '')}"
          required
          autocomplete="email"
        />
      </div>

      <!-- Password -->
      <div class="form-group">
        <label class="form-label" for="password">Password</label>
        <input
          class="form-input"
          type="password"
          id="password"
          name="password"
          placeholder="Enter your password"
          required
          autocomplete="current-password"
        />
      </div>

      <!-- Remember me + Forgot password -->
      <div class="remember-row">
        <label class="remember-label">
          <input type="checkbox" name="rememberMe"
                 ${not empty requestScope.rememberedEmail ? 'checked' : ''}/>
          Remember me
        </label>
        <a href="#" class="forgot-link">Forgot password?</a>
      </div>

      <button type="submit" class="btn-submit">Sign in &#8594;</button>

    </form>

    <div class="divider">or</div>

    <div class="register-row">
      Don't have an account?
      <a href="${pageContext.request.contextPath}/RegisterController">
        Create one
      </a>
    </div>

  </div>
</div>

<!-- FOOTER -->
<div class="footer">
  &copy; 2025 Hiroma &middot; Himalayan Aroma &middot; Nepal
</div>

</body>
</html>
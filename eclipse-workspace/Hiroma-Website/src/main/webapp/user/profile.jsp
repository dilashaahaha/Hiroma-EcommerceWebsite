<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Profile &#8212; Hiroma</title>
  <style>
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
      position: sticky;
      top: 0;
      z-index: 100;
    }
    .nav-logo {
      font-size: 1.2rem;
      font-weight: 700;
      letter-spacing: 3px;
      color: #F5F0E6;
      text-transform: uppercase;
    }
    .nav-logo span { color: #C8893A; }
    .nav-links { display: flex; align-items: center; gap: 6px; }
    .nav-links a {
      font-size: 0.78rem;
      font-weight: 600;
      letter-spacing: 0.8px;
      color: rgba(245,240,230,0.65);
      padding: 6px 12px;
      border-radius: 3px;
      transition: color 0.2s, background 0.2s;
    }
    .nav-links a:hover { color: #F5F0E6; background: rgba(255,255,255,0.08); }
    .nav-right { display: flex; align-items: center; gap: 10px; }
    .nav-cart {
      background: #F5F0E6;
      color: #1A3328;
      padding: 6px 16px;
      border-radius: 3px;
      font-size: 0.78rem;
      font-weight: 700;
      letter-spacing: 0.5px;
    }
    .btn-logout {
      background: transparent;
      color: rgba(245,240,230,0.65);
      border: 1.5px solid rgba(245,240,230,0.25);
      padding: 6px 14px;
      border-radius: 3px;
      font-size: 0.78rem;
      font-weight: 600;
      letter-spacing: 0.5px;
      transition: all 0.2s;
    }
    .btn-logout:hover { color: #F5F0E6; border-color: rgba(245,240,230,0.6); }

    /* ── Page Header ── */
    .page-header {
      background: #1A3328;
      padding: 40px 48px 36px;
      border-bottom: 1px solid rgba(255,255,255,0.08);
    }
    .page-eyebrow {
      font-size: 10px;
      font-weight: 600;
      letter-spacing: 0.2em;
      text-transform: uppercase;
      color: #C8893A;
      margin-bottom: 8px;
      display: flex;
      align-items: center;
      gap: 8px;
    }
    .page-eyebrow::before { content: ''; width: 20px; height: 1px; background: #C8893A; }
    .page-title { font-size: 2rem; font-weight: 300; color: #F5F0E6; line-height: 1.2; }
    .page-title em { font-style: italic; color: #C8893A; }

    /* ── Content Layout ── */
    .content {
      flex: 1;
      max-width: 960px;
      margin: 0 auto;
      width: 100%;
      padding: 40px 24px 60px;
      display: grid;
      grid-template-columns: 220px 1fr;
      gap: 24px;
      align-items: start;
    }

    /* ── Sidebar ── */
    .sidebar {
      background: #FFFFFF;
      border: 1px solid #E0D8CC;
      border-radius: 6px;
      overflow: hidden;
      position: sticky;
      top: 78px;
    }
    .sidebar-user {
      background: #1A3328;
      padding: 24px 16px;
      text-align: center;
    }
    .user-avatar {
      width: 60px; height: 60px;
      border-radius: 50%;
      background: #C8893A;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 1.4rem;
      font-weight: 700;
      color: #F5F0E6;
      margin: 0 auto 10px;
    }
    .user-name { font-size: 0.88rem; font-weight: 600; color: #F5F0E6; margin-bottom: 3px; }
    .user-role { font-size: 0.7rem; letter-spacing: 0.12em; text-transform: uppercase; color: rgba(245,240,230,0.5); }
    .sidebar-nav { padding: 6px 0; }
    .sidebar-link {
      display: flex;
      align-items: center;
      gap: 10px;
      padding: 11px 18px;
      font-size: 0.84rem;
      color: #4A4A3A;
      border-left: 3px solid transparent;
      transition: background 0.2s, color 0.2s;
    }
    .sidebar-link:hover { background: #F5F0E6; color: #1A3328; }
    .sidebar-link.active {
      background: #F0E8D8;
      color: #1A3328;
      font-weight: 600;
      border-left-color: #C8893A;
    }

    /* ── Main Panel ── */
    .main-panel { display: flex; flex-direction: column; gap: 20px; }

    /* ── Card ── */
    .card { background: #FFFFFF; border: 1px solid #E0D8CC; border-radius: 6px; overflow: hidden; }
    .card-header {
      padding: 16px 22px;
      border-bottom: 1px solid #E0D8CC;
      display: flex;
      align-items: center;
      justify-content: space-between;
    }
    .card-title { font-size: 0.88rem; font-weight: 700; color: #1A3328; letter-spacing: 0.3px; }
    .card-body { padding: 22px; }

    /* ── Alerts ── */
    .alert {
      padding: 11px 14px;
      border-radius: 4px;
      font-size: 0.83rem;
      margin-bottom: 16px;
      border: 1px solid transparent;
    }
    .alert-error   { background: #F5DADA; color: #8C2B2B; border-color: #E0AAAA; }
    .alert-success { background: #D8EDD8; color: #2A5C2A; border-color: #A8CCA8; }

    /* ── Form ── */
    .form-row { display: grid; grid-template-columns: 1fr 1fr; gap: 14px; margin-bottom: 14px; }
    .form-group { margin-bottom: 14px; }
    .form-group:last-child { margin-bottom: 0; }
    .form-label {
      display: block;
      font-size: 0.74rem;
      font-weight: 600;
      letter-spacing: 0.08em;
      text-transform: uppercase;
      color: #4A4A3A;
      margin-bottom: 5px;
    }
    .form-input {
      width: 100%;
      padding: 10px 13px;
      border: 1.5px solid #E0D8CC;
      border-radius: 4px;
      font-size: 0.9rem;
      color: #1C1C1C;
      background: #FAFAF8;
      outline: none;
      transition: border-color 0.2s, background 0.2s;
    }
    .form-input:focus { border-color: #1A3328; background: #FFFFFF; }
    .form-input::placeholder { color: #AEAE9E; }
    .form-input:disabled { background: #F0EDE8; color: #8A8A7A; cursor: not-allowed; }
    .form-hint { font-size: 0.74rem; color: #8A8A7A; margin-top: 4px; }

    /* ── Buttons ── */
    .btn-primary {
      padding: 10px 22px;
      background: #1A3328;
      color: #F5F0E6;
      border: none;
      border-radius: 4px;
      font-size: 0.78rem;
      font-weight: 600;
      letter-spacing: 0.1em;
      text-transform: uppercase;
      cursor: pointer;
      transition: background 0.2s;
    }
    .btn-primary:hover { background: #2A5C3F; }
    .btn-ghost {
      padding: 10px 20px;
      background: transparent;
      color: #4A4A3A;
      border: 1.5px solid #E0D8CC;
      border-radius: 4px;
      font-size: 0.78rem;
      font-weight: 600;
      letter-spacing: 0.1em;
      text-transform: uppercase;
      cursor: pointer;
      transition: all 0.2s;
    }
    .btn-ghost:hover { border-color: #1A3328; color: #1A3328; }
    .btn-row { display: flex; gap: 10px; margin-top: 20px; }

    /* ── Info rows ── */
    .info-row {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 12px 0;
      border-bottom: 1px solid #F0EDE8;
      font-size: 0.86rem;
    }
    .info-row:last-child { border-bottom: none; }
    .info-label { color: #8A8A7A; font-size: 0.78rem; }
    .info-value { color: #1C1C1C; font-weight: 500; }

    /* ── Stats ── */
    .stats-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 14px; }
    .stat-card { background: #F5F0E6; border-radius: 4px; padding: 16px; text-align: center; }
    .stat-num { font-size: 1.5rem; font-weight: 700; color: #1A3328; line-height: 1.1; margin-bottom: 4px; }
    .stat-label { font-size: 0.7rem; letter-spacing: 0.1em; text-transform: uppercase; color: #8A8A7A; }

    /* ── Footer ── */
    .footer {
      text-align: center;
      padding: 18px;
      font-size: 0.75rem;
      color: #AEAE9E;
      border-top: 1px solid #E0D8CC;
      background: #FFFFFF;
    }

    /* ── Responsive ── */
    @media (max-width: 768px) {
      .nav { padding: 0 20px; }
      .nav-links { display: none; }
      .page-header { padding: 28px 20px 24px; }
      .content { grid-template-columns: 1fr; padding: 20px 16px 40px; }
      .sidebar { position: static; }
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
  <div class="nav-links">
    <a href="${pageContext.request.contextPath}/user/product.jsp">Shop</a>
    <a href="${pageContext.request.contextPath}/user/orders.jsp">Orders</a>
  </div>
  <div class="nav-right">
    <a href="${pageContext.request.contextPath}/user/cart.jsp" class="nav-cart">
      CART (<c:out value="${empty sessionScope.cart ? 0 : sessionScope.cart.size()}"/>)
    </a>
    <a href="${pageContext.request.contextPath}/LogoutController" class="btn-logout">
      SIGN OUT
    </a>
  </div>
</nav>

<!-- PAGE HEADER -->
<div class="page-header">
  <div class="page-eyebrow">Your account</div>
  <h1 class="page-title">My <em>profile</em></h1>
</div>

<!-- CONTENT -->
<div class="content">

  <!-- SIDEBAR -->
  <aside class="sidebar">
    <div class="sidebar-user">
      <div class="user-avatar">
        <c:choose>
          <c:when test="${not empty sessionScope.userName}">
            ${sessionScope.userName[0]}
          </c:when>
          <c:otherwise>U</c:otherwise>
        </c:choose>
      </div>
      <div class="user-name">
        <c:out value="${not empty sessionScope.userName ? sessionScope.userName : 'Guest'}"/>
      </div>
      <div class="user-role">
        <c:out value="${not empty sessionScope.userRole ? sessionScope.userRole : 'customer'}"/>
      </div>
    </div>
    <nav class="sidebar-nav">
      <a href="${pageContext.request.contextPath}/user/profile.jsp" class="sidebar-link active">
        &#9998; Edit Profile
      </a>
      <a href="${pageContext.request.contextPath}/user/orders.jsp" class="sidebar-link">
        &#128230; My Orders
      </a>
      <a href="${pageContext.request.contextPath}/user/cart.jsp" class="sidebar-link">
        &#128722; My Cart
      </a>
      <a href="${pageContext.request.contextPath}/LogoutController" class="sidebar-link">
        &#8592; Sign Out
      </a>
    </nav>
  </aside>

  <!-- MAIN PANEL -->
  <div class="main-panel">

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

    <!-- STATS -->
    <div class="card">
      <div class="card-body">
        <div class="stats-grid">
          <div class="stat-card">
            <div class="stat-num">
              <c:out value="${not empty requestScope.totalOrders ? requestScope.totalOrders : 0}"/>
            </div>
            <div class="stat-label">Orders</div>
          </div>
          <div class="stat-card">
            <div class="stat-num">
              <c:out value="${not empty requestScope.totalSpent ? requestScope.totalSpent : 0}"/>
            </div>
            <div class="stat-label">Rs Spent</div>
          </div>
          <div class="stat-card">
            <div class="stat-num">
              <c:out value="${not empty sessionScope.cart ? sessionScope.cart.size() : 0}"/>
            </div>
            <div class="stat-label">In Cart</div>
          </div>
        </div>
      </div>
    </div>

    <!-- ACCOUNT INFO (read-only) -->
    <div class="card">
      <div class="card-header">
        <span class="card-title">Account Information</span>
      </div>
      <div class="card-body">
        <div class="info-row">
          <span class="info-label">Email address</span>
          <span class="info-value">
            <c:out value="${not empty sessionScope.userEmail ? sessionScope.userEmail : '—'}"/>
          </span>
        </div>
        <div class="info-row">
          <span class="info-label">Role</span>
          <span class="info-value">
            <c:out value="${not empty sessionScope.userRole ? sessionScope.userRole : 'customer'}"/>
          </span>
        </div>
        <div class="info-row">
          <span class="info-label">Member since</span>
          <span class="info-value">
            <c:out value="${not empty requestScope.createdAt ? requestScope.createdAt : '—'}"/>
          </span>
        </div>
      </div>
    </div>

    <!-- EDIT PROFILE FORM -->
    <div class="card">
      <div class="card-header">
        <span class="card-title">Edit Profile</span>
      </div>
      <div class="card-body">
        <form action="${pageContext.request.contextPath}/ProfileController" method="post">
          <input type="hidden" name="action" value="updateProfile"/>

          <div class="form-row">
            <div class="form-group">
              <label class="form-label" for="fullName">Full name</label>
              <input
                class="form-input"
                type="text"
                id="fullName"
                name="fullName"
                placeholder="Your full name"
                value="${not empty requestScope.user ? requestScope.user.fullName
                         : sessionScope.userName}"
                required
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
                value="${not empty requestScope.user ? requestScope.user.phone : ''}"
              />
            </div>
          </div>

          <div class="form-group">
            <label class="form-label">Email address</label>
            <input
              class="form-input"
              type="email"
              value="${sessionScope.userEmail}"
              disabled
            />
            <p class="form-hint">Email cannot be changed.</p>
          </div>

          <div class="btn-row">
            <button type="submit" class="btn-primary">Save changes</button>
            <button type="reset" class="btn-ghost">Cancel</button>
          </div>
        </form>
      </div>
    </div>

    <!-- CHANGE PASSWORD FORM -->
    <div class="card">
      <div class="card-header">
        <span class="card-title">Change Password</span>
      </div>
      <div class="card-body">
        <form action="${pageContext.request.contextPath}/ProfileController" method="post">
          <input type="hidden" name="action" value="changePassword"/>

          <div class="form-group">
            <label class="form-label" for="currentPassword">Current password</label>
            <input class="form-input" type="password" id="currentPassword"
                   name="currentPassword" placeholder="Enter current password" required/>
          </div>

          <div class="form-row">
            <div class="form-group">
              <label class="form-label" for="newPassword">New password</label>
              <input class="form-input" type="password" id="newPassword"
                     name="newPassword" placeholder="At least 6 characters" required/>
            </div>
            <div class="form-group">
              <label class="form-label" for="confirmNewPassword">Confirm new password</label>
              <input class="form-input" type="password" id="confirmNewPassword"
                     name="confirmNewPassword" placeholder="Re-enter new password" required/>
            </div>
          </div>

          <div class="btn-row">
            <button type="submit" class="btn-primary">Update password</button>
          </div>
        </form>
      </div>
    </div>

  </div><!-- /main-panel -->
</div><!-- /content -->

<div class="footer">
  &copy; 2025 Hiroma &middot; Himalayan Aroma &middot; Nepal
</div>

</body>
</html>
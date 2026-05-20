<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile – Hiroma</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile.css">
</head>
<body>

<nav class="navbar">
    <a href="${pageContext.request.contextPath}/home" class="nav-brand">H<span>/</span>ROMA</a>
    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/shop">Shop</a>
    </div>
    <div class="nav-actions">
        <a href="${pageContext.request.contextPath}/logout">Sign out</a>
    </div>
</nav>

<!-- PROFILE HEADER -->
<div class="profile-header">
    <div class="profile-avatar">${fn:substring(sessionScope.loggedInUser.fullName,0,1)}</div>
    <div class="profile-header-info">
        <p class="profile-header-label">MY ACCOUNT</p>
        <h1>${sessionScope.loggedInUser.fullName}</h1>
        <p class="profile-header-sub">${sessionScope.loggedInUser.email} · Customer</p>
    </div>
</div>

<div class="profile-body">

    <!-- SIDEBAR -->
    <aside class="profile-sidebar">
        <p class="sidebar-section-label">ACCOUNT</p>
        <a href="${pageContext.request.contextPath}/user/profile" class="profile-nav-link active">Personal info</a>

        <p class="sidebar-section-label" style="margin-top:1.5rem">SHOPPING</p>
        <a href="${pageContext.request.contextPath}/user/orders" class="profile-nav-link">My orders</a>
        <a href="${pageContext.request.contextPath}/wishlist" class="profile-nav-link">Wishlist</a>

        <a href="${pageContext.request.contextPath}/logout" class="profile-signout">SIGN OUT</a>
    </aside>

    <!-- MAIN FORM -->
    <div class="profile-main">

        <c:if test="${not empty success}">
            <div class="alert-profile alert-success">✓ ${success}</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert-profile alert-error">${error}</div>
        </c:if>

        <!-- Personal Info -->
        <div class="profile-section">
            <h2>Personal information</h2>
            <p class="profile-section-sub">Your name, contact details and account info</p>

            <form action="${pageContext.request.contextPath}/user/profile" method="post">
                <input type="hidden" name="action" value="updateProfile"/>
                <div class="profile-form-grid">
                    <div class="field-group">
                        <label>FULL NAME *</label>
                        <input type="text" name="fullName" value="${sessionScope.loggedInUser.fullName}" required/>
                    </div>
                    <div class="field-group">
                        <label>EMAIL ADDRESS</label>
                        <input type="email" value="${sessionScope.loggedInUser.email}" disabled/>
                        <p class="field-note">Email cannot be changed. Contact support if needed.</p>
                    </div>
                    <div class="field-group">
                        <label>PHONE NUMBER</label>
                        <input type="text" name="phone" value="${sessionScope.loggedInUser.phone}"/>
                    </div>
                    <div class="field-group">
                        <label>DATE OF BIRTH</label>
                        <input type="date" name="dob" value="${sessionScope.loggedInUser.dob}"/>
                    </div>
                </div>
                <div class="profile-form-actions">
                    <button type="submit" class="btn-save">SAVE CHANGES</button>
                    <a href="${pageContext.request.contextPath}/dashboard" class="btn-discard">DISCARD</a>
                </div>
            </form>
        </div>

        <!-- Change Password -->
        <div class="profile-section">
            <h2>Change password</h2>
            <p class="profile-section-sub">Update your account password</p>

            <form action="${pageContext.request.contextPath}/user/profile" method="post">
                <input type="hidden" name="action" value="changePassword"/>
                <div class="profile-form-grid">
                    <div class="field-group">
                        <label>CURRENT PASSWORD</label>
                        <input type="password" name="currentPassword" required/>
                    </div>
                    <div class="field-group">
                        <label>NEW PASSWORD</label>
                        <input type="password" name="newPassword" required/>
                    </div>
                    <div class="field-group">
                        <label>CONFIRM NEW PASSWORD</label>
                        <input type="password" name="confirmPassword" required/>
                    </div>
                </div>
                <button type="submit" class="btn-save">CHANGE PASSWORD</button>
            </form>
        </div>

    </div>
</div>

</body>
</html>

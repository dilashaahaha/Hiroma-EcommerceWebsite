<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login – Hiroma</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>

<div class="page-wrapper">

    <!-- LEFT PANEL -->
    <div class="left-panel">
        <div class="brand">H<span>/</span>ROMA</div>
        <div class="left-content">
            <p class="label">— WELCOME BACK</p>
            <h1 class="headline">Your cup<br>awaits <em>you.</em></h1>
            <p class="subtext">Sign in to browse Nepal's finest organic teas, track your orders, and discover new arrivals from Himalayan gardens.</p>
        </div>
    </div>

    <!-- RIGHT PANEL -->
    <div class="right-panel">
        <div class="form-wrapper">

            <p class="form-label">— SIGN IN</p>
            <h2 class="form-title">Good to see<br>you again</h2>
            <p class="form-sub">New to Hiroma? <a href="${pageContext.request.contextPath}/register">Create a free account</a></p>

            <c:if test="${not empty error}">
                <div class="error-box">${error}</div>
            </c:if>

            <form action="${pageContext.request.contextPath}/login" method="post">

                <div class="field-group">
                    <label for="email">EMAIL ADDRESS</label>
                    <input type="email" id="email" name="email" placeholder="you@email.com" required />
                </div>

                <div class="field-group">
                    <label for="password">PASSWORD</label>
                    <input type="password" id="password" name="password" placeholder="Your password" required />
                </div>

                <button type="submit" class="btn-submit">SIGN IN TO HIROMA</button>

            </form>
        </div>
    </div>

</div>

</body>
</html>
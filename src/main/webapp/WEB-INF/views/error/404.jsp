<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>404 – Page Not Found</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
    <style>
        .error-page { text-align:center; padding: 6rem 2rem; }
        .error-code { font-family:'Playfair Display',serif; font-size:6rem; color:#e8e3d8; font-weight:400; }
        .error-title { font-family:'Playfair Display',serif; font-size:1.8rem; font-weight:400; margin-bottom:1rem; }
        .error-sub { font-size:0.82rem; color:#888; margin-bottom:2rem; }
        .btn-home { display:inline-block; padding:0.8rem 1.8rem; background:#1a2e20; color:#fff; text-decoration:none; font-size:0.7rem; letter-spacing:0.15em; border-radius:3px; }
    </style>
</head>
<body>
<nav class="navbar">
    <a href="${pageContext.request.contextPath}/home" class="nav-brand">H<span>/</span>ROMA</a>
</nav>
<div class="error-page">
    <div class="error-code">404</div>
    <h1 class="error-title">Page not found</h1>
    <p class="error-sub">The page you're looking for doesn't exist or has been moved.</p>
    <a href="${pageContext.request.contextPath}/home" class="btn-home">GO HOME</a>
</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pending Approval – Hiroma</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pendingApproval.css">
</head>
<body>

<div class="page-wrapper">

    <!-- LEFT PANEL -->
    <div class="left-panel">
        <div class="brand">H<span>/</span>ROMA</div>
        <div class="left-content">
            <p class="label">— ALMOST THERE</p>
            <h1 class="headline">Your journey<br>begins <em>soon.</em></h1>
            <p class="subtext">We review every account to ensure our community of tea lovers stays safe and genuine.</p>
        </div>
    </div>

    <!-- RIGHT PANEL -->
    <div class="right-panel">
        <div class="content-wrapper">

            <div class="icon-circle">
                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="none" viewBox="0 0 24 24" stroke="#c9a84c" stroke-width="1.5">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 6v6l4 2m6-2a10 10 0 11-20 0 10 10 0 0120 0z" />
                </svg>
            </div>

            <p class="form-label">— ACCOUNT PENDING</p>
            <h2 class="form-title">We're reviewing<br>your account</h2>

            <p class="description">
                Thank you for registering with Hiroma. Your account is currently under review by our team.
                You will be able to sign in once an administrator approves your registration.
            </p>

            <div class="info-box">
                <p class="info-title">What happens next?</p>
                <p class="info-text">Our team typically reviews new accounts within 24 hours. Once approved, you can log in and start exploring Nepal's finest teas.</p>
            </div>

            <div class="actions">
                <a href="${pageContext.request.contextPath}/login" class="btn-primary">BACK TO LOGIN</a>
                <a href="${pageContext.request.contextPath}/home" class="btn-secondary">BROWSE AS GUEST</a>
            </div>

        </div>
    </div>

</div>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register – Hiroma</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
</head>
<body>

<div class="page-wrapper">

    <!-- LEFT PANEL -->
    <div class="left-panel">
        <div class="brand">H<span>/</span>ROMA</div>
        <div class="left-content">
            <p class="label">— JOIN HIROMA</p>
            <h1 class="headline">Nepal's teas,<br>at your<br><em>fingertips.</em></h1>
            <p class="subtext">Create your account and start exploring authentic organic teas directly from Nepal's most prized gardens.</p>
        </div>
        <div class="steps">
            <div class="step">
                <span class="step-num">1</span>
                <div>
                    <p class="step-title">Create your account</p>
                    <p class="step-sub">Fill in your details below</p>
                </div>
            </div>
            <div class="step">
                <span class="step-num">2</span>
                <div>
                    <p class="step-title">Browse the collection</p>
                    <p class="step-sub">46+ Himalayan tea varieties</p>
                </div>
            </div>
            <div class="step">
                <span class="step-num">3</span>
                <div>
                    <p class="step-title">Order &amp; enjoy</p>
                    <p class="step-sub">Delivered across Nepal</p>
                </div>
            </div>
        </div>
    </div>

    <!-- RIGHT PANEL -->
    <div class="right-panel">
        <div class="form-wrapper">

            <p class="form-label">— CREATE ACCOUNT</p>
            <h2 class="form-title">Start your journey</h2>
            <p class="form-sub">Already have an account? <a href="${pageContext.request.contextPath}/login">Sign in instead</a></p>

            <!-- Error Message -->
            <% if (request.getAttribute("error") != null) { %>
            <div class="error-box">${error}</div>
            <% } %>

            <form action="${pageContext.request.contextPath}/register" method="post">

                <div class="field-group">
                    <label for="fullName">FULL NAME</label>
                    <input type="text" id="fullName" name="fullName" placeholder="Ram Sharma"
                           value="${param.fullName}" required />
                </div>

                <div class="field-group">
                    <label for="email">EMAIL ADDRESS</label>
                    <input type="email" id="email" name="email" placeholder="you@email.com"
                           value="${param.email}" required />
                </div>

                <div class="field-group">
                    <label for="phone">PHONE NUMBER</label>
                    <input type="text" id="phone" name="phone" placeholder="98XXXXXXXX"
                           value="${param.phone}" required />
                </div>

                <div class="field-group">
                    <label for="dob">DATE OF BIRTH</label>
                    <input type="date" id="dob" name="dob" required />
                </div>

                <div class="field-row">
                    <div class="field-group">
                        <label for="password">PASSWORD</label>
                        <input type="password" id="password" name="password" placeholder="Minimum 6 characters" required />
                    </div>
                    <div class="field-group">
                        <label for="confirmPassword">CONFIRM PASSWORD</label>
                        <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Repeat your password" required />
                    </div>
                </div>

                <button type="submit" class="btn-submit">CREATE MY ACCOUNT</button>

            </form>
        </div>
    </div>

</div>

</body>
</html>

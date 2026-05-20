<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Account - H/ROMA</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/profile.css">
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
            <li><a href="${pageContext.request.contextPath}/contact">CONTACT US</a></li>
        </ul>
        <div class="nav-actions">
            <a href="${pageContext.request.contextPath}/account" class="nav-account active">ACCOUNT</a>
            <a href="${pageContext.request.contextPath}/cart" class="nav-cart">CART (0)</a>
        </div>
    </nav>

    <div class="profile-header">
        <div class="profile-header-left">
            <div class="avatar">R</div>
            <div class="profile-info">
                <span class="my-account-label">MY ACCOUNT</span>
                <h1 class="profile-name">Rajesh Hamal</h1>
                <p class="profile-meta">hamalRajesh@email.com &bull; Customer &bull; Member since Jan 2025</p>
            </div>
        </div>
        <div class="profile-stats">
            <div class="stat">
                <span class="stat-number">8</span>
                <span class="stat-label"><i class="fas fa-box"></i> ORDERS PLACED</span>
            </div>
            <div class="stat">
                <span class="stat-number">3</span>
                <span class="stat-label"><i class="fas fa-star"></i> REVIEWS WRITTEN</span>
            </div>
            <div class="stat">
                <span class="stat-number">5</span>
                <span class="stat-label"><i class="fas fa-heart"></i> WISHLIST ITEMS</span>
            </div>
        </div>
    </div>

    <div class="profile-tabs">
        <a href="#" class="tab active">PERSONAL INFO</a>
        <a href="#" class="tab">ADDRESSES</a>
        <a href="#" class="tab">SECURITY</a>
        <a href="#" class="tab">PREFERENCES</a>
    </div>

    <div class="profile-main">

        <aside class="sidebar">
            <div class="sidebar-section">
                <p class="sidebar-section-label">ACCOUNT</p>
                <ul class="sidebar-nav">
                    <li><a href="#" class="sidebar-link active">
                        <i class="fas fa-user"></i> Personal info
                    </a></li>
                    <li><a href="#" class="sidebar-link">
                        <i class="fas fa-location-dot"></i> My addresses
                    </a></li>
                    <li><a href="#" class="sidebar-link">
                        <i class="fas fa-lock"></i> Security
                    </a></li>
                    <li><a href="#" class="sidebar-link">
                        <i class="fas fa-bell"></i> Notifications
                    </a></li>
                </ul>
            </div>
            <div class="sidebar-section">
                <p class="sidebar-section-label">SHOPPING</p>
                <ul class="sidebar-nav">
                    <li><a href="#" class="sidebar-link">
                        <i class="fas fa-box"></i> My orders <span class="badge">4</span>
                    </a></li>
                    <li><a href="#" class="sidebar-link">
                        <i class="fas fa-heart"></i> Wishlist
                    </a></li>
                    <li><a href="#" class="sidebar-link">
                        <i class="fas fa-star"></i> My reviews
                    </a></li>
                </ul>
            </div>
            <a href="${pageContext.request.contextPath}/logout" class="btn-signout">
                <i class="fas fa-right-from-bracket"></i> SIGN OUT
            </a>
        </aside>

        <main class="profile-content">

            <div class="alert-success">
                <i class="fas fa-circle-check"></i> Your profile was updated successfully.
            </div>

            <h2 class="content-heading">Personal information</h2>
            <p class="content-subheading">Your name, contact details and account info</p>

            <form action="${pageContext.request.contextPath}/profile" method="post">

    <div class="form-row">
        <div class="form-group">
            <label class="form-label" for="fullName">FULL NAME <span class="required">*</span></label>
            <input type="text" id="fullName" name="full_name"
                   value="${sessionScope.fullName != null ? sessionScope.fullName : 'Rajesh Hamal'}" required>
        </div>

        <div class="form-group">
            <label class="form-label" for="email">EMAIL ADDRESS</label>
            <input type="email" id="email" name="email" value="hamalRajesh@email.com" readonly>
            <p class="field-note">Email cannot be changed. Contact support if needed.</p>
        </div>
    </div>

    <div class="form-row">
        <div class="form-group">
            <label class="form-label" for="phone">PHONE NUMBER</label>
            <input type="text" id="phone" name="phone"
                   value="${sessionScope.phone != null ? sessionScope.phone : '9841234567'}">
        </div>

        <div class="form-group">
            <label class="form-label" for="dob">DATE OF BIRTH</label>
            <input type="date" id="dob" name="dob"
                   value="${sessionScope.dob != null ? sessionScope.dob : '1998-04-15'}">
        </div>
    </div>

    <div class="form-group full-width">
        <label class="form-label" for="bio">BIO <span class="optional">(optional)</span></label>
        <textarea id="bio" name="bio" rows="4">${sessionScope.bio != null ? sessionScope.bio : 'tea enthusiast'}</textarea>
    </div>

    <div class="form-actions">
        <button type="submit" class="btn-save">
            <i class="fas fa-floppy-disk"></i> SAVE CHANGES
        </button>

        <button type="reset" class="btn-discard">
            <i class="fas fa-rotate-left"></i> DISCARD
        </button>
    </div>

</form>
        </main>
    </div>

</body>
</html>
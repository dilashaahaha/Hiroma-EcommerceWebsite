<%--
    header.jsp
    Location: src/main/webapp/layout/header.jsp
    Author: M1
    Description: Navigation bar included at the top of every page.
                 Shows different links depending on whether user is logged in.
                 Import this into other JSP files using:
                 <%@ include file="/layout/header.jsp" %>
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.hiroma.model.User" %>
<%
    // Get the logged-in user from session (null if not logged in)
    User currentUser = (User) session.getAttribute("loggedInUser");

    // Get cart count from session to show the badge number
    Integer cartCount = (Integer) session.getAttribute("cartCount");
    if (cartCount == null) cartCount = 0;

    // Check if there is a one-time flash message to show
    String flashMsg = (String) session.getAttribute("flashMessage");
    if (flashMsg != null) {
        session.removeAttribute("flashMessage"); // remove so it only shows once
    }

    String ctx = request.getContextPath();
%>

<%-- Link global CSS if not already linked by the page --%>
<link rel="stylesheet" href="<%= ctx %>/css/global.css">
<link rel="stylesheet" href="<%= ctx %>/css/header.css">

<!-- ===== NAVIGATION BAR ===== -->
<nav class="navbar">

    <!-- Left: Logo -->
    <a class="nav-logo" href="<%= ctx %>/home">H<span>i</span>roma</a>

    <!-- Middle: Page links -->
    <ul class="nav-links">
        <li><a href="<%= ctx %>/home">Shop</a></li>
        <li><a href="<%= ctx %>/home?categoryId=1">Green Tea</a></li>
        <li><a href="<%= ctx %>/home?categoryId=2">Black Tea</a></li>
        <li><a href="<%= ctx %>/about.jsp">Our Story</a></li>
        <li><a href="<%= ctx %>/contact">Contact</a></li>
    </ul>

    <!-- Right: Account + Cart -->
    <div class="nav-right">

        <%-- If the user is logged in, show their name + logout --%>
        <% if (currentUser != null) { %>

            <%-- Admin gets a special link to the admin panel --%>
			<% if (currentUser != null && currentUser.isAdmin()) { %>
    		<a href="<%= ctx %>/admin/dashboard" class="nav-admin-btn">Admin Panel</a>
			<% } %>

            <a href="<%= ctx %>/orders" class="nav-icon-link" title="My Orders">&#128230;</a>
            <a href="<%= ctx %>/profile" class="nav-icon-link" title="My Account">&#128100;</a>

            <!-- Cart icon with item count badge -->
            <a href="<%= ctx %>/cart" class="nav-cart" title="Cart">
                &#128722;
                <% if (cartCount > 0) { %>
                    <span class="cart-badge"><%= cartCount %></span>
                <% } %>
            </a>

            <a href="<%= ctx %>/logout" class="nav-btn-outline">Sign out</a>

        <%-- If NOT logged in, show sign in button --%>
        <% } else { %>

            <a href="<%= ctx %>/cart" class="nav-cart" title="Cart">&#128722;</a>
            <a href="<%= ctx %>/authentication/login.jsp" class="nav-btn">Sign in</a>

        <% } %>
    </div>
</nav>

<%-- Flash message bar (appears once after actions like "Added to cart") --%>
<% if (flashMsg != null) { %>
    <div class="flash-bar">
        <%= flashMsg %>
    </div>
<% } %>

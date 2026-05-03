<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Users — Hiroma Admin</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/user.css">
</head>
<body>

<!-- SIDEBAR -->
<aside class="sidebar">
    <div class="sidebar-logo">
        <div class="name">H<span>i</span>roma</div>
        <div class="tag">Admin Panel</div>
    </div>
    <nav>
        <div class="sidebar-section-label">Overview</div>
        <a class="nav-item" href="${pageContext.request.contextPath}/dashboard"><span class="icon">&bull; </span> Dashboard</a>
        <div class="sidebar-section-label">Catalogue</div>
        <a class="nav-item" href="${pageContext.request.contextPath}/product"><span class="icon">&bull; </span> Products</a>
        <a class="nav-item" href="${pageContext.request.contextPath}/brands"><span class="icon">&bull; </span> Brands</a>
        <a class="nav-item" href="${pageContext.request.contextPath}/categories"><span class="icon">&bull; </span> Categories</a>
        <div class="sidebar-section-label">Orders &amp; Users</div>
        <a class="nav-item" href="${pageContext.request.contextPath}/orders"><span class="icon">&bull; </span> Orders</a>
        <a class="nav-item active" href="${pageContext.request.contextPath}/users"><span class="icon">&bull; </span> Users</a>
    </nav>
</aside>

<!-- MAIN -->
<div class="main">

    <!-- TOPBAR -->
    <div class="topbar">
        <div class="topbar-left">
            <div class="topbar-title">Users</div>
            <div class="topbar-crumb"><a href="${pageContext.request.contextPath}/dashboard">Dashboard</a> / Users</div>
        </div>
        <div class="topbar-right">
            <button class="btn-export">Export CSV</button>
        </div>
    </div>

    <div class="content">

        <!-- FILTERS -->
        <div class="filters-bar">
            <div class="search-wrap">
                <span class="search-icon">⌕</span>
                <input type="text" placeholder="Search by name, email…">
            </div>
            <select class="filter-select">
                <option>All roles</option>
                <option>Customer</option>
                <option>Vendor</option>
                <option>Admin</option>
            </select>
            <select class="filter-select">
                <option>All status</option>
                <option>Active</option>
                <option>Inactive</option>
            </select>
        </div>

        <!-- TABLE -->
        <div class="table-wrap">
            <table class="data-table">
                <thead>
                    <tr>
                        <th>User</th>
                        <th>Phone</th>
                        <th>Role</th>
                        <th>Status</th>
                        <th>Joined</th>
                        <th>Orders</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>

                    <!-- Row 1 -->
                    <tr>
                        <td>
                            <div class="user-cell">
                                <div class="user-avatar" style="background:#1A3328;color:#F5F0E6;">R</div>
                                <div>
                                    <div class="user-name">Rajesh Hamal</div>
                                    <div class="user-email">hamalrajesh@gmail.com</div>
                                </div>
                            </div>
                        </td>
                        <td>9841234567</td>
                        <td><span class="role-badge customer">Customer</span></td>
                        <td><span class="badge badge-active">Active</span></td>
                        <td>Jan 12, 2025</td>
                        <td>8</td>
                        <td>
                            <div class="actions-cell">
                                <a href="${pageContext.request.contextPath}/editUser?id=1" class="btn-action-edit">edit</a>
                                <a href="${pageContext.request.contextPath}/deleteUser?id=1" class="btn-action-delete" onclick="return confirm('Are you sure?')">✕</a>
                            </div>
                        </td>
                    </tr>

                    <!-- Row 2 -->
                    <tr>
                        <td>
                            <div class="user-cell">
                                <div class="user-avatar" style="background:#C8893A;color:#F5F0E6;">B</div>
                                <div>
                                    <div class="user-name">Binod Chaudhary</div>
                                    <div class="user-email">Chaudhary@gmail.com</div>
                                </div>
                            </div>
                        </td>
                        <td>9801234567</td>
                        <td><span class="role-badge vendor">Vendor</span></td>
                        <td><span class="badge badge-active">Active</span></td>
                        <td>Feb 3, 2025</td>
                        <td>—</td>
                        <td>
                            <div class="actions-cell">
                                <a href="${pageContext.request.contextPath}/editUser?id=2" class="btn-action-edit">edit</a>
                                <a href="${pageContext.request.contextPath}/deleteUser?id=2" class="btn-action-delete" onclick="return confirm('Are you sure?')">✕</a>
                            </div>
                        </td>
                    </tr>

                    <!-- Row 3 -->
                    <tr>
                        <td>
                            <div class="user-cell">
                                <div class="user-avatar" style="background:#4A7C5F;color:#F5F0E6;">P</div>
                                <div>
                                    <div class="user-name">Priyanka Karki</div>
                                    <div class="user-email">karki@gmail.com</div>
                                </div>
                            </div>
                        </td>
                        <td>9861234567</td>
                        <td><span class="role-badge customer">Customer</span></td>
                        <td><span class="badge badge-active">Active</span></td>
                        <td>Mar 8, 2025</td>
                        <td>3</td>
                        <td>
                            <div class="actions-cell">
                                <a href="${pageContext.request.contextPath}/editUser?id=3" class="btn-action-edit">edit</a>
                                <a href="${pageContext.request.contextPath}/deleteUser?id=3" class="btn-action-delete" onclick="return confirm('Are you sure?')">✕</a>
                            </div>
                        </td>
                    </tr>

                    <!-- Row 4 -->
                    <tr>
                        <td>
                            <div class="user-cell">
                                <div class="user-avatar" style="background:#6B8FA3;color:#F5F0E6;">T</div>
                                <div>
                                    <div class="user-name">Trishna Gurung</div>
                                    <div class="user-email">Trishna@gmail.com</div>
                                </div>
                            </div>
                        </td>
                        <td>9851234567</td>
                        <td><span class="role-badge vendor">Vendor</span></td>
                        <td><span class="badge badge-inactive">Inactive</span></td>
                        <td>Dec 1, 2024</td>
                        <td>—</td>
                        <td>
                            <div class="actions-cell">
                                <a href="${pageContext.request.contextPath}/editUser?id=4" class="btn-action-edit">edit</a>
                                <a href="${pageContext.request.contextPath}/deleteUser?id=4" class="btn-action-delete" onclick="return confirm('Are you sure?')">✕</a>
                            </div>
                        </td>
                    </tr>

                    <!-- Row 5 -->
                    <tr>
                        <td>
                            <div class="user-cell">
                                <div class="user-avatar" style="background:#8A4A7C;color:#F5F0E6;">M</div>
                                <div>
                                    <div class="user-name">Mohit Shrestha</div>
                                    <div class="user-email">mohit@gmail.com</div>
                                </div>
                            </div>
                        </td>
                        <td>9876545664</td>
                        <td><span class="role-badge customer">Customer</span></td>
                        <td><span class="badge badge-active">Active</span></td>
                        <td>Apr 2, 2025</td>
                        <td>12</td>
                        <td>
                            <div class="actions-cell">
                                <a href="${pageContext.request.contextPath}/editUser?id=5" class="btn-action-edit">edit</a>
                                <a href="${pageContext.request.contextPath}/deleteUser?id=5" class="btn-action-delete" onclick="return confirm('Are you sure?')">✕</a>
                            </div>
                        </td>
                    </tr>

                </tbody>
            </table>

            <!-- PAGINATION -->
            <div class="pagination">
                <span class="page-info">Showing 1–10 of 284 users</span>
                <div class="page-btns">
                    <button class="page-btn">‹</button>
                    <button class="page-btn active">1</button>
                    <button class="page-btn">2</button>
                    <button class="page-btn">3</button>
                    <button class="page-btn">›</button>
                </div>
            </div>
        </div>

    </div>
</div>

</body>
</html>

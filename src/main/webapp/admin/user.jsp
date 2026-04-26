<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management - H/ROMA Admin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.css">
</head>
<body>

<div class="admin-layout">

    <!-- ===== SIDEBAR ===== -->
    <aside class="admin-sidebar">
        <div class="sidebar-logo">
            <div class="logo-text">H/ROMA</div>
            <div class="logo-sub">ADMIN PANEL</div>
        </div>
        <div class="sidebar-section">
            <p class="sidebar-section-label">OVERVIEW</p>
            <ul class="sidebar-nav">
                <li><a href="${pageContext.request.contextPath}/admin/dashboard" class="sidebar-link">&#9783; Dashboard</a></li>
            </ul>
        </div>
        <div class="sidebar-section">
            <p class="sidebar-section-label">CATALOGUES</p>
            <ul class="sidebar-nav">
                <li><a href="${pageContext.request.contextPath}/admin/products" class="sidebar-link">&#8226; Products</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/brands" class="sidebar-link">&#8226; Brands</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/categories" class="sidebar-link">&#8226; Categories</a></li>
            </ul>
        </div>
        <div class="sidebar-section">
            <p class="sidebar-section-label">ORDERS &amp; USERS</p>
            <ul class="sidebar-nav">
                <li><a href="${pageContext.request.contextPath}/admin/orders" class="sidebar-link">&#8226; Orders</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/users" class="sidebar-link active">&#8226; Users</a></li>
            </ul>
        </div>
    </aside>

   
    <main class="admin-content">

        <div class="page-header">
            <div>
                <h1 class="page-title">Users</h1>
                <p class="breadcrumb">
                    <a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a> / Users
                </p>
            </div>
            <button class="btn-export" onclick="exportCSV()">EXPORT CSV</button>
        </div>

        <!-- Filters -->
        <div class="filters-bar">
            <div class="search-box">
                <span class="search-icon"></span>
                <input type="text" placeholder="Search by name, email..." id="searchInput" oninput="filterUsers()">
            </div>
            <select class="filter-select" id="roleFilter" onchange="filterUsers()">
                <option value="">All roles</option>
                <option value="CUSTOMER">Customer</option>
                <option value="VENDOR">Vendor</option>
                <option value="ADMIN">Admin</option>
            </select>
            <select class="filter-select" id="statusFilter" onchange="filterUsers()">
                <option value="">All status</option>
                <option value="ACTIVE">Active</option>
                <option value="INACTIVE">Inactive</option>
            </select>
        </div>

        <!-- Users Table -->
        <div class="table-wrapper">
            <table class="users-table" id="usersTable">
                <thead>
                    <tr>
                        <th>USER</th>
                        <th>PHONE</th>
                        <th>ROLE</th>
                        <th>STATUS</th>
                        <th>JOINED</th>
                        <th>ORDERS</th>
                        <th>ACTIONS</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <div class="user-cell">
                                <div class="user-avatar green">R</div>
                                <div>
                                    <div class="user-name">Rajesh Hamal</div>
                                    <div class="user-email">hamalrajesh@gmail.com</div>
                                </div>
                            </div>
                        </td>
                        <td>9841234567</td>
                        <td><span class="role-badge customer">CUSTOMER</span></td>
                        <td><span class="status-badge active">ACTIVE</span></td>
                        <td>Jan 12, 2025</td>
                        <td>8</td>
                        <td class="actions-cell">
                            <a href="${pageContext.request.contextPath}/admin/users/edit/1" class="action-edit">edit</a>
                            <button class="action-delete" onclick="deleteUser(this)">&#10005;</button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="user-cell">
                                <div class="user-avatar orange">B</div>
                                <div>
                                    <div class="user-name">Binod Chaudhary</div>
                                    <div class="user-email">Chaudhary@gmail.com</div>
                                </div>
                            </div>
                        </td>
                        <td>9801234567</td>
                        <td><span class="role-badge vendor">VENDOR</span></td>
                        <td><span class="status-badge active">ACTIVE</span></td>
                        <td>Feb 3, 2025</td>
                        <td>—</td>
                        <td class="actions-cell">
                            <a href="${pageContext.request.contextPath}/admin/users/edit/2" class="action-edit">edit</a>
                            <button class="action-delete" onclick="deleteUser(this)">&#10005;</button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="user-cell">
                                <div class="user-avatar purple">P</div>
                                <div>
                                    <div class="user-name">Priyanka Karki</div>
                                    <div class="user-email">Karki@gmail.com</div>
                                </div>
                            </div>
                        </td>
                        <td>9861234567</td>
                        <td><span class="role-badge customer">CUSTOMER</span></td>
                        <td><span class="status-badge active">ACTIVE</span></td>
                        <td>Mar 8, 2025</td>
                        <td>3</td>
                        <td class="actions-cell">
                            <a href="${pageContext.request.contextPath}/admin/users/edit/3" class="action-edit">edit</a>
                            <button class="action-delete" onclick="deleteUser(this)">&#10005;</button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="user-cell">
                                <div class="user-avatar teal">T</div>
                                <div>
                                    <div class="user-name">Trishna Gurung</div>
                                    <div class="user-email">Trishna@gmail.com</div>
                                </div>
                            </div>
                        </td>
                        <td>9851234567</td>
                        <td><span class="role-badge vendor">VENDOR</span></td>
                        <td><span class="status-badge inactive">INACTIVE</span></td>
                        <td>Dec 1, 2024</td>
                        <td>—</td>
                        <td class="actions-cell">
                            <a href="${pageContext.request.contextPath}/admin/users/edit/4" class="action-edit">edit</a>
                            <button class="action-delete" onclick="deleteUser(this)">&#10005;</button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="user-cell">
                                <div class="user-avatar blue">M</div>
                                <div>
                                    <div class="user-name">Mohit Shrestha</div>
                                    <div class="user-email">mohit@gmail.com</div>
                                </div>
                            </div>
                        </td>
                        <td>9876545664</td>
                        <td><span class="role-badge customer">CUSTOMER</span></td>
                        <td><span class="status-badge active">ACTIVE</span></td>
                        <td>Apr 2, 2025</td>
                        <td>12</td>
                        <td class="actions-cell">
                            <a href="${pageContext.request.contextPath}/admin/users/edit/5" class="action-edit">edit</a>
                            <button class="action-delete" onclick="deleteUser(this)">&#10005;</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Pagination -->
        <div class="pagination-bar">
            <span class="pagination-info">Showing 1–10 of 284 users</span>
            <div class="pagination">
                <button class="page-btn">&lsaquo;</button>
                <button class="page-btn active">1</button>
                <button class="page-btn">2</button>
                <button class="page-btn">3</button>
                <button class="page-btn">&rsaquo;</button>
            </div>
        </div>

    </main>
</div>

<script>
    function filterUsers() {
        const search = document.getElementById('searchInput').value.toLowerCase();
        const role = document.getElementById('roleFilter').value.toUpperCase();
        const status = document.getElementById('statusFilter').value.toUpperCase();
        const rows = document.querySelectorAll('#usersTable tbody tr');

        rows.forEach(row => {
        const name = row.querySelector('.user-name').textContent.toLowerCase();
            const email = row.querySelector('.user-email').textContent.toLowerCase();
            const rowRole = row.querySelector('.role-badge').textContent;
            const rowStatus = row.querySelector('.status-badge').textContent;

            const matchSearch = name.includes(search) || email.includes(search);
            const matchRole = !role || rowRole === role;
            const matchStatus = !status || rowStatus === status;

            row.style.display = (matchSearch && matchRole && matchStatus) ? '' : 'none';
        });
    }

    function deleteUser(btn) {
        if (confirm('Are you sure you want to delete this user?')) {
            btn.closest('tr').remove();
        }
    }

    function exportCSV() {
        alert('CSV export started.');
    }

    document.querySelectorAll('.page-btn').forEach(btn => {
        btn.addEventListener('click', function () {
            document.querySelectorAll('.page-btn').forEach(b => b.classList.remove('active'));
            if (this.textContent !== '‹' && this.textContent !== '›') {
                this.classList.add('active');
            }
        });
    });
</script>

</body>
</html>

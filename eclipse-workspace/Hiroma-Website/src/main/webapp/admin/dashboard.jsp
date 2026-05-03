<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>Admin Dashboard — Hiroma</title>
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,500;1,300;1,400&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
</head>
<body>

<aside class="sidebar">
  <div class="sidebar-logo">
    <div class="name">H<span>i</span>roma</div>
    <div class="tag">Admin Panel</div>
  </div>
  <nav style="flex:1;overflow-y:auto;">
    <div class="sidebar-section-label">Overview</div>
    <a class="nav-item active" href="${pageContext.request.contextPath}/admin/dashboard"><span class="icon">&bull;</span> Dashboard</a>
    <div class="sidebar-section-label">Catalogue</div>
    <a class="nav-item" href="${pageContext.request.contextPath}/admin/products"><span class="icon">&bull;</span> Products</a>
    <a class="nav-item" href="${pageContext.request.contextPath}/admin/brands"><span class="icon">&bull;</span> Brands <span class="badge-dot"></span></a>
    <a class="nav-item" href="${pageContext.request.contextPath}/admin/categories"><span class="icon">&bull;</span> Categories</a>
    <div class="sidebar-section-label">Orders &amp; Users</div>
    <a class="nav-item" href="${pageContext.request.contextPath}/admin/orders"><span class="icon">&bull;</span> Orders <span class="badge-dot"></span></a>
    <a class="nav-item" href="${pageContext.request.contextPath}/admin/users"><span class="icon">&bull;</span> Users</a>
    <div class="sidebar-section-label">System</div>
    <a class="nav-item" href="${pageContext.request.contextPath}/admin/reviews"><span class="icon">&bull;</span> Reviews</a>
    <a class="nav-item" href="${pageContext.request.contextPath}/admin/settings"><span class="icon">&bull;</span> Settings</a>
  </nav>
  <div class="sidebar-bottom">
    <div class="sidebar-user">
      <div class="user-avatar">A</div>
      <div>
        <div class="user-name">Admin</div>
        <div class="user-role">Super Admin</div>
      </div>
    </div>
  </div>
</aside>

<!-- MAIN -->
<div class="main">
  <div class="topbar">
    <div class="topbar-title">Good morning, Admin</div>
    <div class="topbar-right">
      <a href="${pageContext.request.contextPath}/admin/products/new" class="topbar-btn">+ Add Product</a>
    </div>
  </div>

  <div class="content">

    <div class="stats-grid">
      <div class="stat-card">
        <div class="stat-card-accent" style="background:var(--green-deep)"></div>
        <div class="stat-card-label">Total Products</div>
        <div class="stat-card-value"><c:out value="${not empty totalProducts ? totalProducts : '46'}"/></div>
        <div class="stat-card-change"><span class="change-up">&#8593; 8</span> added this month</div>
      </div>
      <div class="stat-card">
        <div class="stat-card-accent" style="background:var(--amber)"></div>
        <div class="stat-card-label">Pending Brands</div>
        <div class="stat-card-value"><c:out value="${not empty pendingBrands ? pendingBrands : '3'}"/></div>
        <div class="stat-card-change"><span class="change-up">Awaiting approval</span></div>
      </div>
      <div class="stat-card">
        <div class="stat-card-accent" style="background:#185FA5"></div>
        <div class="stat-card-label">Total Orders</div>
        <div class="stat-card-value"><c:out value="${not empty totalOrders ? totalOrders : '127'}"/></div>
        <div class="stat-card-change"><span class="change-up">&#8593; 12%</span> vs last month</div>
      </div>
      <div class="stat-card">
        <div class="stat-card-accent" style="background:#4A7C5F"></div>
        <div class="stat-card-label">Registered Users</div>
        <div class="stat-card-value"><c:out value="${not empty totalUsers ? totalUsers : '284'}"/></div>
        <div class="stat-card-change"><span class="change-up">&#8593; 24</span> this week</div>
      </div>
    </div>

    <!-- CHARTS -->
    <div class="charts-row">
      <div class="panel">
        <div class="panel-header">
          <div class="panel-title">Orders overview</div>
          <a href="${pageContext.request.contextPath}/admin/orders" class="panel-action">View all</a>
        </div>
        <div class="chart-bars">
          <div class="bar-col"><div class="bar" style="height:50%;background:var(--green-deep);"></div><div class="bar-label">Jan</div></div>
          <div class="bar-col"><div class="bar" style="height:70%;background:var(--green-deep);"></div><div class="bar-label">Feb</div></div>
          <div class="bar-col"><div class="bar" style="height:40%;background:var(--green-deep);"></div><div class="bar-label">Mar</div></div>
          <div class="bar-col"><div class="bar" style="height:85%;background:var(--amber);"></div><div class="bar-label">Apr</div></div>
          <div class="bar-col"><div class="bar" style="height:60%;background:var(--green-deep);"></div><div class="bar-label">May</div></div>
          <div class="bar-col"><div class="bar" style="height:75%;background:var(--green-deep);"></div><div class="bar-label">Jun</div></div>
          <div class="bar-col"><div class="bar" style="height:90%;background:var(--green-deep);"></div><div class="bar-label">Jul</div></div>
        </div>
      </div>
      <div class="panel">
        <div class="panel-header">
          <div class="panel-title">By category</div>
        </div>
        <div class="donut-wrap">
          <svg class="donut-svg" viewBox="0 0 100 100">
            <circle cx="50" cy="50" r="35" fill="none" stroke="#1A3328" stroke-width="18" stroke-dasharray="88 132" stroke-dashoffset="22"/>
            <circle cx="50" cy="50" r="35" fill="none" stroke="#C8893A" stroke-width="18" stroke-dasharray="53 167" stroke-dashoffset="-66"/>
            <circle cx="50" cy="50" r="35" fill="none" stroke="#4A7C5F" stroke-width="18" stroke-dasharray="33 187" stroke-dashoffset="-119"/>
            <circle cx="50" cy="50" r="35" fill="none" stroke="#E8B86D" stroke-width="18" stroke-dasharray="26 194" stroke-dashoffset="-152"/>
          </svg>
          <div class="donut-legend">
            <div class="legend-item"><div class="legend-dot" style="background:#1A3328"></div><span class="legend-label">Black Tea</span><span class="legend-val">40%</span></div>
            <div class="legend-item"><div class="legend-dot" style="background:#C8893A"></div><span class="legend-label">Green Tea</span><span class="legend-val">24%</span></div>
            <div class="legend-item"><div class="legend-dot" style="background:#4A7C5F"></div><span class="legend-label">Herbal</span><span class="legend-val">15%</span></div>
            <div class="legend-item"><div class="legend-dot" style="background:#E8B86D"></div><span class="legend-label">White Tea</span><span class="legend-val">12%</span></div>
          </div>
        </div>
      </div>
    </div>

    <!-- TABLES ROW -->
    <div class="table-row">
      <div class="panel">
        <div class="panel-header">
          <div class="panel-title">Recent orders</div>
          <a href="${pageContext.request.contextPath}/admin/orders" class="panel-action">View all</a>
        </div>
        <table class="data-table">
          <thead>
            <tr><th>Order</th><th>Customer</th><th>Amount</th><th>Status</th></tr>
          </thead>
          <tbody>
            <c:choose>
              <c:when test="${not empty recentOrders}">
                <c:forEach var="order" items="${recentOrders}">
               
                </c:forEach>
              </c:when>
              <c:otherlist>
                <tr><td>#1042</td><td>Brishika Thapa Magar</td><td>Rs 1,850</td><td><span class="badge badge-shipped">Shipped</span></td></tr>
                <tr><td>#1041</td><td>Dibyani Bashnet</td><td>Rs 2,200</td><td><span class="badge badge-pending">Pending</span></td></tr>
                <tr><td>#1040</td><td>Prashansa Magar</td><td>Rs 850</td><td><span class="badge badge-success">Delivered</span></td></tr>
                <tr><td>#1039</td><td>Dilasha Vaidya</td><td>Rs 3,400</td><td><span class="badge badge-success">Delivered</span></td></tr>
                <tr><td>#1038</td><td>Mina Gurung</td><td>Rs 1,200</td><td><span class="badge badge-pending">Pending</span></td></tr>
              </c:otherlist>
            </c:choose>
          </tbody>
        </table>
      </div>

      <div class="panel">
        <div class="panel-header">
          <div class="panel-title">Pending brands</div>
          <a href="${pageContext.request.contextPath}/admin/brands" class="panel-action">Review all</a>
        </div>
        <table class="data-table">
          <thead>
            <tr><th>Brand</th><th>Origin</th><th>Action</th></tr>
          </thead>
          <tbody>
            <c:choose>
              <c:when test="${not empty pendingBrandList}">
                <c:forEach var="brand" items="${pendingBrandList}">
                </c:forEach>
              </c:when>
              <c:otherwise>
                <tr>
                  <td><div class="product-cell">
                  <div class="product-thumb" >
                  <img src="${pageContext.request.contextPath}/images/illam.webp" width="42" height="42" 
                                 style="border-radius:4px; object-fit:cover;">
                  </div><div>Illam Organic<br><span style="font-size:11px;color:var(--text-light)">by Ram K.</span></div></div></td>
                  <td>Illam</td>
                  <td style="display:flex;gap:6px;padding-top:13px;">
                    <a href="${pageContext.request.contextPath}/admin/brands/approve?id=1" style="padding:5px 12px;background:var(--green-deep);color:var(--cream);border:none;border-radius:2px;font-size:10px;cursor:pointer;text-decoration:none;">&#10003;</a>
                    <a href="${pageContext.request.contextPath}/admin/brands/reject?id=1" style="padding:5px 12px;background:#FDECEA;color:#C0392B;border:1px solid #F09595;border-radius:2px;font-size:10px;cursor:pointer;text-decoration:none;">&#10007;</a>
                  </td>
                </tr>
                <tr>
                  <td><div class="product-cell">
                  <div class="product-thumb">
                  <img src="${pageContext.request.contextPath}/images/taplejung.jpg" width="42" height="42" 
                                 style="border-radius:4px; object-fit:cover;">
                  </div>
                  <div>Taplejung Hills<br><span style="font-size:11px;color:var(--text-light)">by Sita M.</span>
                  </div></div></td>
                  <td>Taplejung</td>
                  <td style="display:flex;gap:6px;padding-top:13px;">
                    <a href="${pageContext.request.contextPath}/admin/brands/approve?id=2" style="padding:5px 12px;background:var(--green-deep);color:var(--cream);border:none;border-radius:2px;font-size:10px;cursor:pointer;text-decoration:none;">&#10003;</a>
                    <a href="${pageContext.request.contextPath}/admin/brands/reject?id=2" style="padding:5px 12px;background:#FDECEA;color:#C0392B;border:1px solid #F09595;border-radius:2px;font-size:10px;cursor:pointer;text-decoration:none;">&#10007;</a>
                  </td>
                </tr>
                <tr>
                  <td><div class="product-cell">
                  <div class="product-thumb">
                  <img src="${pageContext.request.contextPath}/images/sunita.webp" width="42" height="42" 
                                 style="border-radius:4px; object-fit:cover;">
                  </div><div>Koshi Premium<br><span style="font-size:11px;color:var(--text-light)">by Hari B.</span></div></div></td>
                  <td>Dhankuta</td>
                  <td style="display:flex;gap:6px;padding-top:13px;">
                    <a href="${pageContext.request.contextPath}/admin/brands/approve?id=3" style="padding:5px 12px;background:var(--green-deep);color:var(--cream);border:none;border-radius:2px;font-size:10px;cursor:pointer;text-decoration:none;">&#10003;</a>
                    <a href="${pageContext.request.contextPath}/admin/brands/reject?id=3" style="padding:5px 12px;background:#FDECEA;color:#C0392B;border:1px solid #F09595;border-radius:2px;font-size:10px;cursor:pointer;text-decoration:none;">&#10007;</a>
                  </td>
                </tr>
              </c:otherwise>
            </c:choose>
          </tbody>
        </table>
      </div>
    </div>

  </div>
</div>

</body>
</html>

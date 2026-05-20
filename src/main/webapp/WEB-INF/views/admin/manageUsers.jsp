<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Users – Hiroma Admin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
</head>
<body>
<div class="admin-wrapper">
    <aside class="sidebar">
        <div class="sidebar-brand">H<span>/</span>ROMA</div>
        <p class="sidebar-label">ADMIN PANEL</p>
        <nav>
            <a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a>
            <a href="${pageContext.request.contextPath}/admin/products">Products</a>
            <a href="${pageContext.request.contextPath}/admin/categories">Categories</a>
            <a href="${pageContext.request.contextPath}/admin/orders">Orders</a>
            <a href="${pageContext.request.contextPath}/admin/users" class="active">Users</a>
        </nav>
        <a href="${pageContext.request.contextPath}/logout" class="sidebar-logout">Sign out</a>
    </aside>
    <main class="main-content">
        <div class="page-header">
            <div>
                <h1>Users</h1>
                <p>Dashboard / Users</p>
            </div>
        </div>

        <c:if test="${not empty param.success}">
            <div class="alert alert-success">${param.success}</div>
        </c:if>

        <div class="table-card">
            <table>
                <thead>
                    <tr>
                        <th>USER</th>
                        <th>PHONE</th>
                        <th>STATUS</th>
                        <th>JOINED</th>
                        <th>ACTIONS</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${empty users}">
                            <tr><td colspan="5" class="empty-msg">No users registered yet.</td></tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="user" items="${users}">
                                <tr>
                                    <td>
                                        <div class="user-cell">
                                            <div class="user-avatar">${fn:substring(user.fullName, 0, 1)}</div>
                                            <div>
                                                <div class="user-name">${user.fullName}</div>
                                                <div class="user-email">${user.email}</div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>${user.phone}</td>
                                    <td><span class="badge badge-${user.status}">${user.status}</span></td>
                                    <td>${user.createdAt}</td>
                                    <td class="action-btns">
                                        <c:if test="${user.status == 'pending'}">
                                            <form action="${pageContext.request.contextPath}/admin/users" method="post" style="display:inline">
                                                <input type="hidden" name="action" value="approve"/>
                                                <input type="hidden" name="userId" value="${user.id}"/>
                                                <button type="submit" class="btn-approve">Approve</button>
                                            </form>
                                            <form action="${pageContext.request.contextPath}/admin/users" method="post" style="display:inline">
                                                <input type="hidden" name="action" value="reject"/>
                                                <input type="hidden" name="userId" value="${user.id}"/>
                                                <button type="submit" class="btn-reject">Reject</button>
                                            </form>
                                        </c:if>
                                        <form action="${pageContext.request.contextPath}/admin/users" method="post" style="display:inline">
                                            <input type="hidden" name="action" value="delete"/>
                                            <input type="hidden" name="userId" value="${user.id}"/>
                                            <button type="submit" class="btn-delete" onclick="return confirm('Delete this user?')">✕</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>
    </main>
</div>
</body>
</html>

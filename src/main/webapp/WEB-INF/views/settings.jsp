<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inventory Management System - Settings</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #4361ee;
            --secondary: #3f37c9;
            --success: #4cc9f0;
            --danger: #f72585;
            --warning: #f8961e;
            --info: #4895ef;
            --light: #f8f9fa;
            --dark: #212529;
            --gray: #6c757d;
            --sidebar-width: 250px;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f5f7fb;
            color: var(--dark);
            display: flex;
            min-height: 100vh;
        }
        
        /* Sidebar Styles */
        .sidebar {
            width: var(--sidebar-width);
            background: var(--primary);
            color: white;
            height: 100vh;
            position: fixed;
            padding: 20px 0;
            transition: all 0.3s ease;
        }
        
        .logo {
            text-align: center;
            padding: 20px 0;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .logo h2 {
            font-weight: 600;
        }
        
        .menu {
            margin-top: 30px;
        }
        
        .menu-item {
            padding: 15px 25px;
            display: flex;
            align-items: center;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .menu-item:hover, .menu-item.active {
            background: var(--secondary);
        }
        
        .menu-item i {
            margin-right: 10px;
            font-size: 18px;
        }
        
        .menu a{
        	text-decoration:none;
        	color:white;
        }
        
        /* Main Content */
        .main-content {
            flex: 1;
            margin-left: var(--sidebar-width);
            padding: 20px;
        }
        
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 1px solid #e0e0e0;
        }
        
        .heading {
            display: flex;
            align-items: center;
            padding: 8px 20px;
            width: 40%;
        }
        
        .user-info {
            display: flex;
            align-items: center;
        }
        
        .user-info img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
        }
        
        /* Settings Styles */
        .settings-container {
            display: flex;
            gap: 20px;
        }
        
        .settings-sidebar {
            width: 250px;
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.05);
            height: fit-content;
        }
        
        .settings-category {
            padding: 12px 15px;
            border-radius: 5px;
            cursor: pointer;
            margin-bottom: 5px;
            transition: all 0.3s;
        }
        
        .settings-category:hover, .settings-category.active {
            background: var(--primary);
            color: white;
        }
        
        .settings-category i {
            margin-right: 10px;
            width: 20px;
            text-align: center;
        }
        
        .settings-content {
            flex: 1;
            background: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.05);
        }
        
        .settings-section {
            margin-bottom: 30px;
        }
        
        .settings-section h2 {
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 1px solid #e0e0e0;
        }
        
        /* Forms */
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
        }
        
        .form-control {
            width: 100%;
            padding: 12px;
            border: 1px solid #e0e0e0;
            border-radius: 5px;
            font-size: 16px;
        }
        
        .form-control:focus {
            outline: none;
            border-color: var(--primary);
        }
        
        .form-row {
            display: flex;
            gap: 20px;
        }
        
        .form-row .form-group {
            flex: 1;
        }
        
        .form-check {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        
        .form-check input {
            margin-right: 10px;
        }
        
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s;
        }
        
        .btn-primary {
            background: var(--primary);
            color: white;
        }
        
        .btn-primary:hover {
            background: var(--secondary);
        }
        
        .btn-secondary {
            background: #e0e0e0;
            color: var(--dark);
        }
        
        .btn-secondary:hover {
            background: #d0d0d0;
        }
        
        /* User List */
        .user-list {
            width: 100%;
            border-collapse: collapse;
        }
        
        .user-list th, .user-list td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }
        
        .user-list th {
            font-weight: 600;
            color: var(--gray);
        }
        
        .user-list tr:hover {
            background: #f9f9f9;
        }
        
        .user-role {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
        }
        
        .role-admin {
            background: #e6f7ee;
            color: #00a65a;
        }
        
        .role-manager {
            background: #e6f0f7;
            color: #006adc;
        }
        
        .role-user {
            background: #fef5e7;
            color: #f8961e;
        }
        
        .action-btn {
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 5px;
        }
        
        .btn-edit {
            background: var(--info);
            color: white;
        }
        
        .btn-delete {
            background: var(--danger);
            color: white;
        }
        
        /* Toggle Switch */
        .toggle-switch {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 30px;
        }
        
        .toggle-switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }
        
        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            transition: .4s;
            border-radius: 30px;
        }
        
        .slider:before {
            position: absolute;
            content: "";
            height: 22px;
            width: 22px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            transition: .4s;
            border-radius: 50%;
        }
        
        input:checked + .slider {
            background-color: var(--primary);
        }
        
        input:checked + .slider:before {
            transform: translateX(30px);
        }
        
        /* Responsive */
        @media (max-width: 992px) {
            .sidebar {
                width: 70px;
            }
            
            .sidebar .logo h2, .sidebar .menu-item span {
                display: none;
            }
            
            .sidebar .menu-item {
                justify-content: center;
            }
            
            .sidebar .menu-item i {
                margin-right: 0;
            }
            
            .main-content {
                margin-left: 70px;
            }
            
            .settings-container {
                flex-direction: column;
            }
            
            .settings-sidebar {
                width: 100%;
            }
            
            .form-row {
                flex-direction: column;
                gap: 0;
            }
        }
        
        @media (max-width: 768px) {
            .search-bar {
                width: 70%;
            }
        }
    </style>
</head>
<body>
<c:if test="${not empty msg}">
    <script>alert("${msg}");</script>
</c:if>

<!-- Sidebar -->
<div class="sidebar">
    <div class="logo">
        <h2>StockMaster</h2>
    </div>
    <div class="menu">
        <div class="menu-item active">
            <i class="fas fa-home"></i>
            <a href="${pageContext.request.contextPath}/">Dashboard</a>
        </div>
        <div class="menu-item">
            <i class="fas fa-box"></i>
            <a href="${pageContext.request.contextPath}/product">Products</a>
        </div>
        <div class="menu-item">
            <i class="fas fa-cubes"></i>
            <a href="${pageContext.request.contextPath}/inventory">Inventory</a>
        </div>
        <div class="menu-item">
            <i class="fas fa-shopping-cart"></i>
            <a href="${pageContext.request.contextPath}/order">Orders</a>
        </div>
        <div class="menu-item">
            <i class="fas fa-cog"></i>
            <a href="#">Settings</a>
        </div>
    </div>
</div>

<!-- Main Content -->
<div class="main-content">
    <!-- Header -->
    <div class="header">
        <div class="heading">
            <h1>Manage Your Crew</h1>
        </div>
        <div class="user-info">
            <i class="fas fa-bell" style="margin-right: 20px; font-size: 20px;"></i>
            <img src="https://ui-avatars.com/api/?name=Admin+User&background=random" alt="Admin User">
            <span style="margin-left: 10px;">Admin User</span>
        </div>
    </div>

    <div class="settings-content">
    <!-- Account Settings -->
    <div class="settings-section">
        <h2>Account Settings</h2>
        <form action="${pageContext.request.contextPath}/settings"
              method="post" enctype="multipart/form-data">
           <input type="hidden" name="id" value="${user.id}" />
            <div class="form-row">
                <div class="form-group">
                    <label for="firstName">First Name</label>
                    <input id="firstName" class="form-control" name="firstName" placeholder="Rahul" value="${user.firstName}" />
                </div>
                <div class="form-group">
                    <label for="lastName">Last Name</label>
                    <input id="lastName" class="form-control" name="lastName" placeholder="Sharma" value="${user.lastName}" />
                </div>
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <input id="email" class="form-control" name="email" placeholder="rahul.sharma@example.com" value="${user.email}" />
            </div>

            <div class="form-group">
                <label for="phone">Phone</label>
                <input id="phone" class="form-control" name="phone" placeholder="9876543210" value="${user.phone}" />
            </div>

            <div class="form-group">
                <label for="profilePhoto">Profile Photo</label>
                <input type="file" id="profilePhoto" name="profilePhoto" />
            </div>

            <button class="btn btn-primary" type="submit">Save Changes</button>
        </form>
    </div>
</div>


        <!-- User Management -->
        <div class="settings-section">
            <h2>User Management</h2>
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                <h3>System Users</h3>
                <button id="addInventoryBtn" class="btn btn-primary">
                    <i class="fas fa-plus"></i> Add User
                </button>
            </div>
				<table class="user-list">
					<thead>
						<tr>
							<th>User Id</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Email</th>
							<th>Phone</th>
							<th>Role</th>
							<th>Status</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="u" items="${users}" end="4">
							<tr>
								<td>${u.id}</td>
								<td>${u.firstName}</td>
								<td>${u.lastName}</td>
								<td>${u.email}</td>
								<td>${u.phone}</td>
								<td><c:choose>
										<c:when test="${u.role eq 'ADMIN'}">
											<span class="user-role role-admin">${u.role}</span>
										</c:when>
										<c:when test="${u.role eq 'MANAGER'}">
											<span class="user-role role-manager">${u.role}</span>
										</c:when>
										<c:when test="${u.role eq 'USER'}">
											<span class="user-role role-user">${u.role}</span>
										</c:when>
										<c:otherwise>
											<span class="status">${u.role}</span>
										</c:otherwise>
									</c:choose></td>
								<td>${u.status}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
    </div>
</div>

<script>
document.getElementById("addInventoryBtn").addEventListener("click", function(e) {
	e.preventDefault();
        alert("Only HR can add users!");
});
    // Menu item active state
    const menuItems = document.querySelectorAll('.menu-item');
    menuItems.forEach(item => {
        item.addEventListener('click', function() {
            menuItems.forEach(i => i.classList.remove('active'));
            this.classList.add('active');
        });
    });
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inventory Management System - Products</title>
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
        
        .menu-item:hover {
            background: var(--secondary);
        }
        
        .menu-item.active{
             background: #003153;
        }
        
        .menu-item i {
            margin-right: 10px;
            font-size: 18px;
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
        
        .search-bar {
            display: flex;
            align-items: center;
            background: white;
            border-radius: 30px;
            padding: 8px 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            width: 40%;
        }
        
        .search-bar input {
            border: none;
            outline: none;
            padding: 8px;
            width: 100%;
            font-size: 16px;
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
        
        /* Content Sections */
        .content-section {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.05);
            margin-bottom: 30px;
        }
        
        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
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
        
        .btn-success {
            background: var(--success);
            color: white;
        }
        
        /* Filters */
        .filters {
            display: flex;
            gap: 15px;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }
        
        .filter-group {
            display: flex;
            flex-direction: column;
        }
        
        .filter-group label {
            margin-bottom: 8px;
            font-weight: 500;
            font-size: 14px;
        }
        
        .filter-select {
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #e0e0e0;
            min-width: 150px;
        }
        
        /* Table Styles */
        table {
            width: 100%;
            border-collapse: collapse;
        }
        
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }
        
        th {
            font-weight: 600;
            color: var(--gray);
            cursor: pointer;
        }
        
        th:hover {
            color: var(--primary);
        }
        
        tr:hover {
            background: #f9f9f9;
        }
        
        .status {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
        }
        
        .status-in-stock {
            background: #e6f7ee;
            color: #00a65a;
        }
        
        .status-low-stock {
            background: #fef5e7;
            color: #f8961e;
        }
        
        .status-out-of-stock {
            background: #fdeaea;
            color: #f72585;
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
        
        .btn-view {
            background: var(--success);
            color: white;
        }
        
        /* Pagination */
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
            gap: 10px;
        }
        
        .pagination-btn {
            padding: 8px 15px;
            border: 1px solid #e0e0e0;
            background: white;
            border-radius: 5px;
            cursor: pointer;
        }
        
        .pagination-btn.active {
            background: var(--primary);
            color: white;
            border-color: var(--primary);
        }
        .pagination a{
        	text-decoration:none;
        }
        
        /* Modal */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.5);
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }
        
        .modal-content {
            background: white;
            border-radius: 10px;
            width: 600px;
            max-width: 90%;
            max-height: 50vh;
            overflow-y: auto;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }
        
        .close {
            font-size: 24px;
            cursor: pointer;
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
            
            .form-row {
                flex-direction: column;
                gap: 0;
            }
        }
        
        @media (max-width: 768px) {
            .search-bar {
                width: 70%;
            }
            
            .filters {
                flex-direction: column;
            }
            
            .filter-select {
                width: 100%;
            }
        }
         .menu a{
            text-decoration: none;
            color: white;
        }
    </style>
</head>
<body>
<c:if test="${not empty msg}">
		<script type="text/javascript">
        alert("${msg}");
    </script>
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
                <a href="#">Products</a>
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
                <a href="${pageContext.request.contextPath}/settings">Settings</a>
            </div>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Header -->
        <div class="header">
            <div class="search-bar">
                <i class="fas fa-search"></i>
                <form action="/product/search" method="get">
					<input type="text" name="keyword" placeholder="Search product..." required />
				</form>
            </div>
            <div class="user-info">
                <i class="fas fa-bell" style="margin-right: 20px; font-size: 20px;"></i>
                <img src="https://ui-avatars.com/api/?name=Admin+User&background=random" alt="User">
                <a href="${pageContext.request.contextPath}/settings" style="margin-left: 10px; text-decoration:none; color:black;">Admin User</a>
            </div>
        </div>

        <!-- Products Section -->
        <div class="content-section">
            <div class="section-header">
                <h2>Product Management</h2>
                <button class="btn btn-primary" onclick="openModal()">
                    <i class="fas fa-plus"></i> Add Product
                </button>
            </div>

           
            <!-- Products Table -->
<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>SKU</th>
            <th>Category</th>
            <th>Price</th>
            <th>Stock</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
    </thead>

    <c:forEach var="pro" items="${product}">
        <tbody>
            <tr>
                <td>${pro.productId}</td>
                <td>${pro.productName}</td>
                <td>${pro.sku}</td>
                <td>${pro.category}</td>
                <td>₹${pro.price}</td>
                <td>${pro.stock}</td>
                <td>
                    <c:choose>
                        <c:when test="${pro.status eq 'In Stock'}">
                            <span class="status status-in-stock">${pro.status}</span>
                        </c:when>
                        <c:when test="${pro.status eq 'Low Stock'}">
                            <span class="status status-low-stock">${pro.status}</span>
                        </c:when>
                        <c:when test="${pro.status eq 'Out of Stock'}">
                            <span class="status status-out-of-stock">${pro.status}</span>
                        </c:when>
                        <c:otherwise>
                            <span class="status">${pro.status}</span>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/edit/${pro.productId}" class="action-btn btn-edit">
                        <i class="fas fa-edit"></i>
                    </a>
                    <form action="${pageContext.request.contextPath}/delete/${pro.productId}" method="post" style="display: inline;">
                        <button type="submit" class="action-btn btn-delete">
                            <i class="fas fa-trash"></i>
                        </button>
                    </form>
                </td>
            </tr>
        </tbody>
    </c:forEach>
</table>

<!-- Pagination -->
<div class="pagination">
    <c:if test="${currentPage > 0}">
        <a href="?page=${currentPage - 1}&category=${selectedCategory}" class="pagination-btn">
            <i class="fas fa-chevron-left"></i>
        </a>
    </c:if>

   <c:if test="${totalPages > 0}">
    <c:forEach var="i" begin="0" end="${totalPages - 1}">
        <a href="?page=${i}&category=${selectedCategory}" 
           class="pagination-btn ${i == currentPage ? 'active' : ''}">
            ${i + 1}
        </a>
    </c:forEach>
</c:if>

    <c:if test="${currentPage < totalPages - 1}">
        <a href="?page=${currentPage + 1}&category=${selectedCategory}" class="pagination-btn">
            <i class="fas fa-chevron-right"></i>
        </a>
    </c:if>
</div>
    </div>

    <!-- Add Product Modal -->
    <div class="modal" id="addProductModal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Add New Product</h2>
                <span class="close" onclick="closeModal()">&times;</span>
            </div>
            <form action="/addProduct" method="post">
                <div class="form-row">
                    <div class="form-group">
                        <label for="productName">Product Name</label> <input type="text"
						name="productName" id="productName" class="form-control"
						placeholder="Enter product name">
                    </div>
                    <div class="form-group">
                       <label for="sku">SKU</label> <input type="text" name="sku" id="sku"
						class="form-control" placeholder="Enter SKU">
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="category">Category</label> <select id="category"
						class="form-control" name="category">
						<option value="">Select Category</option>
						<option value="electronics">Electronics</option>
						<option value="clothing">Clothing</option>
						<option value="furniture">Furniture</option>
						<option value="footwear">Footwear</option>
					</select>
                    </div>
                    <div class="form-group">
                        <label for="price">Price</label> <input type="number" name="price"
						id="price" class="form-control" placeholder="Enter price">
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="stock">Stock Quantity</label> 
					<input type="number" name="stock" id="stock" class="form-control" placeholder="Enter quantity">
                    </div>
                    <div class="form-group">
                       <label for="status">Status</label> <input type="text" id="status"
						name="status" class="form-control"
						placeholder="Enter product status">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary" style="width: 100%;"  >Add Product</button>
              
            </form>
        </div>
    </div>

    <script>
        // Modal functionality
        function openModal() {
            document.getElementById('addProductModal').style.display = 'flex';
        }
        
        function closeModal() {
            document.getElementById('addProductModal').style.display = 'none';
        }
        
        // Close modal when clicking outside
        window.onclick = function(event) {
            const modal = document.getElementById('addProductModal');
            if (event.target === modal) {
                closeModal();
            }
        };
        
        // Menu item active state
        const menuItems = document.querySelectorAll('.menu-item');
        menuItems.forEach(item => {
            item.addEventListener('click', function() {
                menuItems.forEach(i => i.classList.remove('active'));
                this.classList.add('active');
                
                // In a real application, this would load the appropriate content
                if(this.querySelector('span').textContent === 'Products') {
                    document.querySelector('.main-content').innerHTML = `
                        <div class="header">
                            <div class="search-bar">
                                <i class="fas fa-search"></i>
                                <input type="text" placeholder="Search products...">
                            </div>
                            <div class="user-info">
                                <i class="fas fa-bell" style="margin-right: 20px; font-size: 20px;"></i>
                                <img src="https://ui-avatars.com/api/?name=Admin+User&background=random" alt="User">
                                <span style="margin-left: 10px;">Admin User</span>
                            </div>
                        </div>
                        <div style="display: flex; justify-content: center; align-items: center; height: 80vh;">
                            <h2>Loading Products...</h2>
                        </div>
                    `;
                    
                    // Simulate loading time
                    setTimeout(() => {
                        document.location.reload();
                    }, 500);
                }
            });
        });
        
        // Table sorting functionality (basic example)
        const tableHeaders = document.querySelectorAll('th');
        tableHeaders.forEach(header => {
            header.addEventListener('click', () => {
                // In a real application, this would sort the table data
                alert('Table sorting would be implemented here');
            });
        });
    </script>
</body>
</html>
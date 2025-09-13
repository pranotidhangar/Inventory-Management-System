<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inventory Management - Sold Products</title>
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
        
        .menu-item a{
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
        
        /* Dashboard Cards */
        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        
        .card {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.05);
            transition: transform 0.3s;
        }
        
        .card:hover {
            transform: translateY(-5px);
        }
        
        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }
        
        .card-icon {
            width: 50px;
            height: 50px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            color: white;
        }
        
        .bg-primary { background: var(--primary); }
        .bg-success { background: var(--success); }
        .bg-warning { background: var(--warning); }
        .bg-danger { background: var(--danger); }
        
        .card h3 {
            font-size: 24px;
            margin-bottom: 5px;
        }
        
        .card p {
            color: var(--gray);
            font-size: 14px;
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
            padding: 8px 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 5px;
            transition: all 0.3s;
        }
        
        .btn-view {
            background: var(--success);
            color: white;
        }
        
        .btn-view:hover {
            background: #3ab7d8;
        }
        
        .btn-edit {
            background: var(--info);
            color: white;
        }
        
        .btn-edit:hover {
            background: #3a7abf;
        }
        
        .btn-delete {
            background: var(--danger);
            color: white;
        }
        
        .btn-delete:hover {
            background: #d11467;
        }
        
        .btn-restock {
            background: var(--warning);
            color: white;
        }
        
        .btn-restock:hover {
            background: #e0861a;
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
            .dashboard-cards {
                grid-template-columns: 1fr;
            }
            
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
            <div class="menu-item">
                <i class="fas fa-home"></i>
                 <a href="${pageContext.request.contextPath}/">Dashboard</a>
            </div>
            <div class="menu-item">
                <i class="fas fa-box"></i>
                 <a href="${pageContext.request.contextPath}/product">Products</a>
            </div>
            <div class="menu-item active">
                <i class="fas fa-cubes"></i>
                 <a href="#">Inventory</a>
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
                 <form action="/inventory" method="get">
                <input type="text"  name="keyword" placeholder="Search inventory..." required>
                </form>
            </div>
        </div>

        <!-- Inventory Section -->
        <div class="content-section">
            <div class="section-header">
                <h2 style="text-align:center;">Our Inventory</h2>
                 <button  id="addInventoryBtn" class="btn btn-primary">
                    <i class="fas fa-plus"></i> Add Inventory
                </button>
            </div>

            <!-- Filters -->
            <div class="filters">
            <form action="/inventory" method="get">
                <div class="filter-group">
                    <label>Category</label>
                     <select class="filter-select" name="category" onchange="this.form.submit()">
                  <option value="All Categories" ${selectedCategory == null || selectedCategory == 'All Categories' ? 'selected' : ''}>All Categories</option>
                <option value="Electronics" ${selectedCategory == 'Electronics' ? 'selected' : ''}>Electronics</option>
                <option value="Clothing" ${selectedCategory == 'Clothing' ? 'selected' : ''}>Clothing</option>
                <option value="Furniture" ${selectedCategory == 'Furniture' ? 'selected' : ''}>Furniture</option>
                <option value="Footwear" ${selectedCategory == 'Footwear' ? 'selected' : ''}>Footwear</option>
            </select>
                </div>
                </form>
                <div class="filter-group">
                    <label>Actions</label>
                    <button class="btn btn-primary">
                        <i class="fas fa-sync"></i> Apply
                    </button>
                </div>
            </div>

            <!-- Products Table -->
            <table>
                <thead>
                    <tr>
                        <th>Sr.No</th>
                        <th>Product ID</th>
                        <th>Image</th>
                        <th>Product Name</th>
                        <th>Category</th>
                        <th>Suppliers</th>
                        <th>Price</th>
                        <th>Total Revenue</th>
                        <th>Actions</th>
                    </tr>
                </thead>
				<tbody>
					<c:forEach var="invo" items="${inventory}" varStatus="status">
						<tr>
							<td>${currentPage * 5 + status.index + 1}</td>
							<!-- Serial number -->
							<td>${invo.productId}</td>
							<td><img src="${invo.productImg}" alt="${invo.productName}"
								width="80" height="80" /></td>
							<td>${invo.productName}</td>
							<td>${invo.category}</td>
							<td>${invo.supplier}</td>
							<td>₹${invo.price}</td>
							<td>₹${invo.totalRevenue}</td>
							<td>
								<button class="action-btn btn-edit">
									<i class="fas fa-edit"></i>
								</button>
								<button class="action-btn btn-delete">
									<i class="fas fa-trash"></i>
								</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div class="pagination">
    <c:if test="${totalPages > 0}">

        <!-- Previous Button -->
        <c:if test="${currentPage > 0}">
            <a href="?page=${currentPage - 1}&size=5
                <c:if test='${not empty selectedCategory}'> &category=${selectedCategory} </c:if>
                <c:if test='${not empty keyword}'> &keyword=${keyword} </c:if>"
               class="pagination-btn">
                <i class="fas fa-chevron-left"></i>
            </a>
        </c:if>

        <!-- Page Numbers -->
        <c:forEach var="i" begin="0" end="${totalPages - 1}">
            <a href="?page=${i}&size=5
                <c:if test='${not empty selectedCategory}'> &category=${selectedCategory} </c:if>
                <c:if test='${not empty keyword}'> &keyword=${keyword} </c:if>"
               class="pagination-btn ${i == currentPage ? 'active' : ''}">
                ${i + 1}
            </a>
        </c:forEach>

        <!-- Next Button -->
        <c:if test="${currentPage < totalPages - 1}">
            <a href="?page=${currentPage + 1}&size=5
                <c:if test='${not empty selectedCategory}'> &category=${selectedCategory} </c:if>
                <c:if test='${not empty keyword}'> &keyword=${keyword} </c:if>"
               class="pagination-btn">
                <i class="fas fa-chevron-right"></i>
            </a>
        </c:if>
    </c:if>
</div>




			<script>
    document.getElementById("addInventoryBtn").addEventListener("click", function(e) {
    	e.preventDefault();
            alert("Only manager can add products!");
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
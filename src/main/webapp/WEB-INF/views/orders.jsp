<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Management System</title>
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
        .menu a {
	text-decoration: none;
	color: white;
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
        
        .status-pending {
            background: #fef5e7;
            color: #f8961e;
        }
        
        .status-processing {
            background: #e6f7ee;
            color: #00a65a;
        }
        
        .status-completed {
            background: #e6f7ee;
            color: #00a65a;
        }
        
        .status-cancelled {
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
        
        .btn-view {
            background: var(--success);
            color: white;
        }
        
        .btn-edit {
            background: var(--info);
            color: white;
        }
        
        .btn-delete {
            background: var(--danger);
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
            max-height: 90vh;
            overflow-y: auto;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
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
    </style>
</head>
<body>
<c:if test="${not empty msg}">
    <script>
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
                <a href="${pageContext.request.contextPath}/product"> Products</a>
            </div>
            <div class="menu-item">
                <i class="fas fa-cubes"></i>
                <a href="${pageContext.request.contextPath}/inventory">Inventory</a>
            </div>
            <div class="menu-item active">
                <i class="fas fa-shopping-cart"></i>
                <a href="#">Orders</a>
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
                 <form action="/order/search" method="get">
					<input type="text" name="keyword" placeholder="Search order..." required />
				</form>
            </div>
            <div class="user-info">
                <i class="fas fa-bell" style="margin-right: 20px; font-size: 20px;"></i>
                <img src="https://ui-avatars.com/api/?name=Admin+User&background=random" alt="User">
                <a href="${pageContext.request.contextPath}/settings" style="margin-left: 10px; text-decoration:none; color:black;">Admin User</a>
            </div>
        </div>

        <!-- Orders Section -->
        <div class="content-section">
            <div class="section-header">
                <h2>Order Management</h2>
                <button class="btn btn-primary" onclick="openOrderModal()">
                    <i class="fas fa-plus"></i> New Order
                </button>
            </div>


            <!-- Orders Table -->
            <table>
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Customer</th>
                        <th>Ordered Product</th>
                        <th>Items</th>
                        <th>Total</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
					<c:forEach var="ord" items="${order}" varStatus="status">
						<tr>
							<td>${ord.orderId}</td>
							<td>${ord.customer}</td>
							<td>${ord.orderedProduct}</td>
							<td>${ord.items}</td>
							<td>₹${ord.total}</td>
							<td><c:choose>
									<c:when test="${ord.status eq 'Pending'}">
										<span class="status status-pending">${ord.status}</span>
									</c:when>
									<c:when test="${ord.status eq 'Processing'}">
										<span class="status status-processing">${ord.status}</span>
									</c:when>
									<c:when test="${ord.status eq 'Completed'}">
										<span class="status status-completed">${ord.status}</span>
									</c:when>
									<c:when test="${ord.status eq 'Cancelled'}">
										<span class="status status-cancelled">${ord.status}</span>
									</c:when>
									<c:otherwise>
										<span class="status">${ord.status}</span>
									</c:otherwise>
								</c:choose></td>
							<td>
								<form
									action="${pageContext.request.contextPath}/deleteOrder/${ord.orderId}"
									method="post" style="display: inline;">
									<button type="submit" class="action-btn btn-delete">
										<i class="fas fa-trash"></i>
									</button>
								</form>

							</td>
						</tr>
					</c:forEach>
				</tbody>
            </table>

            <!-- Pagination -->
            <div class="pagination">
    <c:if test="${totalPages > 0}">
        <c:if test="${currentPage > 0}">
            <a href="?page=${currentPage - 1}" class="pagination-btn">
                <i class="fas fa-chevron-left"></i>
            </a>
        </c:if>

        <c:forEach var="i" begin="0" end="${totalPages - 1}">
            <a href="?page=${i}" class="pagination-btn ${i == currentPage ? 'active' : ''}">
                ${i + 1}
            </a>
        </c:forEach>

        <c:if test="${currentPage < totalPages - 1}">
            <a href="?page=${currentPage + 1}" class="pagination-btn">
                <i class="fas fa-chevron-right"></i>
            </a>
        </c:if>
    </c:if>
</div>

        </div>
    </div>

    <!-- New Order Modal -->
    <div class="modal" id="orderModal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Create New Order</h2>
                <span class="close" onclick="closeOrderModal()">&times;</span>
            </div>
           	<form action="/addOrder" method="post">
<!-- 				<div class="form-group">
					<label for="orderId">Order ID</label> <input type="number"
						name="orderId" id="orderId" class="form-control"
						placeholder="Enter OrderId">
				</div> -->
				<div class="form-group">
					<label for="customer">Customer</label> <input type="text"
						name="customer" id="customer" class="form-control"
						placeholder="Enter customer name">
				</div>
				<div class="form-group">
					<label for="orderedProduct">Ordered Product</label> <input type="text"
						name="orderedProduct" id="orderedProduct" class="form-control"
						placeholder="Enter Ordered Product">
				</div>
				<div class="form-group">
					<label for="items">Items</label> <input type="number" name="items"
						id="items" class="form-control" placeholder="Enter no of items">
				</div>
				
				<div class="form-group">
					<label for="status">Status</label> <input type="text" id="status"
						name="status" class="form-control"
						placeholder="Enter order status">
				</div>
				<button type="submit" class="btn btn-primary" style="width: 100%;">Add
					Order</button>
			</form>
        </div>
    </div>

    <script>
        // Modal functionality
        function openOrderModal() {
            document.getElementById('orderModal').style.display = 'flex';
            // Set default order date to today
            document.getElementById('orderDate').valueAsDate = new Date();
        }
        
        function closeOrderModal() {
            document.getElementById('orderModal').style.display = 'none';
        }
        
        // Close modal when clicking outside
        window.onclick = function(event) {
            const modal = document.getElementById('orderModal');
            if (event.target === modal) {
                closeOrderModal();
            }
        };
        
        // Calculate total based on product selection and quantity
        document.getElementById('orderedProduct').addEventListener('change', calculateTotal);
        document.getElementById('items').addEventListener('input', calculateTotal);
        
        function calculateTotal() {
            const productSelect = document.getElementById('orderedProduct');
            const itemsInput = document.getElementById('items');
            const totalInput = document.getElementById('total');
            
            const prices = {
                '1': 249.99,
                '2': 89.99,
                '3': 59.99,
                '4': 199.99,
                '5': 29.99
            };
            
            const productPrice = prices[productSelect.value] || 0;
            const quantity = parseInt(itemsInput.value) || 0;
            const total = productPrice * quantity;
            
            totalInput.value = total ? '$' + total.toFixed(2) : '';
        }
        
        // Menu item active state
        const menuItems = document.querySelectorAll('.menu-item');
        menuItems.forEach(item => {
            item.addEventListener('click', function() {
                menuItems.forEach(i => i.classList.remove('active'));
                this.classList.add('active');
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
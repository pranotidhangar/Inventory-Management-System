<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Inventory Management System</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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

.menu-item.active {
	background: #003153;
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

.main-content a {
	text-decoration:none;
	color:black;
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
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
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
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
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

.bg-primary {
	background: var(--primary);
}

.bg-success {
	background: var(--success);
}

.bg-warning {
	background: var(--warning);
}

.bg-danger {
	background: var(--danger);
}

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
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
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

.btn-view-all {
	background: transparent;
	color: var(--primary);
	border: 1px solid var(--primary);
	padding: 8px 15px;
}

.btn-view-all:hover {
	background: var(--primary);
	color: white;
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

.btn-edit {
	background: var(--info);
	color: white;
}

.btn-delete {
	background: var(--danger);
	color: white;
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

/* Modal */
.modal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	justify-content: center;
	align-items: center;
	z-index: 1000;
}

.modal-content {
	background: white;
	border-radius: 10px;
	width: 500px;
	max-width: 90%;
	padding: 30px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
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

.view-all-container {
	text-align: center;
	margin-top: 20px;
	padding-top: 15px;
	border-top: 1px solid #e0e0e0;
}
/* Responsive */
@media ( max-width : 992px) {
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
}

@media ( max-width : 768px) {
	.dashboard-cards {
		grid-template-columns: 1fr;
	}
	.search-bar {
		width: 70%;
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
	<div class="sidebar">
		<div class="logo">
			<h2>StockMaster</h2>
		</div>
		<div class="menu">
			<div class="menu-item active">
				<i class="fas fa-home"></i> <a href="#">Dashboard</a>
			</div>
			<div class="menu-item">
				<i class="fas fa-box"></i> <a href="${pageContext.request.contextPath}/product">Products</a>
			</div>
			<div class="menu-item">
				<i class="fas fa-cubes"></i> <a href="${pageContext.request.contextPath}/inventory">Inventory</a>
			</div>
			<div class="menu-item">
				<i class="fas fa-shopping-cart"></i> <a href="${pageContext.request.contextPath}/order">Orders</a>
			</div>
			<div class="menu-item">
				<i class="fas fa-cog"></i> <a href="${pageContext.request.contextPath}/settings">Settings</a>
			</div>
		</div>
	</div>


	<div class="main-content">
		<div class="header">
			<div class="search-bar">
				<i class="fas fa-search"></i>
				<form action="/product/search" method="get">
					<input type="text" name="keyword" placeholder="Search product..." required />
				</form>
			</div>
			<div class="user-info">
				<img src="https://ui-avatars.com/api/?name=Admin+User&background=random" alt="User">
					 <a href="${pageContext.request.contextPath}/settings" style="margin-left: 10px;">Admin User</a>
			</div>
		</div>

		<div class="dashboard-cards">
    <div class="card">
        <div class="card-header">
            <h3>Total Products</h3>
            <div class="card-icon bg-primary"><i class="fas fa-box"></i></div>
        </div>
        <h3>${totalProducts}</h3>
        <p>All products in the system</p>
    </div>

    <div class="card">
        <div class="card-header">
            <h3>Total Orders</h3>
            <div class="card-icon bg-success"><i class="fas fa-shopping-cart"></i></div>
        </div>
        <h3>${totalOrders}</h3>
        <p>All orders received</p>
    </div>

    <div class="card">
        <div class="card-header">
            <h3>Low Stock</h3>
            <div class="card-icon bg-warning"><i class="fas fa-exclamation-triangle"></i></div>
        </div>
        <h3>${lowStock}</h3>
        <p>Items need restocking</p>
    </div>

    <div class="card">
        <div class="card-header">
            <h3>Out of Stock</h3>
            <div class="card-icon bg-danger"><i class="fas fa-times-circle"></i></div>
        </div>
        <h3>${outOfStock}</h3>
        <p>Items currently unavailable</p>
    </div>
</div>


		<!----------------------------------------Show Product Modal-------------------------------------->
		<div class="content-section">
			<div class="section-header">
				<h2>Recent Products</h2>
				<button class="btn btn-primary" onclick="openModal()">
					<i class="fas fa-plus"></i> Add Product
				</button>
			</div>
			<table>
				<thead>
					<tr>
						<th>Product Id</th>
						<th>Product Name</th>
						<th>SKU</th>
						<th>Category</th>
						<th>Price</th>
						<th>Stock</th>
						<th>Status</th>
						<th>Actions</th>
					</tr>
				</thead>
				<c:forEach var="pro" items="${product}" varStatus="status" end="4">
					<tbody>
						<tr>
							<td>${pro.productId}</td>
							<td>${pro.productName}</td>
							<td>${pro.sku}</td>
							<td>${pro.category}</td>
							<td>₹${pro.price}</td>
							<td>${pro.stock}</td>
							<td><c:choose>
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
								</c:choose></td>
							<td><a
								href="${pageContext.request.contextPath}/edit/${pro.productId}"
								class="action-btn btn-edit"> <i class="fas fa-edit"></i>
							</a>

								<form
									action="${pageContext.request.contextPath}/delete/${pro.productId}"
									method="post" style="display: inline;">
									<button type="submit" class="action-btn btn-delete">
										<i class="fas fa-trash"></i>
									</button>
								</form></td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
			<div class="view-all-container">
				<a href="/product" class="btn btn-view-all">
					View All Products <i class="fas fa-arrow-right"></i>
				</a>
			</div>
		</div>
		
		<!------------------------------------------Product UI------------------------------------------>
	<div class="modal" id="addProductModal">
		<div class="modal-content">
			<div class="modal-header">
				<h2>Add New Product</h2>
				<span class="close" onclick="closeModal()">&times;</span>
			</div>
			<form action="/addProduct" method="post">
				<div class="form-group">
					<label for="productName">Product Name</label> <input type="text"
						name="productName" id="productName" class="form-control"
						placeholder="Enter product name">
				</div>
				<div class="form-group">
					<label for="sku">SKU</label> <input type="text" name="sku" id="sku"
						class="form-control" placeholder="Enter SKU">
				</div>
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
				<div class="form-group">
					<label for="stock">Stock Quantity</label> 
					<input type="number" name="stock" id="stock" class="form-control" placeholder="Enter quantity">
				</div>
				<div class="form-group">
					<label for="status">Status</label> <input type="text" id="status"
						name="status" class="form-control"
						placeholder="Enter product status">
				</div>
				<button type="submit" class="btn btn-primary" style="width: 100%;">Add
					Product</button>
			</form>

		</div>
	</div>
		

		<!----------------------------------------Show Order Modal-------------------------------------->
		<div class="content-section">
			<div class="section-header">
				<h2>Recent Orders</h2>
				<button class="btn btn-primary" onclick="openOrderModal()">
					<i class="fas fa-plus"></i> New Order
				</button>
			</div>
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
    <c:forEach var="ord" items="${order}" varStatus="status" end="4">
        <tr>
            <td>${ord.orderId}</td>
            <td>${ord.customer}</td>
            <td>${ord.orderedProduct}</td> 
            <td>${ord.items}</td>
            <td>₹${ord.total}</td>
            <td>
                <c:choose>
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
                </c:choose>
            </td>
            <td>
                <form action="${pageContext.request.contextPath}/deleteOrder/${ord.orderId}" 
                      method="post" style="display:inline;">
                    <button type="submit" class="action-btn btn-delete">
                        <i class="fas fa-trash"></i>
                    </button>
                </form>
                
            </td>
        </tr>
    </c:forEach>
</tbody>

			</table>
			<div class="view-all-container">
				<a href="/order" class="btn btn-view-all">
					View All Orders <i class="fas fa-arrow-right"></i>
				</a>
			</div>
		</div>
	</div>

	
	<!------------------------------------------Order UI------------------------------------------>
	<div class="modal" id="addOrderModal">
		<div class="modal-content">
			<div class="modal-header">
				<h2>Add New Order</h2>
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
    /* -----------------------------Add Product Modal------------------------------------------ */
    function openModal() {
        document.getElementById('addProductModal').style.display = 'flex';
    }
    
    function closeModal() {
        document.getElementById('addProductModal').style.display = 'none';
    }

    /* -----------------------------Add Order Modal------------------------------------------ */
    function openOrderModal() {
        document.getElementById('addOrderModal').style.display = 'flex';
    }
    
    function closeOrderModal() {
        document.getElementById('addOrderModal').style.display = 'none';
    }

    /* -----------------------------Handle Outside Click------------------------------------------ */
    window.onclick = function(event) {
        const productModal = document.getElementById('addProductModal');
        const orderModal = document.getElementById('addOrderModal');

        if (event.target === productModal) {
            closeModal();
        }
        if (event.target === orderModal) {
            closeOrderModal();
        }
    };

    /* -----------------------------Sidebar Active Menu------------------------------------------ */
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

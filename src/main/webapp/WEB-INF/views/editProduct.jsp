<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #4e73df;
            --secondary-color: #6f42c1;
            --success-color: #1cc88a;
            --light-bg: #f8f9fc;
        }
        body {
            background-color: var(--light-bg);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .card {
            border-radius: 10px;
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
            border: none;
        }
        .card-header {
            background: linear-gradient(120deg, var(--primary-color), var(--secondary-color));
            color: white;
            border-radius: 10px 10px 0 0 !important;
        }
        .form-control:focus, .form-select:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(78, 115, 223, 0.25);
        }
        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }
        .btn-primary:hover {
            background-color: #3a5fc8;
            border-color: #3a5fc8;
        }
        .status-badge {
            padding: 0.5em 1em;
            border-radius: 20px;
            font-weight: 500;
        }
        .required-label:after {
            content: " *";
            color: #e74a3b;
        }
    </style>
</head>
<body>
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card">
                    <div class="card-header py-3">
                        <h5 class="m-0 font-weight-bold"><i class="fas fa-edit me-2"></i>Edit Product</h5>
                    </div>
                    <div class="card-body p-4">
                        <c:set var="ob" value="${ob}"/>
                        <form action="/edit/${ob.productId}" method="post">
							<input type="hidden" name="version" value="${ob.version}">
							<input type="hidden" name="productId" value="${ob.productId}">

							<div class="row mb-4">
                                <div class="col-md-6">
                                    <label for="productName" class="form-label required-label">Product Name</label>
                                    <input type="text" class="form-control" id="productName" name="productName" value="${ob.productName}" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="sku" class="form-label required-label">SKU</label>
                                    <input type="text" class="form-control" id="sku" name="sku" value="${ob.sku}" required>
                                </div>
                            </div>
                            
                            <div class="row mb-4">
                                <div class="col-md-6">
                                    <label for="category" class="form-label required-label">Category</label>
                                    <select class="form-select" id="category" name="category" required>
                                        <option value="">Select Category</option>
                                        <option value="electronics" ${ob.category == 'electronics' ? 'selected' : ''}>Electronics</option>
                                        <option value="clothing" ${ob.category == 'clothing' ? 'selected' : ''}>Clothing</option>
                                        <option value="furniture" ${ob.category == 'furniture' ? 'selected' : ''}>Furniture</option>
                                        <option value="footwear" ${ob.category == 'footwear' ? 'selected' : ''}>Footwear</option>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label for="price" class="form-label required-label">Price (₹)</label>
                                    <div class="input-group">
                                        <span class="input-group-text">$</span>
                                        <input type="number" class="form-control" id="price" name="price" value="${ob.price}" step="0.01" min="0" required>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row mb-4">
                                <div class="col-md-6">
                                    <label for="stock" class="form-label required-label">Stock Quantity</label>
                                    <input type="number" class="form-control" id="stock" name="stock" value="${ob.stock}" min="0" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="status" class="form-label required-label">Status</label>
                                    <select class="form-select" id="status" name="status" required>
                                        <option value="In Stock" ${ob.status == 'In Stock' ? 'selected' : ''}>In Stock</option>
                                        <option value="Out of Stock" ${ob.status == 'Out of Stock' ? 'selected' : ''}>Out of Stock</option>
                                        <option value="Discontinued" ${ob.status == 'Discontinued' ? 'selected' : ''}>Low Stock</option>
                                      
                                    </select>
                                </div>
                            </div>
                            
                            <div class="d-flex justify-content-between mt-5">
                                <a href="/" class="btn btn-secondary">
                                    <i class="fas fa-arrow-left me-1"></i> Back to Products
                                </a>
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-save me-1"></i> Update Product
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

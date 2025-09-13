package com.system.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Version;

@Entity
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer productId;
    private String productName;
    private String sku;
    private String category;
    private Integer price;
    private Integer stock;
    private String status;

    @Version
    private int version;
	public int getVersion() {
		return version;
	}
	public void setVersion(int version) {
		this.version = version;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getSku() {
		return sku;
	}
	public void setSku(String sku) {
		this.sku = sku;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Integer getStock() {
		return stock;
	}
	public void setStock(Integer stock) {
		this.stock = stock;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Product(Integer productId, String productName, String sku, String category, Integer price, Integer stock,
			String status) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.sku = sku;
		this.category = category;
		this.price = price;
		this.stock = stock;
		this.status = status;
	}
	public Product() {
		super();
	}
	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName=" + productName + ", sku=" + sku + ", category="
				+ category + ", price=" + price + ", stock=" + stock + ", status=" + status + "]";
	}
    
}

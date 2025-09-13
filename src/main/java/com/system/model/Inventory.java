package com.system.model;


import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Inventory {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
   private Integer srno;	
   private String productId;
   private String productImg;
   private String productName;
   private String supplier;
   private String category;
   public String getCategory() {
	return category;
}
   public void setCategory(String category) {
	this.category = category;
   }
   public String getSupplier() {
	return supplier;
}
   public void setSupplier(String supplier) {
	this.supplier = supplier;
   }
   private int price;
   private double totalRevenue;
   public String getProductId() {
	return productId;
   }
   public void setProductId(String productId) {
	this.productId = productId;
   }
   public String getProductImg() {
	return productImg;
   }
   public void setProductImg(String productImg) {
	this.productImg = productImg;
   }
   public String getProductName() {
	return productName;
   }
   public void setProductName(String productName) {
	this.productName = productName;
   }
   public int getPrice() {
	return price;
   }
   public void setPrice(int price) {
	this.price = price;
   }
   public double getTotalRevenue() {
	return totalRevenue;
   }
   public void setTotalRevenue(double totalRevenue) {
	this.totalRevenue = totalRevenue;
   }
   public Integer getSrno() {
	return srno;
    }
   public void setSrno(Integer srno) {
	this.srno = srno;
   }
   public Inventory(Integer srno, String productId, String productImg, String productName, String supplier, int price,
		double totalRevenue) {
	super();
	this.srno = srno;
	this.productId = productId;
	this.productImg = productImg;
	this.productName = productName;
	this.supplier = supplier;
	this.price = price;
	this.totalRevenue = totalRevenue;
   }
   public Inventory() {
	super();
   }
   @Override
   public String toString() {
	return "Inventory [srno=" + srno + ", productId=" + productId + ", productImg=" + productImg + ", productName="
			+ productName + ", supplier=" + supplier + ", price=" + price + ", totalRevenue=" + totalRevenue + "]";
   }
  
  
   
}

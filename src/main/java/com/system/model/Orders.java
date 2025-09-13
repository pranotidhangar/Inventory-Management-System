package com.system.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Orders {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer orderId;
	private String customer;
	private String orderedProduct;
	private int items;
	private int total;
	private String status;
	
	
	@Override
	public String toString() {
		return "Orders [orderId=" + orderId + ", customer=" + customer + ", orderedProduct=" + orderedProduct
				+ ", items=" + items + ", total=" + total + ", status=" + status + "]";
	}
	public Orders() {
		super();
	}
	public Orders(Integer orderId, String customer, String orderedProduct, int items, int total, String status) {
		super();
		this.orderId = orderId;
		this.customer = customer;
		this.orderedProduct = orderedProduct;
		this.items = items;
		this.total = total;
		this.status = status;
	}
	public String getOrderedProduct() {
		return orderedProduct;
	}
	public void setOrderedProduct(String orderedProduct) {
		this.orderedProduct = orderedProduct;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public String getCustomer() {
		return customer;
	}
	public void setCustomer(String customer) {
		this.customer = customer;
	}
	public int getItems() {
		return items;
	}
	public void setItems(int items) {
		this.items = items;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}

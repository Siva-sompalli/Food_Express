package com.foodexpress.model;

public class OrderItem {

	private int orderItemId;
	private int orderId;
	private String itemName;
	private int quantity;
	private double totalPrice;

	public OrderItem() {
		super();
	}

	public OrderItem(int orderId, String itemName, int quantity, double totalPrice) {
		super();
		this.orderId = orderId;
		this.itemName = itemName;
		this.quantity = quantity;
		this.totalPrice = totalPrice;
	}

	public OrderItem(int orderItemId, int orderId, String itemName,
			int quantity, double totalPrice) {
		super();
		this.orderItemId = orderItemId;
		this.orderId = orderId;
		this.itemName = itemName;
		this.quantity = quantity;
		this.totalPrice = totalPrice;
	}

	public int getOrderItemId() {
		return orderItemId;
	}

	public void setOrderItemId(int orderItemId) {
		this.orderItemId = orderItemId;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Override
	public String toString() {
		return "OrderItem [orderItemId=" + orderItemId
				+ ", orderId=" + orderId
				+ ", itemName=" + itemName
				+ ", quantity=" + quantity
				+ ", totalPrice=" + totalPrice + "]";
	}
}

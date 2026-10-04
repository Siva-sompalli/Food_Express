package com.foodexpress.model;

public class CartItem {

	private int menuId;
	private int restaurantId;
	private String name;
	private double price;
	private int quantity;
	private String imageUrl;

	public CartItem() {
		super();
	}

	public CartItem(int menuId, int restaurantId, String name,
			double price, int quantity, String imageUrl) {
		super();
		this.menuId = menuId;
		this.restaurantId = restaurantId;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
		this.imageUrl = imageUrl;
	}

	public int getMenuId() {
		return menuId;
	}

	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}

	public int getRestaurantId() {
		return restaurantId;
	}

	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	// Calculate Total Price
	public double getTotalPrice() {
		return price * quantity;
	}

	@Override
	public String toString() {
		return "CartItem [menuId=" + menuId +
				", restaurantId=" + restaurantId +
				", name=" + name +
				", price=" + price +
				", quantity=" + quantity +
				", imageUrl=" + imageUrl + "]";
	}
}
package com.foodexpress.model;

import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

public class Cart {
	private int restaurantId;
	private Map<Integer, CartItem> items;
	public Cart() {
		items = new LinkedHashMap<>();
	}

	public int getRestaurantId() {
		return restaurantId;
	}
	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}



	// Add Item
	public void addItem(CartItem item) {

		int menuId = item.getMenuId();

		if (items.containsKey(menuId)) {

			CartItem existingItem = items.get(menuId);

			existingItem.setQuantity(
					existingItem.getQuantity() + item.getQuantity());

		} else {

			items.put(menuId, item);

		}
	}

	// Update Quantity
	public void updateItem(int menuId, int quantity) {

		if (items.containsKey(menuId)) {

			if (quantity <= 0) {

				items.remove(menuId);

			} else {

				items.get(menuId).setQuantity(quantity);

			}
		}
	}

	// Remove Item
	public void removeItem(int menuId) {

		items.remove(menuId);
	}

	// Get All Items
	public Collection<CartItem> getItems() {

		return items.values();
	}

	// Get One Item
	public CartItem getItem(int menuId) {

		return items.get(menuId);
	}

	// Calculate Total Price
	public double getTotalAmount() {

		double total = 0;

		for (CartItem item : items.values()) {

			total += item.getTotalPrice();

		}

		return total;
	}

	// Clear Cart
	public void clearCart() {

		items.clear();
	}
}
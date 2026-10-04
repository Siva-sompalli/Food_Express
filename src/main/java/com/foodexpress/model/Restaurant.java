package com.foodexpress.model;

public class Restaurant {

	private int restaurantId;
	private String name;
	private int adminId;
	private String address;
	private String cuisineType;
	private double rating;
	private int eta;
	private String imageUrl;
	private boolean isAvailable;

	public Restaurant() {
		super();
	}

	public Restaurant(String name, int adminId, String address,
			String cuisineType, double rating, int eta,
			String imageUrl, boolean isAvailable) {
		super();
		this.name = name;
		this.adminId = adminId;
		this.address = address;
		this.cuisineType = cuisineType;
		this.rating = rating;
		this.eta = eta;
		this.imageUrl = imageUrl;
		this.isAvailable = isAvailable;
	}

	public Restaurant(int restaurantId, String name, int adminId,
			String address, String cuisineType, double rating,
			int eta, String imageUrl, boolean isAvailable) {
		super();
		this.restaurantId = restaurantId;
		this.name = name;
		this.adminId = adminId;
		this.address = address;
		this.cuisineType = cuisineType;
		this.rating = rating;
		this.eta = eta;
		this.imageUrl = imageUrl;
		this.isAvailable = isAvailable;
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

	public int getAdminId() {
		return adminId;
	}

	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCuisineType() {
		return cuisineType;
	}

	public void setCuisineType(String cuisineType) {
		this.cuisineType = cuisineType;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public int getEta() {
		return eta;
	}

	public void setEta(int eta) {
		this.eta = eta;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public boolean isAvailable() {
		return isAvailable;
	}

	public void setAvailable(boolean isAvailable) {
		this.isAvailable = isAvailable;
	}

	@Override
	public String toString() {
		return "Restaurant [restaurantId=" + restaurantId +
				", name=" + name +
				", adminId=" + adminId +
				", address=" + address +
				", cuisineType=" + cuisineType +
				", rating=" + rating +
				", eta=" + eta +
				", imageUrl=" + imageUrl +
				", isAvailable=" + isAvailable + "]";
	}
}
package com.foodexpress.dao;

import java.util.List;
import com.foodexpress.model.Restaurant;

public interface RestaurantDao {

	void addRestaurant(Restaurant restaurant);

	Restaurant getRestaurant(int restaurantId);

	void updateRestaurant(Restaurant restaurant);

	void deleteRestaurant(int restaurantId);

	List<Restaurant> getAllRestaurants();
	
	List<Restaurant> searchRestaurant(String keyword);
}
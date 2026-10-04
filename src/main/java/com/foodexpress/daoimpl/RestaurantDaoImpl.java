package com.foodexpress.daoimpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.foodexpress.dao.RestaurantDao;
import com.foodexpress.model.Restaurant;
import com.foodexpress.utility.DbConnection;

public class RestaurantDaoImpl implements RestaurantDao {

	private Connection con;

	String ADD_RESTAURANT =
			"INSERT INTO restaurant(name,admin_id,address,cuisineType,rating,eta,imageUrl,isAvailable) VALUES(?,?,?,?,?,?,?,?)";

	String GET_RESTAURANT =
			"SELECT * FROM restaurant WHERE restaurantId=?";

	String UPDATE_RESTAURANT =
			"UPDATE restaurant SET name=?,admin_id=?,address=?,cuisineType=?,rating=?,eta=?,imageUrl=?,isAvailable=? WHERE restaurantId=?";

	String DELETE_RESTAURANT =
			"DELETE FROM restaurant WHERE restaurantId=?";

	String FETCH_ALL_RESTAURANTS =
			"SELECT * FROM restaurant";
	
	String SEARCH_RESTAURANT =
		    "SELECT * FROM restaurant WHERE LOWER(name) LIKE LOWER(?)";

	public RestaurantDaoImpl() {
		con = DbConnection.getConnection();
	}

	private Connection getConnection() {
		try {
			if (con == null || con.isClosed()) {
				con = DbConnection.getConnection();
			}
		} catch (SQLException e) {
			con = DbConnection.getConnection();
		}
		return con;
	}

	@Override
	public void addRestaurant(Restaurant restaurant) {
		Connection connection = getConnection();
		if (connection == null) {
			System.err.println("RestaurantDaoImpl.addRestaurant: Database connection is null!");
			return;
		}

		try (PreparedStatement pstmt =
					 connection.prepareStatement(ADD_RESTAURANT)) {

			pstmt.setString(1, restaurant.getName());
			pstmt.setInt(2, restaurant.getAdminId());
			pstmt.setString(3, restaurant.getAddress());
			pstmt.setString(4, restaurant.getCuisineType());
			pstmt.setDouble(5, restaurant.getRating());
			pstmt.setInt(6, restaurant.getEta());
			pstmt.setString(7, restaurant.getImageUrl());
			pstmt.setBoolean(8, restaurant.isAvailable());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Restaurant getRestaurant(int restaurantId) {

		Restaurant restaurant = null;
		Connection connection = getConnection();
		if (connection == null) {
			System.err.println("RestaurantDaoImpl.getRestaurant: Connection is null");
			return null;
		}

		try (PreparedStatement pstmt =
					 connection.prepareStatement(GET_RESTAURANT)) {

			pstmt.setInt(1, restaurantId);

			ResultSet result = pstmt.executeQuery();

			if (result.next()) {

				int id = result.getInt("restaurantId");
				String name = result.getString("name");
				int adminId = result.getInt("admin_id");
				String address = result.getString("address");
				String cuisineType = result.getString("cuisineType");
				double rating = result.getDouble("rating");
				int eta = result.getInt("eta");
				String imageUrl = result.getString("imageUrl");
				boolean isAvailable = result.getBoolean("isAvailable");

				restaurant = new Restaurant(id, name, adminId,
						address, cuisineType, rating,
						eta, imageUrl, isAvailable);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return restaurant;
	}

	@Override
	public void updateRestaurant(Restaurant restaurant) {

		Connection connection = getConnection();
		if (connection == null) {
			System.err.println("RestaurantDaoImpl.updateRestaurant: Connection is null");
			return;
		}

		try (PreparedStatement pstmt =
					 connection.prepareStatement(UPDATE_RESTAURANT)) {

			pstmt.setString(1, restaurant.getName());
			pstmt.setInt(2, restaurant.getAdminId());
			pstmt.setString(3, restaurant.getAddress());
			pstmt.setString(4, restaurant.getCuisineType());
			pstmt.setDouble(5, restaurant.getRating());
			pstmt.setInt(6, restaurant.getEta());
			pstmt.setString(7, restaurant.getImageUrl());
			pstmt.setBoolean(8, restaurant.isAvailable());
			pstmt.setInt(9, restaurant.getRestaurantId());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteRestaurant(int restaurantId) {

	    String DELETE_MENUS =
	            "DELETE FROM menu WHERE restaurantId=?";

	    String DELETE_RESTAURANT =
	            "DELETE FROM restaurant WHERE restaurantId=?";

		Connection connection = getConnection();
		if (connection == null) {
			System.err.println("RestaurantDaoImpl.deleteRestaurant: Connection is null");
			return;
		}

	    try {

	        // Start transaction
	        connection.setAutoCommit(false);

	        // 1. Delete all menu items
	        try (PreparedStatement menuStmt =
	                     connection.prepareStatement(DELETE_MENUS)) {

	            menuStmt.setInt(1, restaurantId);
	            menuStmt.executeUpdate();
	        }

	        // 2. Delete restaurant
	        try (PreparedStatement restaurantStmt =
	                     connection.prepareStatement(DELETE_RESTAURANT)) {

	            restaurantStmt.setInt(1, restaurantId);
	            restaurantStmt.executeUpdate();
	        }

	        // Commit both operations
	        connection.commit();

	        System.out.println(
	            "Restaurant deleted successfully: " + restaurantId
	        );

	    } catch (SQLException e) {

	        try {
	            connection.rollback();
	        } catch (SQLException rollbackException) {
	            rollbackException.printStackTrace();
	        }

	        e.printStackTrace();

	    } finally {

	        try {
	            connection.setAutoCommit(true);
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}

	@Override
	public List<Restaurant> getAllRestaurants() {

		List<Restaurant> restaurants = new ArrayList<>();
		Restaurant restaurant = null;
		Connection connection = getConnection();
		if (connection == null) {
			System.err.println("RestaurantDaoImpl.getAllRestaurants: Connection is null");
			return restaurants;
		}

		try (PreparedStatement pstmt =
					 connection.prepareStatement(FETCH_ALL_RESTAURANTS);

			 ResultSet result = pstmt.executeQuery()) {

			while (result.next()) {

				int id = result.getInt("restaurantId");
				String name = result.getString("name");
				int adminId = result.getInt("admin_id");
				String address = result.getString("address");
				String cuisineType = result.getString("cuisineType");
				double rating = result.getDouble("rating");
				int eta = result.getInt("eta");
				String imageUrl = result.getString("imageUrl");
				boolean isAvailable = result.getBoolean("isAvailable");

				restaurant = new Restaurant(id, name, adminId,
						address, cuisineType, rating,
						eta, imageUrl, isAvailable);

				restaurants.add(restaurant);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return restaurants;
	}
	
	@Override
	public List<Restaurant> searchRestaurant(String keyword) {

	    List<Restaurant> restaurants = new ArrayList<>();
		Connection connection = getConnection();
		if (connection == null) {
			System.err.println("RestaurantDaoImpl.searchRestaurant: Connection is null");
			return restaurants;
		}

	    try (PreparedStatement pstmt = connection.prepareStatement(SEARCH_RESTAURANT)) {

	        System.out.println("Searching for : " + keyword);

	        pstmt.setString(1, "%" + keyword + "%");

	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {

	            System.out.println("Found : " + rs.getString("name"));

	            Restaurant restaurant = new Restaurant(

	                    rs.getInt("restaurantId"),
	                    rs.getString("name"),
	                    rs.getInt("admin_id"),
	                    rs.getString("address"),
	                    rs.getString("cuisineType"),
	                    rs.getDouble("rating"),
	                    rs.getInt("eta"),
	                    rs.getString("imageUrl"),
	                    rs.getBoolean("isAvailable")

	            );

	            restaurants.add(restaurant);
	        }

	        System.out.println("Total Found : " + restaurants.size());

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return restaurants;
	}
}
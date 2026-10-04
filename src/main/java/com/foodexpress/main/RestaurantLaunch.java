package com.foodexpress.main;

import java.util.List;
import java.util.Scanner;

import com.foodexpress.daoimpl.RestaurantDaoImpl;
import com.foodexpress.model.Restaurant;

public class RestaurantLaunch  {

	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);

//		System.out.println("Enter Restaurant Name");
//		String name = scan.nextLine();
//
//		System.out.println("Enter Admin Id");
//		int adminId = scan.nextInt();
//		scan.nextLine();
//
//		System.out.println("Enter Address");
//		String address = scan.nextLine();
//
//		System.out.println("Enter Cuisine Type");
//		String cuisineType = scan.nextLine();
//
//		System.out.println("Enter Rating");
//		float rating = scan.nextFloat();
//
//		System.out.println("Enter ETA");
//		int eta = scan.nextInt();
//		scan.nextLine();
//
//		System.out.println("Enter Image URL");
//		String imageUrl = scan.nextLine();
//
//		System.out.println("Is Restaurant Available (true/false)");
//		boolean isAvailable = scan.nextBoolean();
//
//		Restaurant restaurant = new Restaurant(
//				name,
//				adminId,
//				address,
//				cuisineType,
//				rating,
//				eta,
//				imageUrl,
//				isAvailable);
//
//		RestaurantDaoImpl rdi = new RestaurantDaoImpl();
//		rdi.addRestaurant(restaurant);
//
//		System.out.println("Inserted Successfully");

		
		
//		RestaurantDaoImpl rdi = new RestaurantDaoImpl();
//		System.out.println("Enter Restaurant Id");
//		int id = scan.nextInt();
//
//		Restaurant r = rdi.getRestaurant(id);
//		System.out.println(r);
//
		
		
//		System.out.println("Enter Restaurant Id to Update");
//		int id = scan.nextInt();
//		
//		RestaurantDaoImpl rdi = new RestaurantDaoImpl();
//		Restaurant res = rdi.getRestaurant(id);
//
//		System.out.println("Enter New Rating");
//		float rating = scan.nextFloat();
//
//		System.out.println("Enter New ETA");
//		int eta = scan.nextInt();
//
//		res.setRating(rating);
//		res.setEta(eta);
//
//		rdi.updateRestaurant(res);
//
//		System.out.println("Updated Successfully");
		
		
//		RestaurantDaoImpl rdi = new RestaurantDaoImpl();
//		System.out.println("Enter Restaurant Id to Delete");
//		int id = scan.nextInt();
//
//		rdi.deleteRestaurant(id);
//
//		System.out.println("Deleted Successfully");

		RestaurantDaoImpl rdi = new RestaurantDaoImpl();
		List<Restaurant> restaurants = rdi.getAllRestaurants();

		for (Restaurant rest : restaurants) {
			System.out.println(rest);
		}
		
	}
}
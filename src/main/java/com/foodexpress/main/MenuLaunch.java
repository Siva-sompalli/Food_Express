package com.foodexpress.main;

import java.util.List;
import java.util.Scanner;

import com.foodexpress.daoimpl.MenuDaoImpl;
import com.foodexpress.model.Menu;

public class MenuLaunch {

	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);
		MenuDaoImpl mdi = new MenuDaoImpl();

		System.out.println("Enter Restaurant Id");
		int restaurantId = scan.nextInt();
		scan.nextLine();

		System.out.println("Enter Menu Name");
		String name = scan.nextLine();

		System.out.println("Enter Description");
		String description = scan.nextLine();

		System.out.println("Enter Price");
		double price = scan.nextDouble();

		System.out.println("Enter Rating");
		double rating = scan.nextDouble();
		scan.nextLine();

		System.out.println("Enter Image URL");
		String imageUrl = scan.nextLine();

		System.out.println("Enter Type (Veg/Non-Veg)");
		String type = scan.nextLine();

		System.out.println("Is Available (true/false)");
		boolean isAvailable = scan.nextBoolean();

		Menu menu = new Menu(restaurantId, name, description, price,
				rating, imageUrl, type, isAvailable);

		mdi.addMenu(menu);

		System.out.println("Menu Added Successfully");
		

//		System.out.println("Enter Menu Id to Fetch");
//		int menuId = scan.nextInt();
//
//		Menu m = mdi.getMenu(menuId);
//		System.out.println(m);

//		System.out.println("Enter Menu Id to Update");
//		menuId = scan.nextInt();
//		scan.nextLine();
//
//		Menu updateMenu = mdi.getMenu(menuId);
//
//		System.out.println("Enter New Price");
//		double newPrice = scan.nextDouble();
//
//		System.out.println("Enter New Rating");
//		double newRating = scan.nextDouble();
//		scan.nextLine();
//
//		updateMenu.setPrice(newPrice);
//		updateMenu.setRating(newRating);
//
//		mdi.updateMenu(updateMenu);
//
//		System.out.println("Menu Updated Successfully");
//		System.out.println(updateMenu);
//
//		List<Menu> menus = mdi.getAllMenus();
//
//		for (Menu menuObj : menus) {
//			System.out.println(menuObj);
//		}
//
//		System.out.println("Enter Restaurant Id to Fetch Menus");
//		restaurantId = scan.nextInt();
//
//		List<Menu> restaurantMenus = mdi.getMenusByRestaurant(restaurantId);
//
//		for (Menu menuObj : restaurantMenus) {
//			System.out.println(menuObj);
//		}
//
//		System.out.println("Enter Menu Id to Delete");
//		menuId = scan.nextInt();
//
//		mdi.deleteMenu(menuId);
//
//		System.out.println("Menu Deleted Successfully");

		scan.close();
	}
}
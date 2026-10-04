package com.foodexpress.main;

import java.util.List;
import java.util.Scanner;

import com.foodexpress.daoimpl.OrderDaoImpl;
import com.foodexpress.model.Orders;

public class OrderLaunch {

	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);
//		OrderDaoImpl odi = new OrderDaoImpl();
//
//		System.out.println("Enter User Id");
//		int userId = scan.nextInt();
//
//		System.out.println("Enter Restaurant Id");
//		int restaurantId = scan.nextInt();
//
//		System.out.println("Enter Total Amount");
//		double totalAmount = scan.nextDouble();
//		scan.nextLine();
//
//		System.out.println("Enter Address");
//		String address = scan.nextLine();
//
//		System.out.println("Enter Payment Method");
//		String paymentMethod = scan.nextLine();
//
//		System.out.println("Enter Status");
//		String status = scan.nextLine();
//
//		Orders order = new Orders(userId, restaurantId,
//				totalAmount, address,
//				paymentMethod, status);
//		odi.addOrder(order);
//		System.out.println("Order Added Successfully");
//		OrderDaoImpl odi = new OrderDaoImpl();
//		System.out.println("Enter Order Id to Fetch");
//		int orderId = scan.nextInt();
//
//		Orders o = odi.getOrder(orderId);
//		System.out.println(o);
		
		
//		OrderDaoImpl odi = new OrderDaoImpl();
//		System.out.println("Enter Order Id to Update");
//		int orderId = scan.nextInt();
//		scan.nextLine();
//
//		Orders updateOrder = odi.getOrder(orderId);
//
//
//		System.out.println("Enter New Payment Method");
//		String newPaymentMethod = scan.nextLine();
//
//		System.out.println("Enter New Status");
//		String newStatus = scan.nextLine();
//
//		updateOrder.setPaymentMethod(newPaymentMethod);
//		updateOrder.setStatus(newStatus);
//
//		odi.updateOrder(updateOrder);
//
//		System.out.println("Order Updated Successfully");
//		System.out.println(updateOrder);
		
		
//		OrderDaoImpl odi = new OrderDaoImpl();
//		System.out.println("Enter Order Id to Delete");
//		int orderId = scan.nextInt();
//
//		odi.deleteOrder(orderId);
//
//		System.out.println("Order Deleted Successfully");

		OrderDaoImpl odi = new OrderDaoImpl();
		List<Orders> orders = odi.getAllOrders();

		for (Orders ord : orders) {
			System.out.println(ord);
		}

	

		scan.close();
	}
}
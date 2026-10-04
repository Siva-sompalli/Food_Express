package com.foodexpress.main;

import java.util.List;
import java.util.Scanner;

import com.foodexpress.daoimpl.OrderItemDaoImpl;
import com.foodexpress.model.OrderItem;

public class OrderItemLaunch {

	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);
//		OrderItemDaoImpl oidi = new OrderItemDaoImpl();
//
//		System.out.println("Enter Order Id");
//		int orderId = scan.nextInt();
//		scan.nextLine();
//
//		System.out.println("Enter Item Name");
//		String itemName = scan.nextLine();
//
//		System.out.println("Enter Quantity");
//		int quantity = scan.nextInt();
//
//		System.out.println("Enter Total Price");
//		double totalPrice = scan.nextDouble();
//
//		OrderItem orderItem = new OrderItem(orderId,
//				itemName, quantity, totalPrice);
//
//		oidi.addOrderItem(orderItem);
//
//		System.out.println("Order Item Added Successfully");
		
//		
//		OrderItemDaoImpl oidi = new OrderItemDaoImpl();
//		System.out.println("Enter OrderItem Id");
//		int orderItemId = scan.nextInt();
//
//		OrderItem oi = oidi.getOrderItem(orderItemId);
//		System.out.println(oi);
		
		
//		OrderItemDaoImpl oidi = new OrderItemDaoImpl();
//		System.out.println("Enter OrderItem Id to Update");
//		int orderItemId = scan.nextInt();
//		scan.nextLine();
//
//		OrderItem updateItem = oidi.getOrderItem(orderItemId);
//
//		System.out.println("Enter New Quantity");
//		int newQuantity = scan.nextInt();
//
//		System.out.println("Enter New Total Price");
//		double newTotalPrice = scan.nextDouble();
//
//		updateItem.setQuantity(newQuantity);
//		updateItem.setTotalPrice(newTotalPrice);
//
//		oidi.updateOrderItem(updateItem);
//
//		System.out.println("Order Item Updated Successfully");
		
//		OrderItemDaoImpl oidi = new OrderItemDaoImpl();
//		System.out.println("Enter OrderItem Id to Delete");
//		int orderItemId = scan.nextInt();
//		oidi.deleteOrderItem(orderItemId);
//		System.out.println("Order Item Deleted Successfully");
		
		
		OrderItemDaoImpl oidi = new OrderItemDaoImpl();
		List<OrderItem> orderItems = oidi.getAllOrderItems();

		for (OrderItem item : orderItems) {
			System.out.println(item);
		}  
		
		scan.close();
	}
}
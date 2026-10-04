package com.foodexpress.dao;

import java.util.List;
import com.foodexpress.model.Orders;

public interface OrderDao {

	int addOrder(Orders order);

	Orders getOrder(int orderId);

	void updateOrder(Orders order);

	void deleteOrder(int orderId);

	List<Orders> getOrdersByUser(int userId);
	
	List<Orders> getAllOrders();
	
	List<Orders> searchOrders(String keyword);
}
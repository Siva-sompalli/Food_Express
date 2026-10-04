package com.foodexpress.dao;

import java.util.List;
import com.foodexpress.model.OrderItem;

public interface OrderItemDao {

    void addOrderItem(OrderItem orderItem);

    OrderItem getOrderItem(int orderItemId);

    void updateOrderItem(OrderItem orderItem);

    void deleteOrderItem(int orderItemId);

    List<OrderItem> getAllOrderItems();

    // Fetch all items of a particular order
    List<OrderItem> getOrderItemsByOrder(int orderId);

}
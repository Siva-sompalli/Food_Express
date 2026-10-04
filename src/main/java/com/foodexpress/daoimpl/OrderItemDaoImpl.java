package com.foodexpress.daoimpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.foodexpress.dao.OrderItemDao;
import com.foodexpress.model.OrderItem;
import com.foodexpress.utility.DbConnection;

public class OrderItemDaoImpl implements OrderItemDao {

	private Connection con;

	String ADD_ORDERITEM =
			"INSERT INTO orderitem(orderId,itemName,quantity,totalPrice) VALUES(?,?,?,?)";

	String GET_ORDERITEM =
			"SELECT * FROM orderitem WHERE orderItemId=?";

	String UPDATE_ORDERITEM =
			"UPDATE orderitem SET orderId=?,itemName=?,quantity=?,totalPrice=? WHERE orderItemId=?";

	String DELETE_ORDERITEM =
			"DELETE FROM orderitem WHERE orderItemId=?";

	String FETCH_ALL_ORDERITEMS =
			"SELECT * FROM orderitem";

	String GET_ORDER_ITEMS_BY_ORDER =
	        "SELECT * FROM orderitem WHERE orderId=?";
	
	public OrderItemDaoImpl() {
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
	public void addOrderItem(OrderItem orderItem) {
		Connection connection = getConnection();
		if (connection == null) {
			System.err.println("OrderItemDaoImpl.addOrderItem: Connection is null");
			return;
		}

		try (PreparedStatement pstmt = connection.prepareStatement(ADD_ORDERITEM)) {

			pstmt.setInt(1, orderItem.getOrderId());
			pstmt.setString(2, orderItem.getItemName());
			pstmt.setInt(3, orderItem.getQuantity());
			pstmt.setDouble(4, orderItem.getTotalPrice());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public OrderItem getOrderItem(int orderItemId) {

		OrderItem orderItem = null;
		Connection connection = getConnection();
		if (connection == null) {
			System.err.println("OrderItemDaoImpl.getOrderItem: Connection is null");
			return null;
		}

		try (PreparedStatement pstmt = connection.prepareStatement(GET_ORDERITEM)) {

			pstmt.setInt(1, orderItemId);

			ResultSet result = pstmt.executeQuery();

			if (result.next()) {

				int id = result.getInt("orderItemId");
				int orderId = result.getInt("orderId");
				String itemName = result.getString("itemName");
				int quantity = result.getInt("quantity");
				double totalPrice = result.getDouble("totalPrice");

				orderItem = new OrderItem(id, orderId, itemName,
						quantity, totalPrice);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return orderItem;
	}

	@Override
	public void updateOrderItem(OrderItem orderItem) {

		Connection connection = getConnection();
		if (connection == null) {
			System.err.println("OrderItemDaoImpl.updateOrderItem: Connection is null");
			return;
		}

		try (PreparedStatement pstmt = connection.prepareStatement(UPDATE_ORDERITEM)) {

			pstmt.setInt(1, orderItem.getOrderId());
			pstmt.setString(2, orderItem.getItemName());
			pstmt.setInt(3, orderItem.getQuantity());
			pstmt.setDouble(4, orderItem.getTotalPrice());
			pstmt.setInt(5, orderItem.getOrderItemId());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteOrderItem(int orderItemId) {

		Connection connection = getConnection();
		if (connection == null) {
			System.err.println("OrderItemDaoImpl.deleteOrderItem: Connection is null");
			return;
		}

		try (PreparedStatement pstmt = connection.prepareStatement(DELETE_ORDERITEM)) {

			pstmt.setInt(1, orderItemId);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<OrderItem> getAllOrderItems() {

		List<OrderItem> orderItems = new ArrayList<>();
		OrderItem orderItem = null;
		Connection connection = getConnection();
		if (connection == null) {
			System.err.println("OrderItemDaoImpl.getAllOrderItems: Connection is null");
			return orderItems;
		}

		try (PreparedStatement pstmt = connection.prepareStatement(FETCH_ALL_ORDERITEMS);
			 ResultSet result = pstmt.executeQuery()) {

			while (result.next()) {

				int id = result.getInt("orderItemId");
				int orderId = result.getInt("orderId");
				String itemName = result.getString("itemName");
				int quantity = result.getInt("quantity");
				double totalPrice = result.getDouble("totalPrice");

				orderItem = new OrderItem(id, orderId, itemName,
						quantity, totalPrice);

				orderItems.add(orderItem);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return orderItems;
	}
	@Override
	public List<OrderItem> getOrderItemsByOrder(int orderId) {

	    List<OrderItem> orderItems = new ArrayList<>();
		Connection connection = getConnection();
		if (connection == null) {
			System.err.println("OrderItemDaoImpl.getOrderItemsByOrder: Connection is null");
			return orderItems;
		}

	    try (PreparedStatement pstmt =
	            connection.prepareStatement(GET_ORDER_ITEMS_BY_ORDER)) {

	        pstmt.setInt(1, orderId);

	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {

	            OrderItem orderItem = new OrderItem(

	                    rs.getInt("orderItemId"),

	                    rs.getInt("orderId"),

	                    rs.getString("itemName"),

	                    rs.getInt("quantity"),

	                    rs.getDouble("totalPrice")

	            );

	            orderItems.add(orderItem);

	        }

	    } catch (SQLException e) {

	        e.printStackTrace();

	    }

	    return orderItems;

	}
}
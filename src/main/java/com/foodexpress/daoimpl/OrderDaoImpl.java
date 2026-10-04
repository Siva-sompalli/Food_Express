package com.foodexpress.daoimpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.foodexpress.dao.OrderDao;
import com.foodexpress.model.Orders;
import com.foodexpress.utility.DbConnection;

public class OrderDaoImpl implements OrderDao {

	private Connection con;

	String ADD_ORDER =
			"INSERT INTO orders(userId,restaurantId,totalAmount,orderDate,address,paymentMethod,status) VALUES(?,?,?,?,?,?,?)";

	String GET_ORDER =
			"SELECT * FROM orders WHERE orderId=?";

	String UPDATE_ORDER =
			"UPDATE orders SET userId=?,restaurantId=?,totalAmount=?,address=?,paymentMethod=?,status=? WHERE orderId=?";

	String DELETE_ORDER =
			"DELETE FROM orders WHERE orderId=?";

	String FETCH_ALL_ORDERS =
			"SELECT * FROM orders";
	
	String GET_USER_ORDERS =
			"SELECT * FROM orders WHERE userId=? ORDER BY orderDate DESC";
	
	String SEARCH_ORDER =
			"SELECT * FROM orders WHERE " +
			"CAST(orderId AS CHAR) LIKE ? " +
			"OR CAST(userId AS CHAR) LIKE ? " +
			"OR paymentMethod LIKE ? " +
			"OR status LIKE ?";

	public OrderDaoImpl() {
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
	public int  addOrder(Orders order) {
		int orderId = 0;
		Connection connection = getConnection();
		if (connection == null) {
			System.err.println("OrderDaoImpl.addOrder: Connection is null");
			return 0;
		}

		try (PreparedStatement pstmt = connection.prepareStatement(ADD_ORDER,Statement.RETURN_GENERATED_KEYS)) {

			pstmt.setInt(1, order.getUserId());
			pstmt.setInt(2, order.getRestaurantId());
			pstmt.setDouble(3, order.getTotalAmount());
			pstmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
			pstmt.setString(5, order.getAddress());
			pstmt.setString(6, order.getPaymentMethod());
			pstmt.setString(7, order.getStatus());

			pstmt.executeUpdate();
			
			ResultSet rs = pstmt.getGeneratedKeys();

			if (rs.next()) {
				orderId = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orderId;
	}

	@Override
	public Orders getOrder(int orderId) {

		Orders order = null;
		Connection connection = getConnection();
		if (connection == null) {
			System.err.println("OrderDaoImpl.getOrder: Connection is null");
			return null;
		}

		try (PreparedStatement pstmt = connection.prepareStatement(GET_ORDER)) {

			pstmt.setInt(1, orderId);

			ResultSet result = pstmt.executeQuery();

			if (result.next()) {

				int id = result.getInt("orderId");
				int userId = result.getInt("userId");
				int restaurantId = result.getInt("restaurantId");
				double totalAmount = result.getDouble("totalAmount");
				Timestamp orderDate = result.getTimestamp("orderDate");
				String address = result.getString("address");
				String paymentMethod = result.getString("paymentMethod");
				String status = result.getString("status");

				order = new Orders(id, userId, restaurantId,
						totalAmount, orderDate,
						address, paymentMethod, status);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return order;
	}

	@Override
	public void updateOrder(Orders order) {

		Connection connection = getConnection();
		if (connection == null) {
			System.err.println("OrderDaoImpl.updateOrder: Connection is null");
			return;
		}

		try (PreparedStatement pstmt = connection.prepareStatement(UPDATE_ORDER)) {

			pstmt.setInt(1, order.getUserId());
			pstmt.setInt(2, order.getRestaurantId());
			pstmt.setDouble(3, order.getTotalAmount());
			pstmt.setString(4, order.getAddress());
			pstmt.setString(5, order.getPaymentMethod());
			pstmt.setString(6, order.getStatus());
			pstmt.setInt(7, order.getOrderId());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteOrder(int orderId) {

		Connection connection = getConnection();
		if (connection == null) {
			System.err.println("OrderDaoImpl.deleteOrder: Connection is null");
			return;
		}

		try (PreparedStatement pstmt = connection.prepareStatement(DELETE_ORDER)) {

			pstmt.setInt(1, orderId);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Orders> getOrdersByUser(int userId) {

	    List<Orders> orders = new ArrayList<>();
		Connection connection = getConnection();
		if (connection == null) {
			System.err.println("OrderDaoImpl.getOrdersByUser: Connection is null");
			return orders;
		}

	    try (PreparedStatement pstmt = connection.prepareStatement(GET_USER_ORDERS)) {

	        pstmt.setInt(1, userId);

	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {

	            Orders order = new Orders(

	                    rs.getInt("orderId"),

	                    rs.getInt("userId"),

	                    rs.getInt("restaurantId"),

	                    rs.getDouble("totalAmount"),

	                    rs.getTimestamp("orderDate"),

	                    rs.getString("address"),

	                    rs.getString("paymentMethod"),

	                    rs.getString("status")

	            );

	            orders.add(order);

	        }

	    } catch (SQLException e) {

	        e.printStackTrace();

	    }

	    return orders;
	}
	
	
	@Override
	public List<Orders> getAllOrders() {

		List<Orders> orders = new ArrayList<>();
		Orders order = null;
		Connection connection = getConnection();
		if (connection == null) {
			System.err.println("OrderDaoImpl.getAllOrders: Connection is null");
			return orders;
		}

		try (PreparedStatement pstmt = connection.prepareStatement(FETCH_ALL_ORDERS);
			 ResultSet result = pstmt.executeQuery()) {

			while (result.next()) {

				int id = result.getInt("orderId");
				int userId = result.getInt("userId");
				int restaurantId = result.getInt("restaurantId");
				double totalAmount = result.getDouble("totalAmount");
				Timestamp orderDate = result.getTimestamp("orderDate");
				String address = result.getString("address");
				String paymentMethod = result.getString("paymentMethod");
				String status = result.getString("status");

				order = new Orders(id, userId, restaurantId,
						totalAmount, orderDate,
						address, paymentMethod, status);

				orders.add(order);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return orders;
	}
	
	@Override
	public List<Orders> searchOrders(String keyword) {

	    List<Orders> orders = new ArrayList<>();
		Connection connection = getConnection();
		if (connection == null) {
			System.err.println("OrderDaoImpl.searchOrders: Connection is null");
			return orders;
		}

	    try (PreparedStatement pstmt = connection.prepareStatement(SEARCH_ORDER)) {

	        String key = "%" + keyword + "%";

	        pstmt.setString(1, key);
	        pstmt.setString(2, key);
	        pstmt.setString(3, key);
	        pstmt.setString(4, key);

	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {

	            Orders order = new Orders(

	                rs.getInt("orderId"),
	                rs.getInt("userId"),
	                rs.getInt("restaurantId"),
	                rs.getDouble("totalAmount"),
	                rs.getTimestamp("orderDate"),
	                rs.getString("address"),
	                rs.getString("paymentMethod"),
	                rs.getString("status")

	            );

	            orders.add(order);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return orders;
	}
}
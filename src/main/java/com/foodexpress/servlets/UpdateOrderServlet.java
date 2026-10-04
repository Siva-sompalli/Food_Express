package com.foodexpress.servlets;

import java.io.IOException;

import com.foodexpress.dao.OrderDao;
import com.foodexpress.daoimpl.OrderDaoImpl;
import com.foodexpress.model.Orders;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateOrder")
public class UpdateOrderServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private OrderDao orderDao;

	@Override
	public void init() throws ServletException {

		orderDao = new OrderDaoImpl();

	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		try {

			int orderId = Integer.parseInt(request.getParameter("orderId"));
			int userId = Integer.parseInt(request.getParameter("userId"));
			int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));
			double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));

			String address = request.getParameter("address");
			String paymentMethod = request.getParameter("paymentMethod");
			String status = request.getParameter("status");

			Orders order = new Orders();

			order.setOrderId(orderId);
			order.setUserId(userId);
			order.setRestaurantId(restaurantId);
			order.setTotalAmount(totalAmount);
			order.setAddress(address);
			order.setPaymentMethod(paymentMethod);
			order.setStatus(status);

			orderDao.updateOrder(order);

			response.sendRedirect("orders");

		}
		catch (Exception e) {

			e.printStackTrace();

			response.sendRedirect("orders");

		}

	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);

	}

}
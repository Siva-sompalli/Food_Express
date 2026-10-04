package com.foodexpress.servlets;

import java.io.IOException;

import com.foodexpress.dao.OrderDao;
import com.foodexpress.dao.OrderItemDao;
import com.foodexpress.daoimpl.OrderDaoImpl;
import com.foodexpress.daoimpl.OrderItemDaoImpl;
import com.foodexpress.model.Cart;
import com.foodexpress.model.CartItem;
import com.foodexpress.model.OrderItem;
import com.foodexpress.model.Orders;
import com.foodexpress.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private OrderDao orderDao;
	private OrderItemDao orderItemDao;

	@Override
	public void init() throws ServletException {

		orderDao = new OrderDaoImpl();
		orderItemDao = new OrderItemDaoImpl();

	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		User user = (User) session.getAttribute("user");

		Cart cart = (Cart) session.getAttribute("cart");

		if (user == null) {

			response.sendRedirect("Login.jsp");
			return;

		}

		if (cart == null || cart.getItems().isEmpty()) {

			response.sendRedirect("Cart.jsp");
			return;

		}

		String address = request.getParameter("address");
		String paymentMethod = request.getParameter("paymentMethod");

		double subtotal = cart.getTotalAmount();

		double delivery = 40.0;

		double gst = subtotal * 0.05;

		double totalAmount = subtotal + delivery + gst;

		Orders order = new Orders(

		        user.getUserId(),

		        cart.getRestaurantId(),

		        totalAmount,

		        address,

		        paymentMethod,

		        "Pending"

		);

		int orderId = orderDao.addOrder(order);

		for (CartItem item : cart.getItems()) {

			OrderItem orderItem = new OrderItem(

					orderId,

					item.getName(),

					item.getQuantity(),

					item.getTotalPrice()

			);

			orderItemDao.addOrderItem(orderItem);

		}

		cart.clearCart();

		session.setAttribute("cart", cart);

		response.sendRedirect("OrderSuccess.jsp");

	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		response.sendRedirect("Checkout.jsp");

	}
}
package com.foodexpress.servlets;

import java.io.IOException;
import java.util.List;

import com.foodexpress.dao.MenuDao;
import com.foodexpress.dao.OrderDao;
import com.foodexpress.dao.RestaurantDao;
import com.foodexpress.dao.UserDao;
import com.foodexpress.daoimpl.MenuDaoImpl;
import com.foodexpress.daoimpl.OrderDaoImpl;
import com.foodexpress.daoimpl.RestaurantDaoImpl;
import com.foodexpress.daoimpl.UserDaoImpl;
import com.foodexpress.model.Menu;
import com.foodexpress.model.Orders;
import com.foodexpress.model.Restaurant;
import com.foodexpress.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/analytics")
public class AnalyticsServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private RestaurantDao restaurantDao;
	private MenuDao menuDao;
	private UserDao userDao;
	private OrderDao orderDao;

	@Override
	public void init() throws ServletException {

		restaurantDao = new RestaurantDaoImpl();
		menuDao = new MenuDaoImpl();
		userDao = new UserDaoImpl();
		orderDao = new OrderDaoImpl();

	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		try {

			List<Restaurant> restaurants = restaurantDao.getAllRestaurants();
			List<Menu> menus = menuDao.getAllMenus();
			List<User> customers = userDao.getAllUsers();
			List<Orders> orders = orderDao.getAllOrders();

			int restaurantCount = restaurants.size();
			int menuCount = menus.size();
			int customerCount = customers.size();
			int orderCount = orders.size();

			double totalRevenue = 0;

			int pending = 0;
			int preparing = 0;
			int delivery = 0;
			int delivered = 0;
			int cancelled = 0;

			for (Orders order : orders) {

				totalRevenue += order.getTotalAmount();

				String status = order.getStatus();

				if ("Pending".equalsIgnoreCase(status)) {

					pending++;

				} else if ("Preparing".equalsIgnoreCase(status)) {

					preparing++;

				} else if ("Out for Delivery".equalsIgnoreCase(status)) {

					delivery++;

				} else if ("Delivered".equalsIgnoreCase(status)) {

					delivered++;

				} else if ("Cancelled".equalsIgnoreCase(status)) {

					cancelled++;

				}

			}

			request.setAttribute("restaurantCount", restaurantCount);
			request.setAttribute("menuCount", menuCount);
			request.setAttribute("customerCount", customerCount);
			request.setAttribute("orderCount", orderCount);

			request.setAttribute("totalRevenue", totalRevenue);

			request.setAttribute("pending", pending);
			request.setAttribute("preparing", preparing);
			request.setAttribute("delivery", delivery);
			request.setAttribute("delivered", delivered);
			request.setAttribute("cancelled", cancelled);

			request.getRequestDispatcher("Analytics.jsp")
					.forward(request, response);

		} catch (Exception e) {

			e.printStackTrace();

			response.sendRedirect("dashboard");

		}

	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);

	}

}
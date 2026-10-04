package com.foodexpress.servlets;

import java.io.IOException;

import com.foodexpress.dao.MenuDao;
import com.foodexpress.dao.OrderDao;
import com.foodexpress.dao.RestaurantDao;
import com.foodexpress.dao.UserDao;
import com.foodexpress.daoimpl.MenuDaoImpl;
import com.foodexpress.daoimpl.OrderDaoImpl;
import com.foodexpress.daoimpl.RestaurantDaoImpl;
import com.foodexpress.daoimpl.UserDaoImpl;
import com.foodexpress.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

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

		HttpSession session = request.getSession(false);

		if (session == null) {

			response.sendRedirect("Login.jsp");
			return;

		}

		User user = (User) session.getAttribute("user");

		if (user == null) {

			response.sendRedirect("Login.jsp");
			return;

		}

		int restaurantCount = restaurantDao.getAllRestaurants().size();

		int menuCount = menuDao.getAllMenus().size();

		int customerCount = userDao.getAllUsers().size();

		int orderCount = orderDao.getAllOrders().size();

		request.setAttribute("restaurantCount", restaurantCount);

		request.setAttribute("menuCount", menuCount);

		request.setAttribute("customerCount", customerCount);

		request.setAttribute("orderCount", orderCount);

		request.setAttribute("activePage", "dashboard");

		request.getRequestDispatcher("AdminDashboard.jsp")
				.forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);

	}
}
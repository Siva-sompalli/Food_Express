package com.foodexpress.servlets;

import java.io.IOException;
import java.util.List;

import com.foodexpress.dao.MenuDao;
import com.foodexpress.dao.RestaurantDao;
import com.foodexpress.daoimpl.MenuDaoImpl;
import com.foodexpress.daoimpl.RestaurantDaoImpl;
import com.foodexpress.model.Menu;
import com.foodexpress.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private MenuDao menuDao;
	private RestaurantDao restaurantDao;

	@Override
	public void init() {

		menuDao = new MenuDaoImpl();
		restaurantDao = new RestaurantDaoImpl();

	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		int restaurantId =
				Integer.parseInt(request.getParameter("restaurantId"));

		List<Menu> menuList =
				menuDao.getMenusByRestaurant(restaurantId);

		Restaurant restaurant =
				restaurantDao.getRestaurant(restaurantId);

		request.setAttribute("restaurant", restaurant);
		request.setAttribute("menuList", menuList);

		request.getRequestDispatcher("Menu.jsp")
				.forward(request, response);
	}
}
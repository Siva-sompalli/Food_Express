package com.foodexpress.servlets;

import java.io.IOException;

import com.foodexpress.dao.RestaurantDao;
import com.foodexpress.daoimpl.RestaurantDaoImpl;
import com.foodexpress.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addRestaurant")
public class AddRestaurantServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private RestaurantDao restaurantDao;

	@Override
	public void init() throws ServletException {

		restaurantDao = new RestaurantDaoImpl();

	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		try {

			String name = request.getParameter("name");

			int adminId = Integer.parseInt(
					request.getParameter("adminId"));

			String address = request.getParameter("address");

			String cuisineType = request.getParameter("cuisineType");

			double rating = Double.parseDouble(
					request.getParameter("rating"));

			int eta = Integer.parseInt(
					request.getParameter("eta"));

			String imageUrl = request.getParameter("imageUrl");

			boolean isAvailable = Boolean.parseBoolean(
					request.getParameter("isAvailable"));

			Restaurant restaurant = new Restaurant(
					name,
					adminId,
					address,
					cuisineType,
					rating,
					eta,
					imageUrl,
					isAvailable
			);

			restaurantDao.addRestaurant(restaurant);

			response.sendRedirect("restaurants");

		}
		catch (Exception e) {

			e.printStackTrace();

			response.sendRedirect("AddRestaurant.jsp");

		}

	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		response.sendRedirect("AddRestaurant.jsp");

	}
}
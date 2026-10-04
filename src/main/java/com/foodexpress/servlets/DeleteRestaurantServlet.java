package com.foodexpress.servlets;

import java.io.IOException;

import com.foodexpress.dao.RestaurantDao;
import com.foodexpress.daoimpl.RestaurantDaoImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteRestaurant")
public class DeleteRestaurantServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private RestaurantDao restaurantDao;

	@Override
	public void init() throws ServletException {

		restaurantDao = new RestaurantDaoImpl();

	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		try {

			int restaurantId = Integer.parseInt(
					request.getParameter("id"));

			restaurantDao.deleteRestaurant(restaurantId);

			response.sendRedirect("restaurants");

		}
		catch (Exception e) {

			e.printStackTrace();

			response.sendRedirect("restaurants");

		}

	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);

	}

}
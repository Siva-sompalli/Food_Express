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

@WebServlet("/editRestaurant")
public class EditRestaurantServlet extends HttpServlet {

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

			Restaurant restaurant =
					restaurantDao.getRestaurant(restaurantId);

			request.setAttribute("restaurant", restaurant);

			request.getRequestDispatcher("EditRestaurant.jsp")
				   .forward(request, response);

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
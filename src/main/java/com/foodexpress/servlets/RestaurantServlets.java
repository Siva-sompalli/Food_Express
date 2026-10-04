package com.foodexpress.servlets;

import java.io.IOException;
import java.util.List;

import com.foodexpress.dao.RestaurantDao;
import com.foodexpress.daoimpl.RestaurantDaoImpl;
import com.foodexpress.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/restaurants")
public class RestaurantServlets extends HttpServlet {

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

	    String keyword = request.getParameter("keyword");

	    System.out.println("Keyword = " + keyword);

	    List<Restaurant> restaurants;

	    if (keyword != null && !keyword.trim().isEmpty()) {

	        restaurants = restaurantDao.searchRestaurant(keyword);

	        System.out.println("Search Result = " + restaurants.size());

	    } else {

	        restaurants = restaurantDao.getAllRestaurants();

	        System.out.println("All Restaurants = " + restaurants.size());
	    }

	    request.setAttribute("restaurants", restaurants);

	    request.getRequestDispatcher("Restaurants.jsp")
	           .forward(request, response);
	}

}
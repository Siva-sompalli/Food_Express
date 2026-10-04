package com.foodexpress.servlets;

import java.io.IOException;

import com.foodexpress.dao.MenuDao;
import com.foodexpress.daoimpl.MenuDaoImpl;
import com.foodexpress.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateMenu")
public class UpdateMenuServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private MenuDao menuDao;

	@Override
	public void init() throws ServletException {

		menuDao = new MenuDaoImpl();

	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		try {

			int menuId = Integer.parseInt(
					request.getParameter("menuId"));

			int restaurantId = Integer.parseInt(
					request.getParameter("restaurantId"));

			String name = request.getParameter("name");

			String description = request.getParameter("description");

			double price = Double.parseDouble(
					request.getParameter("price"));

			double rating = Double.parseDouble(
					request.getParameter("rating"));

			String imageUrl = request.getParameter("imageUrl");

			String type = request.getParameter("type");

			boolean isAvailable = Boolean.parseBoolean(
					request.getParameter("isAvailable"));

			Menu menu = new Menu(
					menuId,
					restaurantId,
					name,
					description,
					price,
					rating,
					imageUrl,
					type,
					isAvailable);

			menuDao.updateMenu(menu);

			response.sendRedirect("menuList?restaurantId=" + restaurantId);

		}
		catch (Exception e) {

			e.printStackTrace();

			response.sendRedirect("restaurants");

		}

	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);

	}

}
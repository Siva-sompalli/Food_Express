package com.foodexpress.servlets;

import java.io.IOException;

import com.foodexpress.dao.MenuDao;
import com.foodexpress.daoimpl.MenuDaoImpl;
import com.foodexpress.model.Cart;
import com.foodexpress.model.CartItem;
import com.foodexpress.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

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

		int menuId = Integer.parseInt(request.getParameter("menuId"));

		int quantity = Integer.parseInt(request.getParameter("quantity"));

		Menu menu = menuDao.getMenu(menuId);

		HttpSession session = request.getSession();

		Cart cart = (Cart) session.getAttribute("cart");

		if (cart == null) {

		    cart = new Cart();
		    cart.setRestaurantId(menu.getRestaurantId());

		    session.setAttribute("cart", cart);

		} else {

		    // User selected another restaurant
		    if (cart.getRestaurantId() != menu.getRestaurantId()) {

		        cart = new Cart();
		        cart.setRestaurantId(menu.getRestaurantId());

		        session.setAttribute("cart", cart);
		    }
		}
		
		CartItem item = new CartItem(

				menu.getMenuId(),

				menu.getRestaurantId(),

				menu.getName(),

				menu.getPrice(),

				quantity,

				menu.getImageUrl());

		cart.addItem(item);

		response.sendRedirect("Cart.jsp");

	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		response.sendRedirect("Cart.jsp");

	}
}
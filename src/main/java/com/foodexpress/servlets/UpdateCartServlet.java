package com.foodexpress.servlets;

import java.io.IOException;

import com.foodexpress.model.Cart;
import com.foodexpress.model.CartItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateCart")
public class UpdateCartServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		int menuId = Integer.parseInt(request.getParameter("menuId"));
		String action = request.getParameter("action");

		HttpSession session = request.getSession();

		Cart cart = (Cart) session.getAttribute("cart");

		if (cart != null) {

			CartItem item = cart.getItem(menuId);

			if (item != null) {

				int quantity = item.getQuantity();

				if ("increase".equals(action)) {

					cart.updateItem(menuId, quantity + 1);

				} else if ("decrease".equals(action)) {

					cart.updateItem(menuId, quantity - 1);

				}
			}
		}

		response.sendRedirect("Cart.jsp");
	}
}
package com.foodexpress.servlets;

import java.io.IOException;

import com.foodexpress.model.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/removeCart")
public class RemoveCartServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		int menuId = Integer.parseInt(request.getParameter("menuId"));

		HttpSession session = request.getSession();

		Cart cart = (Cart) session.getAttribute("cart");

		if (cart != null) {

			cart.removeItem(menuId);

			// Remove cart from session if it becomes empty
			if (cart.getItems().isEmpty()) {
				session.removeAttribute("cart");
			}
		}

		response.sendRedirect("Cart.jsp");
	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}
}
package com.foodexpress.servlets;

import java.io.IOException;

import com.foodexpress.dao.UserDao;
import com.foodexpress.daoimpl.UserDaoImpl;
import com.foodexpress.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private UserDao userDao;

	@Override
	public void init() throws ServletException {

		userDao = new UserDaoImpl();

	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		User user = userDao.getUser(email, password);

		if (user != null) {

			HttpSession session = request.getSession();

			session.setAttribute("user", user);

			if ("RestaurantAdmin".equalsIgnoreCase(user.getRole())) {

				response.sendRedirect("adminDashboard");

			} else {

				response.sendRedirect("restaurant");

			}

		} else {

			request.setAttribute("error",
					"Invalid Email or Password");

			request.getRequestDispatcher("Login.jsp")
					.forward(request, response);

		}
	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("Login.jsp").forward(request, response);

	}
}
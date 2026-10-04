package com.foodexpress.servlets;

import java.io.IOException;

import com.foodexpress.dao.UserDao;
import com.foodexpress.daoimpl.UserDaoImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteCustomer")
public class DeleteCustomerServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private UserDao userDao;

	@Override
	public void init() throws ServletException {

		userDao = new UserDaoImpl();

	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		try {

			int userId = Integer.parseInt(
					request.getParameter("userId"));

			userDao.deleteUser(userId);

			response.sendRedirect("customers");

		}
		catch (Exception e) {

			e.printStackTrace();

			response.sendRedirect("customers");

		}

	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);

	}

}
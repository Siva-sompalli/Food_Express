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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

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

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String phoneNumber = request.getParameter("phoneNumber");
		String role = request.getParameter("role");

		User user = new User(username, password, email,
		        address, phoneNumber, role);

		userDao.addUser(user);

		response.sendRedirect("Login.jsp");
	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		response.sendRedirect("Register.jsp");

	}
}
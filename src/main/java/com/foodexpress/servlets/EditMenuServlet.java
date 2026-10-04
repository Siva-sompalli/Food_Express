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

@WebServlet("/editMenu")
public class EditMenuServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private MenuDao menuDao;

	@Override
	public void init() throws ServletException {

		menuDao = new MenuDaoImpl();

	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		try {

			int menuId = Integer.parseInt(
					request.getParameter("menuId"));

			Menu menu = menuDao.getMenu(menuId);

			request.setAttribute("menu", menu);

			request.getRequestDispatcher("EditMenu.jsp")
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
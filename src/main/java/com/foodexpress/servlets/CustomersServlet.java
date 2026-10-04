package com.foodexpress.servlets;

import java.io.IOException;
import java.util.List;

import com.foodexpress.dao.UserDao;
import com.foodexpress.daoimpl.UserDaoImpl;
import com.foodexpress.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/customers")
public class CustomersServlet extends HttpServlet {

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

        String keyword = request.getParameter("keyword");

        List<User> customers;

        if (keyword != null && !keyword.trim().isEmpty()) {

            customers = userDao.searchCustomers(keyword);

        } else {

            customers = userDao.getAllUsers();

        }

        request.setAttribute("customers", customers);

        request.getRequestDispatcher("Customers.jsp")
               .forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);

    }

}
package com.foodexpress.servlets;

import java.io.IOException;

import com.foodexpress.dao.OrderDao;
import com.foodexpress.daoimpl.OrderDaoImpl;
import com.foodexpress.model.Orders;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/editOrder")
public class EditOrderServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private OrderDao orderDao;

    @Override
    public void init() throws ServletException {

        orderDao = new OrderDaoImpl();

    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int orderId = Integer.parseInt(
                    request.getParameter("orderId"));

            Orders order = orderDao.getOrder(orderId);

            request.setAttribute("order", order);

            request.getRequestDispatcher("EditOrder.jsp")
                   .forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect("orders");

        }

    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);

    }

}
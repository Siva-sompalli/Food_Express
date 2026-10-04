package com.foodexpress.servlets;

import java.io.IOException;
import java.util.List;

import com.foodexpress.dao.OrderDao;
import com.foodexpress.daoimpl.OrderDaoImpl;
import com.foodexpress.model.Orders;
import com.foodexpress.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/orderHistory")
public class OrderHistoryServlet extends HttpServlet {

    private OrderDao orderDao;

    @Override
    public void init() {

        orderDao = new OrderDaoImpl();

    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        if (user == null) {

            response.sendRedirect("Login.jsp");

            return;

        }

        List<Orders> orders =
                orderDao.getOrdersByUser(user.getUserId());

        request.setAttribute("orders", orders);

        request.getRequestDispatcher("OrderHistory.jsp")
                .forward(request, response);

    }

}
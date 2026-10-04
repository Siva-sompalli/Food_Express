	package com.foodexpress.servlets;
	
	import java.io.IOException;
	import java.util.List;
	
	import com.foodexpress.dao.OrderDao;
	import com.foodexpress.daoimpl.OrderDaoImpl;
	import com.foodexpress.model.Orders;
	
	import jakarta.servlet.ServletException;
	import jakarta.servlet.annotation.WebServlet;
	import jakarta.servlet.http.HttpServlet;
	import jakarta.servlet.http.HttpServletRequest;
	import jakarta.servlet.http.HttpServletResponse;
	
	@WebServlet("/orders")
	public class OrdersServlet extends HttpServlet {
	
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

	        String keyword = request.getParameter("keyword");

	        List<Orders> orders;

	        if (keyword != null && !keyword.trim().isEmpty()) {

	            orders = orderDao.searchOrders(keyword);

	        } else {

	            orders = orderDao.getAllOrders();

	        }

	        request.setAttribute("orders", orders);

	        request.getRequestDispatcher("Orders.jsp")
	               .forward(request, response);

	    }
	
	    @Override
	    protected void doPost(HttpServletRequest request,
	            HttpServletResponse response)
	            throws ServletException, IOException {
	
	        doGet(request, response);
	
	    }
	
	}
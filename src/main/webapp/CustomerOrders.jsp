<%@page import="java.util.List"%>
<%@page import="com.foodexpress.model.Orders"%>
<%@page import="com.foodexpress.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
User admin = (User)session.getAttribute("user");

if(admin == null){
	response.sendRedirect("Login.jsp");
	return;
}

List<Orders> orders = (List<Orders>)request.getAttribute("orders");
Integer userId = (Integer)request.getAttribute("userId");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Customer Orders</title>

<link rel="stylesheet" href="css/admin.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

</head>

<body>

<div class="sidebar">

	<jsp:include page="/WEB-INF/admin/sidebar.jsp"/>

</div>

<div class="main">

	<jsp:include page="/WEB-INF/admin/header.jsp"/>

	<!-- Title -->

	<div class="page-title">

		<div>

			<h1>Customer Orders</h1>

			<p>Order History of Customer #<%=userId%></p>

		</div>

		<a href="customers" class="btn">

			<i class="fa-solid fa-arrow-left"></i>

			Back

		</a>

	</div>

	<!-- Orders Table -->

	<div class="table-card">

		<table>

			<thead>

				<tr>

					<th>Order ID</th>

					<th>Restaurant ID</th>

					<th>Total Amount</th>

					<th>Payment</th>

					<th>Status</th>

					<th>Order Date</th>

					<th>Delivery Address</th>

				</tr>

			</thead>

			<tbody>

			<%

			if(orders != null && !orders.isEmpty()){

				for(Orders order : orders){

			%>

				<tr>

					<td>#<%=order.getOrderId()%></td>

					<td><%=order.getRestaurantId()%></td>

					<td>₹ <%=order.getTotalAmount()%></td>

					<td><%=order.getPaymentMethod()%></td>

					<td>

						<%

						String status = order.getStatus();

						if(status.equalsIgnoreCase("Pending")){
						%>

						<span class="order-status pending">Pending</span>

						<%

						}else if(status.equalsIgnoreCase("Preparing")){
						%>

						<span class="order-status preparing">Preparing</span>

						<%

						}else if(status.equalsIgnoreCase("Out for Delivery")){
						%>

						<span class="order-status delivery">Out for Delivery</span>

						<%

						}else if(status.equalsIgnoreCase("Delivered")){
						%>

						<span class="order-status delivered">Delivered</span>

						<%

						}else{
						%>

						<span class="order-status cancelled">Cancelled</span>

						<%

						}

						%>

					</td>

					<td><%=order.getOrderDate()%></td>

					<td><%=order.getAddress()%></td>

				</tr>

			<%

				}

			}else{

			%>

				<tr>

					<td colspan="7" class="no-data">

						No Orders Found

					</td>

				</tr>

			<%

			}

			%>

			</tbody>

		</table>

	</div>

</div>

</body>
</html>
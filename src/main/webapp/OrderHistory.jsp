<%@page import="java.util.List"%>
<%@page import="com.foodexpress.model.Orders"%>
<%@ page import="com.foodexpress.model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
User user = (User) session.getAttribute("user");

if (user == null) {
	response.sendRedirect("Login.jsp");
	return;
}
%>

<%
List<Orders> orders = (List<Orders>) request.getAttribute("orders");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>My Orders</title>

<link rel="stylesheet" href="css/orderhistory.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

</head>

<body>
<!-- ================= NAVBAR ================= -->

<nav class="navbar">

	<div class="logo">

		<i class="fa-solid fa-utensils"></i>

		Food Express

	</div>

	<ul class="nav-links">

		<li><a href="restaurant">
		

			<i class="fa-solid fa-store"></i>

			restaurants

		</a></li>

		<li><a href="Cart.jsp">

			<i class="fa-solid fa-cart-shopping"></i>

			Cart

		</a></li>

		<li><a class="active" href="#">

			<i class="fa-solid fa-box"></i>

			My Orders

		</a></li>

	</ul>

</nav>


<!-- ================= ORDER HISTORY ================= -->

<div class="history-container">

<h1>

<i class="fa-solid fa-clock-rotate-left"></i>

My Orders

</h1>

<%
if(orders==null || orders.isEmpty()){
%>

<div class="empty">

<i class="fa-solid fa-box-open"></i>

<h2>No Orders Yet</h2>

<p>Looks like you haven't placed any orders.</p>

<a href="restaurant">

<button>

Order Now

</button>

</a>

</div>

<%
}else{

for(Orders order : orders){
%>

<div class="order-card">

<div class="order-header">

<h2>

Order #<%=order.getOrderId()%>

</h2>

<span class="status">

<%=order.getStatus()%>

</span>

</div>

<hr>

<div class="row">

<b>Restaurant ID</b>

<span>

<%=order.getRestaurantId()%>

</span>

</div>

<div class="row">

<b>Order Date</b>

<span>

<%=order.getOrderDate()%>

</span>

</div>

<div class="row">

<b>Payment</b>

<span>

<%=order.getPaymentMethod()%>

</span>

</div>

<div class="row">

<b>Address</b>

<span>

<%=order.getAddress()%>

</span>

</div>

<div class="row total">

<b>Total</b>

<span>

₹ <%=order.getTotalAmount()%>

</span>

</div>

</div>

<%
}

}
%>

</div>


<!-- ================= FOOTER ================= -->

<footer>

<div class="footer-content">

<h2>

Food Express

</h2>

<p>

Fresh Food • Fast Delivery • Happy Customers

</p>

<div class="social">

<i class="fab fa-facebook"></i>

<i class="fab fa-instagram"></i>

<i class="fab fa-twitter"></i>

<i class="fab fa-linkedin"></i>

</div>

<p>

© 2026 Food Express Ordering System

</p>

</div>

</footer>

<script src="js/orderhistory.js"></script>

</body>
</html>
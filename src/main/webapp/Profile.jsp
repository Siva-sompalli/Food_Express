<%@page import="com.foodexpress.model.User"%>
<%@page import="com.foodexpress.model.Cart"%>
<%@page import="com.foodexpress.model.CartItem"%>
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
/* =========================================
   CART COUNT
========================================= */

Cart cart = (Cart) session.getAttribute("cart");

int cartCount = 0;

if (cart != null && cart.getItems() != null) {

    for (CartItem item : cart.getItems()) {

        cartCount += item.getQuantity();

    }
}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Food Express | Profile</title>

<link rel="stylesheet" href="css/profile.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

</head>

<body>
<%
%>
<!-- ================= NAVBAR ================= -->

<nav class="navbar">

	<div class="logo">

		<i class="fa-solid fa-utensils"></i>

		Food Express

	</div>

	<ul class="nav-links">

		<li><a href="restaurant">

				<i class="fa-solid fa-store"></i>

				Restaurant

		</a></li>

		   <li>

            <a href="Cart.jsp">

                <i class="fa-solid fa-cart-shopping"></i>

                Cart

                <span class="cart-count">

                    <%=cartCount%>

                </span>

            </a>

        </li>

			<a class="active" href="Profile.jsp">

				<i class="fa-solid fa-user"></i>

				Profile

			</a>

		</li>

	</ul>

</nav>


<!-- ================= PROFILE ================= -->

<div class="profile-container">

	<div class="profile-card">

		<div class="profile-header">

			<div class="profile-image">

				<i class="fa-solid fa-user"></i>

			</div>

			<h1>

				<%=user.getUsername()%>

			</h1>

			<p>

				<%=user.getRole()%>

			</p>

		</div>


		<div class="profile-details">

			<div class="detail">

				<i class="fa-solid fa-envelope"></i>

				<div>

					<h3>Email</h3>

					<p>

						<%=user.getEmail()%>

					</p>

				</div>

			</div>


			<div class="detail">

				<i class="fa-solid fa-phone"></i>

				<div>

					<h3>Phone Number</h3>

					<p>

						<%=user.getPhoneNumber()%>

					</p>

				</div>

			</div>


			<div class="detail">

				<i class="fa-solid fa-location-dot"></i>

				<div>

					<h3>Address</h3>

					<p>

						<%=user.getAddress()%>

					</p>

				</div>

			</div>

		</div>


		<div class="profile-buttons">

			<a href="orderHistory">

				<button class="btn orders">

					<i class="fa-solid fa-box"></i>

					My Orders

				</button>

			</a>

			<a href="restaurant">

				<button class="btn home">

					<i class="fa-solid fa-store"></i>

					Browse Restaurants

				</button>

			</a>

			<a href="logout">

				<button class="btn logout">

					<i class="fa-solid fa-right-from-bracket"></i>

					Logout

				</button>

			</a>

		</div>

	</div>

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

<script src="js/profile.js"></script>

</body>
</html>
<%@page import="java.util.List"%>
<%@page import="com.foodexpress.model.Menu"%>
<%@page import="com.foodexpress.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
User user = (User) session.getAttribute("user");

if(user == null){
	response.sendRedirect("Login.jsp");
	return;
}

List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");
Integer restaurantId = (Integer) request.getAttribute("restaurantId");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Food Express | Menu Management</title>

<link rel="stylesheet" href="css/admin.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

</head>

<body>

<div class="container">

	<!-- Sidebar -->

	<aside class="sidebar">

		<div class="logo">

			<i class="fa-solid fa-utensils"></i>

			Food Express

		</div>

		<ul>

			<li>

				<a href="dashboard">

					<i class="fa-solid fa-house"></i>

					Dashboard

				</a>

			</li>

			<li class="active">

				<a href="restaurants">

					<i class="fa-solid fa-store"></i>

					Restaurants

				</a>

			</li>

			<li>

				<a href="orders">

					<i class="fa-solid fa-cart-shopping"></i>

					Orders

				</a>

			</li>

			<li>

				<a href="customers">

					<i class="fa-solid fa-users"></i>

					Customers

				</a>

			</li>

			<li>

				<a href="analytics">

					<i class="fa-solid fa-chart-line"></i>

					Analytics

				</a>

			</li>

			<li class="logout">

				<a href="logout">

					<i class="fa-solid fa-right-from-bracket"></i>

					Logout

				</a>

			</li>

		</ul>

	</aside>

	<!-- Main -->

	<main class="main">

		<!-- Header -->

		<div class="topbar">

			<div class="search">

				<input type="text"
					   id="menuSearch"
					   placeholder="Search Food...">

				<i class="fa-solid fa-magnifying-glass"></i>

			</div>

			<div class="profile">

				<img src="images/admin.jpeg" alt="Admin">

				<div>

					<h3><%=user.getUsername()%></h3>

					<span>Administrator</span>

				</div>

			</div>

		</div>

		<!-- Title -->

		<div class="page-title">

			<div>

				<h1>Menu Management</h1>

				<p>Manage restaurant food items</p>

			</div>

			<div>

				<a href="AddMenu.jsp?restaurantId=<%=restaurantId%>"
				   class="btn">

					<i class="fa-solid fa-plus"></i>

					Add Menu

				</a>

			</div>

		</div>

		<!-- Table -->

		<div class="table-card">

			<table>

				<thead>

				<tr>

					<th>Image</th>

					<th>Name</th>

					<th>Description</th>

					<th>Price</th>

					<th>Rating</th>

					<th>Category</th>

					<th>Status</th>

					<th>Actions</th>

				</tr>

				</thead>

				<tbody>

				<%

				if(menuList!=null){

				for(Menu menu:menuList){

				%>

				<tr>

					<td>

						<img src="<%=menu.getImageUrl()%>"
							 class="restaurant-img">

					</td>

					<td>

						<%=menu.getName()%>

					</td>

					<td>

						<%=menu.getDescription()%>

					</td>

					<td>

						₹ <%=menu.getPrice()%>

					</td>

					<td>

						<%=menu.getRating()%>

					</td>

					<td>

						<%=menu.getType()%>

					</td>

					<td>

						<% if(menu.isAvailable()){ %>

						<span class="status active">

							Available

						</span>

						<% } else { %>

						<span class="status inactive">

							Unavailable

						</span>

						<% } %>

					</td>

					<td>

						<a href="editMenu?menuId=<%=menu.getMenuId()%>"
						   class="edit-btn">

							<i class="fa-solid fa-pen"></i>

						</a>

						<a href="deleteMenu?menuId=<%=menu.getMenuId()%>"
						   class="delete-btn"
						   onclick="return confirm('Delete this menu item?')">

							<i class="fa-solid fa-trash"></i>

						</a>

					</td>

				</tr>

				<%

				}

				}

				%>

				</tbody>

			</table>

		</div>

	</main>

</div>

<script src="js/admin.js"></script>

</body>

</html>
<%@page import="java.util.List"%>
<%@page import="com.foodexpress.model.Restaurant"%>
<%@page import="com.foodexpress.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
User user = (User) session.getAttribute("user");

if(user == null){
	response.sendRedirect("Login.jsp");
	return;
}

List<Restaurant> restaurants =
(List<Restaurant>) request.getAttribute("restaurants");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Food Express | Restaurants</title>

<link rel="stylesheet" href="css/admin.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

</head>

<body>

<%
request.setAttribute("activePage", "restaurants");
%>


<div class="container">

	<!-- Sidebar -->

	<div class="sidebar">

    <jsp:include page="/WEB-INF/admin/sidebar.jsp"/>

   </div>
	<!-- Main -->

	<main class="main">
	
	<jsp:include page="/WEB-INF/admin/header.jsp"/>

		<!-- Header -->

		<div class="topbar">

		<form action="restaurants" method="get" class="search">

    <input type="text"
           name="keyword"
           placeholder="Search Restaurant..."
           value="${param.keyword}">

    <button type="submit" class="search-btn">
        <i class="fa-solid fa-magnifying-glass"></i>
    </button>

</form>
		</div>

		<!-- Title -->

		<div class="page-title">

			<div>

				<h1>Restaurant Management</h1>

				<p>View, Edit and Manage Restaurants</p>

			</div>

			<a href="AddRestaurant.jsp" class="btn">

				<i class="fa-solid fa-plus"></i>

				Add Restaurant

			</a>

		</div>

		<!-- Restaurant Table -->

		<div class="table-card">

			<table>

				<thead>

					<tr>

						<th>Image</th>
						<th>Name</th>
						<th>Cuisine</th>
						<th>ETA</th>
						<th>Rating</th>
						<th>Status</th>
						<th>Actions</th>

					</tr>

				</thead>

				<tbody>

				<%

				if(restaurants != null){

					for(Restaurant r : restaurants){

				%>

				<tr>

					<td>

						<img src="<%=r.getImageUrl()%>"
							 class="restaurant-img">

					</td>

					<td>

						<%=r.getName()%>

					</td>

					<td>

						<%=r.getCuisineType()%>

					</td>

					<td>

						<%=r.getEta()%> mins

					</td>

					<td>

						⭐ <%=r.getRating()%>

					</td>

					<td>

						<% if(r.isAvailable()){ %>

						<span class="status active">

							Active

						</span>

						<% } else { %>

						<span class="status inactive">

							Inactive

						</span>

						<% } %>

					</td>

					<td>

						<a href="menuList?restaurantId=<%=r.getRestaurantId()%>"
						   class="menu-btn">

							<i class="fa-solid fa-utensils"></i>

							Menu

						</a>

						<a href="editRestaurant?id=<%=r.getRestaurantId()%>"
						   class="edit-btn">

							<i class="fa-solid fa-pen"></i>

						</a>

						<a href="deleteRestaurant?id=<%=r.getRestaurantId()%>"
						   class="delete-btn"
						   onclick="return confirm('Are you sure you want to delete this restaurant?')">

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
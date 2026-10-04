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

Menu menu = (Menu) request.getAttribute("menu");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Food Express | Edit Menu</title>

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

		<div class="form-card">

			<div class="title-row">

				<h1>Edit Menu Item</h1>

				<a href="menuList?restaurantId=<%=menu.getRestaurantId()%>"
				   class="back-btn">

					<i class="fa-solid fa-arrow-left"></i>

					Back

				</a>

			</div>

			<form action="updateMenu"
				  method="post"
				  class="restaurant-form">

				<input type="hidden"
					   name="menuId"
					   value="<%=menu.getMenuId()%>">

				<input type="hidden"
					   name="restaurantId"
					   value="<%=menu.getRestaurantId()%>">

				<div class="form-grid">

					<div class="input-group">

						<label>Food Name</label>

						<input type="text"
							   name="name"
							   value="<%=menu.getName()%>"
							   required>

					</div>

					<div class="input-group">

						<label>Price</label>

						<input type="number"
							   step="0.01"
							   name="price"
							   value="<%=menu.getPrice()%>"
							   required>

					</div>

					<div class="input-group full-width">

						<label>Description</label>

						<textarea
							name="description"
							rows="4"
							required><%=menu.getDescription()%></textarea>

					</div>

					<div class="input-group">

						<label>Rating</label>

						<input type="number"
							   step="0.1"
							   min="0"
							   max="5"
							   name="rating"
							   value="<%=menu.getRating()%>"
							   required>

					</div>

					<div class="input-group">

						<label>Category</label>

						<select name="type">

							<option value="Starter" <%="Starter".equals(menu.getType()) ? "selected" : ""%>>Starter</option>

							<option value="Main Course" <%="Main Course".equals(menu.getType()) ? "selected" : ""%>>Main Course</option>

							<option value="Biryani" <%="Biryani".equals(menu.getType()) ? "selected" : ""%>>Biryani</option>

							<option value="Pizza" <%="Pizza".equals(menu.getType()) ? "selected" : ""%>>Pizza</option>

							<option value="Burger" <%="Burger".equals(menu.getType()) ? "selected" : ""%>>Burger</option>

							<option value="Chinese" <%="Chinese".equals(menu.getType()) ? "selected" : ""%>>Chinese</option>

							<option value="Dessert" <%="Dessert".equals(menu.getType()) ? "selected" : ""%>>Dessert</option>

							<option value="Drinks" <%="Drinks".equals(menu.getType()) ? "selected" : ""%>>Drinks</option>

						</select>

					</div>

					<div class="input-group full-width">

						<label>Image URL</label>

						<input type="text"
							   name="imageUrl"
							   value="<%=menu.getImageUrl()%>"
							   required>

					</div>

					<div class="input-group">

						<label>Availability</label>

						<select name="isAvailable">

							<option value="true"
							<%=menu.isAvailable() ? "selected" : ""%>>

								Available

							</option>

							<option value="false"
							<%=!menu.isAvailable() ? "selected" : ""%>>

								Not Available

							</option>

						</select>

					</div>

				</div>

				<button class="save-btn">

					<i class="fa-solid fa-floppy-disk"></i>

					Update Menu

				</button>

			</form>

		</div>

	</main>

</div>

<script src="js/admin.js"></script>

</body>
</html>
<%@page import="com.foodexpress.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
User user=(User)session.getAttribute("user");

if(user==null){
	response.sendRedirect("Login.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Food Express | Add Restaurant</title>

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

				<h1>Add Restaurant</h1>

				<a href="restaurants" class="back-btn">

					<i class="fa-solid fa-arrow-left"></i>

					Back

				</a>

			</div>

			<form action="addRestaurant" method="post">

				<div class="form-grid">

					<div class="input-group">

						<label>Restaurant Name</label>

						<input type="text"
						name="name"
						required>

					</div>

					<div class="input-group">

						<label>Cuisine Type</label>

						<input type="text"
						name="cuisineType"
						required>

					</div>

					<div class="input-group">

						<label>Delivery Time (Minutes)</label>

						<input type="number"
						name="eta"
						required>

					</div>

					<div class="input-group">

						<label>Rating</label>

						<input type="number"
						step="0.1"
						min="0"
						max="5"
						name="rating"
						required>

					</div>

				</div>

				<div class="input-group full-width">
    <label>Restaurant Address</label>
    <textarea name="address"></textarea>
</div>

				<div class="input-group full-width">
    <label>Image URL</label>
    <input type="text" name="imageUrl">
</div>

				<div class="input-group">

					<label>Status</label>

					<select name="isAvailable">

						<option value="true">

							Active

						</option>

						<option value="false">

							Inactive

						</option>

					</select>

				</div>

				<input type="hidden"
				name="adminId"
				value="<%=user.getUserId()%>">
				<button class="save-btn">

					<i class="fa-solid fa-floppy-disk"></i>

					Save Restaurant

				</button>

			</form>

		</div>

	</main>

</div>

<script src="js/admin.js"></script>

</body>
</html>
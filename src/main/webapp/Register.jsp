<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Food Express | Register</title>

<link rel="stylesheet" href="css/register.css">

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

		<ul class="nav-links">

		<li><a href="restaurant">

				<i class="fa-solid fa-store"></i>

				Restaurants

		</a></li>

		<li><a href="Login.jsp">

			<i class="fa-solid fa-right-to-bracket"></i>

			Login

		</a></li>

	</ul>

</nav>

<!-- ================= REGISTER ================= -->

<div class="register-container">

	<div class="register-card">

		<div class="left-panel">

			<h1>Join Food Express</h1>

			<p>

				Create your account and enjoy delicious food
				delivered to your doorstep.

			</p>

		</div>

		<div class="right-panel">

			<h2>Create Account</h2>

			<form action="register" method="post">

				<div class="input-group">

					<label>Username</label>

					<input type="text"
						id="username"
						name="username"
						placeholder="Enter Username"
						required>

				</div>

				<div class="input-group">

					<label>Email</label>

					<input type="email"
						id="email"
						name="email"
						placeholder="Enter Email"
						required>

				</div>

				<div class="input-group">

					<label>Password</label>

					<input type="password"
						id="password"
						name="password"
						placeholder="Enter Password"
						required>

				</div>

				<div class="input-group">

					<label>Confirm Password</label>

					<input type="password"
						id="confirmPassword"
						name="confirmPassword"
						placeholder="Confirm Password"
						required>

				</div>

				<div class="input-group">

					<label>Phone Number</label>

					<input type="text"
						id="phoneNumber"
						name="phoneNumber"
						placeholder="Enter Phone Number"
						required>

				</div>

				<div class="input-group">

					<label>Address</label>

					<textarea id="address"
						name="address"
						rows="3"
						placeholder="Enter Address"
						required></textarea>

				</div>

				<div class="input-group">

					<label>Role</label>

					<select name="role">

						<option value="Customer">
							Customer
						</option>

						<option value="RestaurantAdmin">
							Restaurant Admin
						</option>

						<option value="DeliveryAgent">
							Delivery Agent
						</option>

					</select>

				</div>

				<button type="submit" class="register-btn">

					<i class="fa-solid fa-user-plus"></i>

					Register

				</button>

			</form>

			<div class="login-link">

				Already have an account?

				<a href="Login.jsp">

					Login Here

				</a>

			</div>

		</div>

	</div>

</div>

<!-- ================= FOOTER ================= -->

<footer>

	<div class="footer-content">

		<h2>Food Express</h2>

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

<script src="js/register.js"></script>

</body>
</html>
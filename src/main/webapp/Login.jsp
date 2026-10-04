<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Food Express | Login</title>

<link rel="stylesheet" href="css/login.css">

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

				Restaurants

		</a></li>

		<li><a href="Register.jsp">

			<i class="fa-solid fa-user-plus"></i>

			Register

		</a></li>

	</ul>

</nav>


<!-- ================= LOGIN ================= -->

<div class="login-container">

	<div class="login-card">

		<!-- LEFT PANEL -->

		<div class="left-panel">

			<h1>Welcome Back!</h1>

			<p>

				Login to continue ordering your favourite food
				from Food Express.

			</p>

			<div class="login-icon">
    <img src="images/LoginMixFoods2.png" alt="CraveX Logo">
</div>

		</div>

		<!-- RIGHT PANEL -->

		<div class="right-panel">

			<h2>Login</h2>

			<form action="login" method="post">

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

					<div class="password-box">

						<input type="password"
							id="password"
							name="password"
							placeholder="Enter Password"
							required>

						<i class="fa-solid fa-eye"
							id="togglePassword"></i>

					</div>

				</div>

				<div class="options">

					<label>

						<input type="checkbox">

						Remember Me

					</label>

					<a href="#">

						Forgot Password?

					</a>

				</div>

				<button type="submit"
					class="login-btn">

					<i class="fa-solid fa-right-to-bracket"></i>

					Login

				</button>

			</form>

			<div class="register-link">

				Don't have an account?

				<a href="Register.jsp">

					Register Here

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

<script src="js/login.js"></script>

</body>
</html>
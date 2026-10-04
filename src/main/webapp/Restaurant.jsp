<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.foodexpress.model.Restaurant"%>
<%@ page import="com.foodexpress.model.User" %>
<%@ page import="com.foodexpress.model.Cart"%>
<%@ page import="com.foodexpress.model.CartItem"%>
<%@ page import="java.util.Collection"%>
<%
User user = (User) session.getAttribute("user");
%>
<%
Cart cart = (Cart) session.getAttribute("cart");

int cartCount = 0;

if(cart != null && cart.getItems() != null){

    for(CartItem item : cart.getItems()){

        cartCount += item.getQuantity();

    }
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Food Express | Restaurants</title>

<link rel="stylesheet" href="css/restaurant.css">
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

    <!-- Restaurants - Public -->
    <li>
        <a class="active" href="restaurant">
            <i class="fa-solid fa-store"></i>
            Restaurants
        </a>
    </li>


    <!-- Cart -->
   <li>
    <a href="Cart.jsp">
        <i class="fa-solid fa-cart-shopping"></i>
        Cart
        <span class="cart-count"><%=cartCount%></span>
    </a>
</li>


    <!-- Profile -->
    <li>
        <a href="Profile.jsp">
            <i class="fa-solid fa-user"></i>
            Profile
        </a>
    </li>


    <!-- Login / Logout -->

    <%
    if(user != null){
    %>

        <li>
            <a href="logout">
                <i class="fa-solid fa-right-from-bracket"></i>
                Logout
            </a>
        </li>

    <%
    }else{
    %>

        <li>
            <a href="Login.jsp">
                <i class="fa-solid fa-right-to-bracket"></i>
                Login
            </a>
        </li>

    <%
    }
    %>

</ul>

</nav>


<!-- ================= HERO SECTION ================= -->

<section class="hero">

    <!-- Healthy Food - Left -->
    <div class="hero-food hero-food-left">
        <img src="images/Healthyfood.png"
             alt="Healthy Food">
    </div>


    <!-- Center Content -->
    <div class="hero-content">

        <h1>
            Delicious Food Delivered To Your Door
        </h1>

        <p>
            Order from your favourite restaurants in minutes.
        </p>

        <div class="search-box">

            <input type="text"
                   id="searchRestaurant"
                   placeholder="Search Restaurant or Cuisine">

            <button type="button">
                <i class="fa-solid fa-magnifying-glass"></i>
            </button>

        </div>

    </div>


    <!-- Fast Food - Right -->
    <div class="hero-food hero-food-right">
        <img src="images/Fastfood.png"
             alt="Fast Food">
    </div>

</section>

</section>


<!-- ================= CATEGORY ================= -->

<section class="category">

    <div class="category-item">🍕 Pizza</div>

    <div class="category-item">🍔 Burger</div>

    <div class="category-item">🍛 Biryani</div>

    <div class="category-item">🥗 Healthy</div>

    <div class="category-item">🍟 Snacks</div>

    <div class="category-item">🍜 Chinese</div>

</section>


<!-- ================= RESTAURANTS ================= -->

<section class="restaurants">

<h2>Popular Restaurants</h2>

<div class="restaurant-container">

<%

List<Restaurant> restaurants =(List<Restaurant>)request.getAttribute("restaurants");

if(restaurants!=null){

for(Restaurant restaurant : restaurants){

%>

<div class="restaurant-card">

    <img src="<%=restaurant.getImageUrl()%>"
         alt="Restaurant Image">

    <div class="card-body">

        <h3><%=restaurant.getName()%></h3>

        <div class="rating">

            ⭐ <%=restaurant.getRating()%>

        </div>

        <p>

            <i class="fa-solid fa-bowl-food"></i>

            <%=restaurant.getCuisineType()%>

        </p>

        <p>

            <i class="fa-solid fa-location-dot"></i>

            <%=restaurant.getAddress()%>

        </p>

        <div class="details">

            <span>

                <i class="fa-solid fa-clock"></i>

                <%=restaurant.getEta()%> mins

            </span>

            <span>

            <% if(restaurant.isAvailable()){ %>

                <span class="open">

                    ● Open

                </span>

            <% }else{ %>

                <span class="closed">

                    ● Closed

                </span>

            <% } %>

            </span>

        </div>

        <a href="menu?restaurantId=<%=restaurant.getRestaurantId()%>">

            <button class="menu-btn">

                View Menu

            </button>

        </a>

    </div>

</div>

<%

}

}else{

%>

<h2 style="text-align:center;color:gray">

No Restaurants Available

</h2>

<%

}

%>

</div>

</section>


<!-- ================= FOOTER ================= -->

<footer>

<div class="footer-content">

    <h2>Food Express</h2>

    <p>

        Fresh Food • Fast Delivery • Happy Customers

    </p>

    <div class="social">

        <i class="fa-brands fa-facebook"></i>

        <i class="fa-brands fa-instagram"></i>

        <i class="fa-brands fa-twitter"></i>

        <i class="fa-brands fa-linkedin"></i>

    </div>

    <p>

        © 2026 Food Express Ordering System

    </p>

</div>

</footer>


<script src="js/restaurant.js"></script>

</body>
</html>
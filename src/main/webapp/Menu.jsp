<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.foodexpress.model.Restaurant"%>
<%@ page import="com.foodexpress.model.Menu"%>
<%@ page import="com.foodexpress.model.User"%>
<%@ page import="com.foodexpress.model.Cart"%>
<%@ page import="com.foodexpress.model.CartItem"%>


<%
User user = (User) session.getAttribute("user");
%>


<%
Restaurant restaurant =
        (Restaurant) request.getAttribute("restaurant");

List menuList =
        (List) request.getAttribute("menuList");
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

    <title>
        <%=restaurant != null ? restaurant.getName() : "Food Express"%>
        | Menu
    </title>

    <link rel="stylesheet"
          href="css/menu.css">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

</head>


<body>


<!-- =========================================
     NAVBAR
========================================= -->

<nav class="navbar">


    <!-- LOGO -->

    <div class="logo">

        <i class="fa-solid fa-utensils"></i>

        Food Express

    </div>


    <!-- NAV LINKS -->

    <ul class="nav-links">


        <!-- HOME -->

        <li>

            <a href="Home.jsp">

                <i class="fa-solid fa-house"></i>

                Home

            </a>

        </li>


        <!-- RESTAURANTS -->

        <li>

            <a href="restaurant">

                <i class="fa-solid fa-store"></i>

                Restaurants

            </a>

        </li>


        <!-- CART -->

        <li>

            <a href="Cart.jsp">

                <i class="fa-solid fa-cart-shopping"></i>

                Cart

                <span class="cart-count">

                    <%=cartCount%>

                </span>

            </a>

        </li>


        <!-- PROFILE -->

        <li>

            <a href="Profile.jsp">

                <i class="fa-solid fa-user"></i>

                Profile

            </a>

        </li>


    </ul>

</nav>



<!-- =========================================
     RESTAURANT HEADER
========================================= -->

<%
if (restaurant != null) {
%>


<section class="restaurant-header">


    <!-- RESTAURANT IMAGE -->

    <img src="<%=restaurant.getImageUrl()%>"
         alt="<%=restaurant.getName()%>">


    <!-- RESTAURANT INFORMATION -->

    <div class="restaurant-info">


        <h1>

            <%=restaurant.getName()%>

        </h1>


        <p>

            ⭐ <%=restaurant.getRating()%>

        </p>


        <p>

            <i class="fa-solid fa-bowl-food"></i>

            <%=restaurant.getCuisineType()%>

        </p>


        <p>

            <i class="fa-solid fa-location-dot"></i>

            <%=restaurant.getAddress()%>

        </p>


        <p>

            <i class="fa-solid fa-clock"></i>

            Delivery in
            <%=restaurant.getEta()%>
            mins

        </p>


    </div>


</section>


<%
}
%>



<!-- =========================================
     SEARCH FOOD
========================================= -->

<section class="menu-section">


    <div class="search-container">

        <input type="text"
               id="searchFood"
               placeholder="Search food items...">

        <i class="fa-solid fa-magnifying-glass"></i>

    </div>



    <!-- =========================================
         MENU ITEMS
    ========================================= -->

    <div class="menu-container">


    <%

    if (menuList != null && !menuList.isEmpty()) {

        for (Menu menu : (List<Menu>) menuList) {

    %>


        <!-- MENU CARD -->

        <div class="menu-card">


            <!-- FOOD IMAGE -->

            <img src="<%=menu.getImageUrl()%>"
                 alt="<%=menu.getName()%>">


            <!-- FOOD DETAILS -->

            <div class="menu-details">


                <!-- NAME -->

                <h3>

                    <%=menu.getName()%>

                </h3>


                <!-- DESCRIPTION -->

                <p class="description">

                    <%=menu.getDescription()%>

                </p>


                <!-- PRICE + RATING -->

                <div class="price-rating">


                    <span class="price">

                        ₹ <%=menu.getPrice()%>

                    </span>


                    <span class="rating">

                        ⭐ <%=menu.getRating()%>

                    </span>


                </div>


                <!-- FOOD TYPE -->

                <div class="type">


                    <%

                    if (menu.getType() != null &&
                        menu.getType().equalsIgnoreCase("Veg")) {

                    %>


                        <span class="veg">

                            🟢 Veg

                        </span>


                    <%

                    } else {

                    %>


                        <span class="nonveg">

                            🔴 Non-Veg

                        </span>


                    <%

                    }

                    %>


                </div>


                <!-- AVAILABILITY -->

                <div class="availability">


                    <%

                    if (menu.isAvailable()) {

                    %>


                        <span class="available">

                            Available

                        </span>


                    <%

                    } else {

                    %>


                        <span class="notavailable">

                            Out Of Stock

                        </span>


                    <%

                    }

                    %>


                </div>



                <!-- ADD TO CART -->

                <form action="cart"
                      method="post">


                    <input type="hidden"
                           name="menuId"
                           value="<%=menu.getMenuId()%>">


                    <input type="hidden"
                           name="restaurantId"
                           value="<%=restaurant.getRestaurantId()%>">


                    <input type="hidden"
                           name="quantity"
                           value="1">


                    <button class="add-btn"
                            type="submit"
                            <%=menu.isAvailable() ? "" : "disabled"%>>


                        <i class="fa-solid fa-cart-plus"></i>

                        Add To Cart


                    </button>


                </form>


            </div>


        </div>


    <%

        }

    } else {

    %>


        <!-- NO MENU -->

        <div class="no-menu">

            <i class="fa-solid fa-utensils"></i>

            <h2>

                No Menu Items Available

            </h2>

            <p>

                Please check back later.

            </p>

        </div>


    <%

    }

    %>


    </div>


</section>



<!-- =========================================
     FOOTER
========================================= -->

<footer>


    <div class="footer-content">


        <h2>

            Food Express

        </h2>


        <p>

            Good Food • Fast Delivery • Great Experience

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



<script src="js/menu.js"></script>


</body>

</html>
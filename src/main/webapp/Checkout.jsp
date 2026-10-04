<%@page import="com.foodexpress.model.Cart"%>
<%@page import="com.foodexpress.model.CartItem"%>
<%@page import="java.util.Collection"%>
<%@page import="com.foodexpress.model.User"%>

<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
User user = (User) session.getAttribute("user");

if (user == null) {
    response.sendRedirect("Login.jsp");
    return;
}

Cart cart = (Cart) session.getAttribute("cart");

if (cart == null || cart.getItems() == null || cart.getItems().isEmpty()) {
    response.sendRedirect("Cart.jsp");
    return;
}

Collection<CartItem> items = cart.getItems();

double subtotal = cart.getTotalAmount();

double delivery = 40.0;

double gst = subtotal * 0.05;

double total = subtotal + delivery + gst;
%>


<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Food Express | Checkout</title>

<link rel="stylesheet" href="css/checkout.css">

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

        <li>

            <a href="restaurants">

                <i class="fa-solid fa-house"></i>

                Home

            </a>

        </li>


        <li>

            <a href="Cart.jsp">

                <i class="fa-solid fa-cart-shopping"></i>

                Cart

            </a>

        </li>


        <li>

            <a href="Profile.jsp">

                <i class="fa-solid fa-user"></i>

                Profile

            </a>

        </li>

    </ul>

</nav>


<!-- ================= CHECKOUT ================= -->

<div class="checkout-container">


    <h1>

        <i class="fa-solid fa-bag-shopping"></i>

        Checkout

    </h1>


    <form action="checkout" method="post">


        <div class="checkout-content">


            <!-- ================= LEFT SIDE ================= -->

            <div class="delivery-box">


                <!-- DELIVERY ADDRESS -->

                <h2>

                    <i class="fa-solid fa-location-dot"></i>

                    Delivery Address

                </h2>


                <div class="input-group">

                    <label>

                        Delivery Address

                    </label>


                    <textarea

                        name="address"

                        placeholder="Enter your delivery address"

                        required></textarea>

                </div>


                <!-- ================= PAYMENT ================= -->

                <div class="payment-box">


                    <h2>

                        <i class="fa-solid fa-credit-card"></i>

                        Payment Method

                    </h2>


                    <label class="payment-option">

                        <input

                            type="radio"

                            name="paymentMethod"

                            value="Cash On Delivery"

                            checked>

                        <i class="fa-solid fa-money-bill-wave"></i>

                        Cash On Delivery

                    </label>


                    <label class="payment-option">

                        <input

                            type="radio"

                            name="paymentMethod"

                            value="UPI">

                        <i class="fa-solid fa-mobile-screen-button"></i>

                        UPI

                    </label>


                    <label class="payment-option">

                        <input

                            type="radio"

                            name="paymentMethod"

                            value="Credit Card">

                        <i class="fa-solid fa-credit-card"></i>

                        Credit Card

                    </label>


                </div>


            </div>


            <!-- ================= RIGHT SIDE ================= -->

            <div class="summary">


                <h2>

                    Order Summary

                </h2>


                <hr>


                <!-- ORDER ITEMS -->

                <%

                for (CartItem item : items) {

                %>


                <div class="row">


                    <span>

                        <%=item.getName()%>

                        x <%=item.getQuantity()%>

                    </span>


                    <span>

                        ₹ <%=String.format("%.2f",
                            item.getTotalPrice())%>

                    </span>


                </div>


                <%

                }

                %>


                <hr>


                <!-- SUBTOTAL -->

                <div class="row">

                    <span>

                        Subtotal

                    </span>


                    <span>

                        ₹ <%=String.format("%.2f",
                            subtotal)%>

                    </span>

                </div>


                <!-- DELIVERY -->

                <div class="row">

                    <span>

                        Delivery

                    </span>


                    <span>

                        ₹ <%=String.format("%.2f",
                            delivery)%>

                    </span>

                </div>


                <!-- GST -->

                <div class="row">

                    <span>

                        GST (5%)

                    </span>


                    <span>

                        ₹ <%=String.format("%.2f",
                            gst)%>

                    </span>

                </div>


                <hr>


                <!-- GRAND TOTAL -->

                <div class="row total">

                    <span>

                        Grand Total

                    </span>


                    <span>

                        ₹ <%=String.format("%.2f",
                            total)%>

                    </span>

                </div>


                <!-- PLACE ORDER -->

                <button

                    type="submit"

                    class="place-order-btn">

                    <i class="fa-solid fa-check"></i>

                    Place Order

                </button>


            </div>


        </div>


    </form>


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


</body>

</html>
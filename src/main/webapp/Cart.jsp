<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.foodexpress.model.Cart"%>
<%@ page import="com.foodexpress.model.CartItem"%>
<%@ page import="java.util.Collection"%>
<%@ page import="com.foodexpress.model.User" %>

<%
User user = (User) session.getAttribute("user");
%>

<%
Cart cart = (Cart) session.getAttribute("cart");

Collection<CartItem> items = null;

int cartCount = 0;

if (cart != null) {

    items = cart.getItems();

    if (items != null) {

        for (CartItem item : items) {

            cartCount += item.getQuantity();

        }

    }
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Food Express | Cart</title>

<link rel="stylesheet" href="css/cart.css">

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

            <a href="restaurant">

                <i class="fa-solid fa-store"></i>

                Restaurants

            </a>

        </li>


        <li>

            <a href="Cart.jsp">

                <i class="fa-solid fa-cart-shopping"></i>

                Cart

                <span class="cart-count">

                    <%=cartCount%>

                </span>

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


<!-- ================= CART ================= -->

<div class="cart-container">

    <h1>

        <i class="fa-solid fa-cart-shopping"></i>

        My Cart

    </h1>


<%

if(items == null || items.isEmpty()){

%>


<!-- ================= EMPTY CART ================= -->

<div class="empty-cart">

    <i class="fa-solid fa-cart-arrow-down"></i>

    <h2>Your Cart is Empty</h2>

    <p>Add your favourite food items.</p>

    <a href="restaurant">

        <button>

            Browse Restaurants

        </button>

    </a>

</div>


<%

}else{

%>


<div class="cart-content">


    <!-- ================= CART ITEMS ================= -->

    <div class="cart-items">


<%

for(CartItem item : items){

%>


        <div class="cart-item">


            <img src="<%=item.getImageUrl()%>">


            <div class="item-details">


                <h2>

                    <%=item.getName()%>

                </h2>


                <p>

                    ₹ <%=item.getPrice()%>

                </p>


                <!-- ================= QUANTITY ================= -->

                <div class="quantity-box">

                    <form action="updateCart" method="post">

                        <input type="hidden"

                               name="menuId"

                               value="<%=item.getMenuId()%>">


                        <button name="action"

                                value="decrease">

                            -

                        </button>


                        <span>

                            <%=item.getQuantity()%>

                        </span>


                        <button name="action"

                                value="increase">

                            +

                        </button>

                    </form>

                </div>


                <!-- ================= ITEM TOTAL ================= -->

                <h3>

                    Total :

                    ₹ <%=item.getTotalPrice()%>

                </h3>


                <!-- ================= REMOVE ================= -->

                <form action="removeCart"

                      method="post">

                    <input type="hidden"

                           name="menuId"

                           value="<%=item.getMenuId()%>">


                    <button class="remove-btn">

                        <i class="fa-solid fa-trash"></i>

                        Remove

                    </button>

                </form>


            </div>

        </div>


<%

}

%>


        <!-- ================= ADD MORE ITEMS ================= -->

        <div class="add-more-container">

           <a href="menu?restaurantId=<%=cart.getRestaurantId()%>"
   class="add-more-btn">

    <i class="fa-solid fa-plus"></i>
    Add More Items

</a>

        </div>


    </div>


    <!-- ================= PRICE DETAILS ================= -->

    <div class="summary">


        <h2>

            Price Details

        </h2>


        <hr>


        <div class="row">

            <span>Subtotal</span>

            <span>

                ₹ <%=cart.getTotalAmount()%>

            </span>

        </div>


        <div class="row">

            <span>Delivery</span>

            <span>

                ₹ 40

            </span>

        </div>


        <div class="row">

            <span>GST</span>

            <span>

                ₹ <%=String.format("%.2f",

                cart.getTotalAmount() * 0.05)%>

            </span>

        </div>


        <hr>


        <div class="row total">

            <span>Total</span>

            <span>

                ₹ <%=String.format("%.2f",

                cart.getTotalAmount()

                + 40

                + (cart.getTotalAmount() * 0.05))%>

            </span>

        </div>


        <a href="Checkout.jsp">

            <button class="checkout-btn">

                Proceed To Checkout

            </button>

        </a>


    </div>


</div>


<%

}

%>


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


<script src="js/cart.js"></script>

</body>

</html>
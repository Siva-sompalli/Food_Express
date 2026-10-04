<%@page import="com.foodexpress.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
User admin=(User)session.getAttribute("user");

if(admin==null){
    response.sendRedirect("Login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Analytics Dashboard</title>

<link rel="stylesheet" href="css/admin.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

</head>

<body>

<%
request.setAttribute("activePage", "analytics");
%>

<div class="sidebar">

    <jsp:include page="/WEB-INF/admin/sidebar.jsp"/>

</div>

<div class="main">

    <jsp:include page="/WEB-INF/admin/header.jsp"/>

    <!-- Heading -->

    <div class="page-title">

        <div>

            <h1>Analytics Dashboard</h1>

            <p>Business Overview & Reports</p>

        </div>

    </div>

    <!-- Statistics -->

    <div class="cards">

        <div class="card">

            <div class="icon orange">

                <i class="fa-solid fa-indian-rupee-sign"></i>

            </div>

            <div>

                <h4>Total Revenue</h4>

                <h2>₹ ${totalRevenue}</h2>

            </div>

        </div>

        <div class="card">

            <div class="icon blue">

                <i class="fa-solid fa-store"></i>

            </div>

            <div>

                <h4>Restaurants</h4>

                <h2>${restaurantCount}</h2>

            </div>

        </div>

        <div class="card">

            <div class="icon green">

                <i class="fa-solid fa-bowl-food"></i>

            </div>

            <div>

                <h4>Food Items</h4>

                <h2>${menuCount}</h2>

            </div>

        </div>

        <div class="card">

            <div class="icon purple">

                <i class="fa-solid fa-cart-shopping"></i>

            </div>

            <div>

                <h4>Total Orders</h4>

                <h2>${orderCount}</h2>

            </div>

        </div>

    </div>

    <!-- Second Row -->

    <div class="cards">

        <div class="card">

            <div class="icon green">

                <i class="fa-solid fa-users"></i>

            </div>

            <div>

                <h4>Total Customers</h4>

                <h2>${customerCount}</h2>

            </div>

        </div>

    </div>

    <!-- Order Status -->

<div class="actions">

    <h2>Order Status Summary</h2>

    <table class="status-table">

        <thead>
            <tr>
                <th>Status</th>
                <th>Total</th>
            </tr>
        </thead>

        <tbody>

            <tr>
                <td><span class="order-status pending">Pending</span></td>
                <td>${pending}</td>
            </tr>

            <tr>
                <td><span class="order-status preparing">Preparing</span></td>
                <td>${preparing}</td>
            </tr>

            <tr>
                <td><span class="order-status delivery">Out for Delivery</span></td>
                <td>${delivery}</td>
            </tr>

            <tr>
                <td><span class="order-status delivered">Delivered</span></td>
                <td>${delivered}</td>
            </tr>

            <tr>
                <td><span class="order-status cancelled">Cancelled</span></td>
                <td>${cancelled}</td>
            </tr>

        </tbody>

    </table>

</div>

</div>

</body>

</html>
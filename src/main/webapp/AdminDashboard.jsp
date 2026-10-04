<%@page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Admin Dashboard</title>

<link rel="stylesheet" href="css/admin.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

</head>

<body>

<%
request.setAttribute("activePage", "dashboard");
%>


<div class="sidebar">
<%
request.setAttribute("hideSearch", true);
%>

    <jsp:include page="/WEB-INF/admin/sidebar.jsp"/>

</div>

<div class="main">

    <jsp:include page="/WEB-INF/admin/header.jsp"/>

    <!-- Welcome -->

    <div class="welcome">

        <h1>
            Welcome Back,
            <%=((com.foodexpress.model.User)session.getAttribute("user")).getUsername()%>
        </h1>

        <p>
            Manage restaurants, menus, orders and customers from one place.
        </p>

    </div>

    <!-- Dashboard Cards -->

    <div class="cards">

        <div class="card">

            <div class="icon orange">

                <i class="fa-solid fa-store"></i>

            </div>

            <div>

                <h4>Total Restaurants</h4>

                <h2>${restaurantCount}</h2>

            </div>

        </div>

        <div class="card">

            <div class="icon blue">

                <i class="fa-solid fa-bowl-food"></i>

            </div>

            <div>

                <h4>Total Foods</h4>

                <h2>${menuCount}</h2>

            </div>

        </div>

        <div class="card">

            <div class="icon green">

                <i class="fa-solid fa-users"></i>

            </div>

            <div>

                <h4>Total Customers</h4>

                <h2>${customerCount}</h2>

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

    <!-- Quick Actions -->

    <div class="actions">

        <h2>Quick Actions</h2>

        <div class="action-buttons">

            <a href="AddRestaurant.jsp">

                <i class="fa-solid fa-plus"></i>

                Add Restaurant

            </a>

            <a href="addMenu">

                <i class="fa-solid fa-utensils"></i>

                Add Food

            </a>

            <a href="orders">

                <i class="fa-solid fa-eye"></i>

                View Orders

            </a>

            <a href="customers">

                <i class="fa-solid fa-users"></i>

                Customers

            </a>

        </div>

    </div>

</div>

</body>

</html>
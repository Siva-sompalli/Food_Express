<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String activePage = (String) request.getAttribute("activePage");
%>
<div class="sidebar">

    <div class="sidebar-top">

        <div class="logo">
            <i class="fa-solid fa-utensils"></i>
            <h2>Food Express</h2>
        </div>

        <ul>

            <li class="<%= "dashboard".equals(activePage) ? "active" : "" %>">
                <a href="dashboard">
                    <i class="fa-solid fa-house"></i>
                    <span>Dashboard</span>
                </a>
            </li>

            <li class="<%= "restaurants".equals(activePage) ? "active" : "" %>">
                <a href="restaurants">
                    <i class="fa-solid fa-store"></i>
                    <span>Restaurants</span>
                </a>
            </li>

            <li class="<%= "orders".equals(activePage) ? "active" : "" %>">
                <a href="orders">
                    <i class="fa-solid fa-cart-shopping"></i>
                    <span>Orders</span>
                </a>
            </li>

           <li class="<%= "customers".equals(activePage) ? "active" : "" %>">
                <a href="customers">
                    <i class="fa-solid fa-users"></i>
                    <span>Customers</span>
                </a>
            </li>

            <li class="<%= "analytics".equals(activePage) ? "active" : "" %>">
                <a href="analytics">
                    <i class="fa-solid fa-chart-line"></i>
                    <span>Analytics</span>
                </a>
            </li>

        </ul>

    </div>

    <div class="logout">
        <a href="logout">
            <i class="fa-solid fa-right-from-bracket"></i>
            <span>Logout</span>
        </a>
    </div>

</div>
<%@page import="java.util.List"%>
<%@page import="com.foodexpress.model.Orders"%>
<%@page import="com.foodexpress.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
User user = (User)session.getAttribute("user");

if(user==null){
    response.sendRedirect("Login.jsp");
    return;
}

List<Orders> orders = (List<Orders>)request.getAttribute("orders");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Order Management</title>

<link rel="stylesheet" href="css/admin.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

</head>

<body>

<%
request.setAttribute("activePage", "orders");
%>

<div class="sidebar">

    <jsp:include page="/WEB-INF/admin/sidebar.jsp"/>

</div>

<div class="main">

    <jsp:include page="/WEB-INF/admin/header.jsp"/>

    <!-- Search -->

    <div class="topbar">

        <form action="orders" method="get" class="search">

            <input type="text"
                   name="keyword"
                   placeholder="Search Order ID, User ID, Payment..."
                   value="<%= request.getParameter("keyword")==null ? "" : request.getParameter("keyword") %>">

            <button type="submit" class="search-btn">

                <i class="fa-solid fa-magnifying-glass"></i>

            </button>

        </form>

    </div>

    <!-- Page Title -->

    <div class="page-title">

        <div>

            <h1>Order Management</h1>

            <p>View and Manage Customer Orders</p>

        </div>

    </div>

    <!-- Orders Table -->

    <div class="table-card">

        <table>

            <thead>

            <tr>

                <th>Order ID</th>
                <th>User ID</th>
                <th>Restaurant ID</th>
                <th>Amount</th>
                <th>Payment</th>
                <th>Status</th>
                <th>Order Date</th>
                <th>Actions</th>

            </tr>

            </thead>

            <tbody>

            <%
            if(orders!=null && !orders.isEmpty()){

                for(Orders order : orders){
            %>

            <tr>

                <td>#<%=order.getOrderId()%></td>
                <td><%=order.getUserId()%></td>
                <td><%=order.getRestaurantId()%></td>
                <td>₹ <%=order.getTotalAmount()%></td>
                <td><%=order.getPaymentMethod()%></td>

                <td>

                    <%
                    String status = order.getStatus();

                    if(status.equalsIgnoreCase("Pending")){
                    %>

                    <span class="order-status pending">Pending</span>

                    <%
                    }else if(status.equalsIgnoreCase("Preparing")){
                    %>

                    <span class="order-status preparing">Preparing</span>

                    <%
                    }else if(status.equalsIgnoreCase("Out for Delivery")){
                    %>

                    <span class="order-status delivery">Out for Delivery</span>

                    <%
                    }else if(status.equalsIgnoreCase("Delivered")){
                    %>

                    <span class="order-status delivered">Delivered</span>

                    <%
                    }else{
                    %>

                    <span class="order-status cancelled">Cancelled</span>

                    <%
                    }
                    %>

                </td>

                <td><%=order.getOrderDate()%></td>

                <td>

                    <a href="editOrder?orderId=<%=order.getOrderId()%>" class="edit-btn">
                        <i class="fa-solid fa-pen"></i>
                    </a>

                    <a href="deleteOrder?orderId=<%=order.getOrderId()%>"
                       class="delete-btn"
                       onclick="return confirm('Delete this order?')">

                        <i class="fa-solid fa-trash"></i>

                    </a>

                </td>

            </tr>

            <%
                }

            }else{
            %>

            <tr>

                <td colspan="8" class="no-data">
                    No Orders Found
                </td>

            </tr>

            <%
            }
            %>

            </tbody>

        </table>

    </div>

</div>

</body>

</html>
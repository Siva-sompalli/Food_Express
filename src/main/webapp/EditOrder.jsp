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

Orders order=(Orders)request.getAttribute("order");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Edit Order</title>

<link rel="stylesheet" href="css/admin.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

</head>

<body>

<div class="sidebar">

    <jsp:include page="/WEB-INF/admin/sidebar.jsp"/>

</div>

<div class="main">

    <jsp:include page="/WEB-INF/admin/header.jsp"/>

    <!-- Title -->

    <div class="title-row">

        <h1>Edit Order</h1>

        <a href="orders" class="back-btn">

            <i class="fa-solid fa-arrow-left"></i>

            Back

        </a>

    </div>

    <!-- Form -->

    <div class="form-card">

        <form action="updateOrder" method="post"
              class="restaurant-form">

            <input type="hidden"
                   name="orderId"
                   value="<%=order.getOrderId()%>">

            <div class="form-grid">

                <div class="input-group">

                    <label>Order ID</label>

                    <input type="text"
                           value="<%=order.getOrderId()%>"
                           readonly>

                </div>

                <div class="input-group">

                    <label>User ID</label>

                    <input type="text"
                           name="userId"
                           value="<%=order.getUserId()%>"
                           readonly>

                </div>

                <div class="input-group">

                    <label>Restaurant ID</label>

                    <input type="text"
                           name="restaurantId"
                           value="<%=order.getRestaurantId()%>"
                           readonly>

                </div>

                <div class="input-group">

                    <label>Total Amount</label>

                    <input type="text"
                           name="totalAmount"
                           value="<%=order.getTotalAmount()%>"
                           readonly>

                </div>

                <div class="input-group full-width">

                    <label>Delivery Address</label>

                    <textarea name="address" readonly><%=order.getAddress()%></textarea>

                </div>

                <div class="input-group">

                    <label>Payment Method</label>

                    <input type="text"
                           name="paymentMethod"
                           value="<%=order.getPaymentMethod()%>"
                           readonly>

                </div>

                <div class="input-group">

                    <label>Order Status</label>

                    <select name="status">

                        <option value="Pending"
                        <%="Pending".equals(order.getStatus())?"selected":""%>>
                        Pending
                        </option>

                        <option value="Preparing"
                        <%="Preparing".equals(order.getStatus())?"selected":""%>>
                        Preparing
                        </option>

                        <option value="Out for Delivery"
                        <%="Out for Delivery".equals(order.getStatus())?"selected":""%>>
                        Out for Delivery
                        </option>

                        <option value="Delivered"
                        <%="Delivered".equals(order.getStatus())?"selected":""%>>
                        Delivered
                        </option>

                        <option value="Cancelled"
                        <%="Cancelled".equals(order.getStatus())?"selected":""%>>
                        Cancelled
                        </option>

                    </select>

                </div>

            </div>

            <br>

            <button type="submit" class="save-btn">

                <i class="fa-solid fa-floppy-disk"></i>

                Update Order

            </button>

        </form>

    </div>

</div>

</body>
</html>
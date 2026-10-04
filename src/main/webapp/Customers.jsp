<%@page import="java.util.List"%>
<%@page import="com.foodexpress.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
User admin=(User)session.getAttribute("user");

if(admin==null){
    response.sendRedirect("Login.jsp");
    return;
}

List<User> customers=(List<User>)request.getAttribute("customers");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Customer Management</title>

<link rel="stylesheet" href="css/admin.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

</head>

<body>
<%
request.setAttribute("activePage", "customers");
%>

<div class="sidebar">

    <jsp:include page="/WEB-INF/admin/sidebar.jsp"/>

</div>

<div class="main">

    <jsp:include page="/WEB-INF/admin/header.jsp"/>
    
    <div class="topbar">

    <form action="customers" method="get" class="search">

        <input type="text"
               name="keyword"
               placeholder="Search Customer..."
               value="<%= request.getParameter("keyword")==null ? "" : request.getParameter("keyword") %>">

        <button type="submit" class="search-btn">

            <i class="fa-solid fa-magnifying-glass"></i>

        </button>

    </form>

</div>

    <!-- Page Title -->

    <div class="page-title">

        <div>

            <h1>Customer Management</h1>

            <p>View and Manage Registered Customers</p>

        </div>

    </div>

    <!-- Customer Table -->

    <div class="table-card">

        <table>

            <thead>

            <tr>

                <th>User ID</th>

                <th>Name</th>

                <th>Email</th>

                <th>Phone</th>

                <th>Address</th>

                <th>Role</th>

                <th>Actions</th>

            </tr>

            </thead>

            <tbody>

            <%

            if(customers!=null && !customers.isEmpty()){

                for(User customer : customers){

            %>

            <tr>

                <td>#<%=customer.getUserId()%></td>

                <td>

                    <strong><%=customer.getUsername()%></strong>

                </td>

                <td><%=customer.getEmail()%></td>

                <td><%=customer.getPhoneNumber()%></td>

                <td><%=customer.getAddress()%></td>

                <td>

                    <span class="status active">

                        <%=customer.getRole()%>

                    </span>

                </td>

                <td>

                    <a href="customerOrders?userId=<%=customer.getUserId()%>"
                       class="menu-btn">

                        <i class="fa-solid fa-eye"></i>

                        Orders

                    </a>

                    <a href="deleteCustomer?userId=<%=customer.getUserId()%>"
                       class="delete-btn"
                       onclick="return confirm('Delete this customer?')">

                        <i class="fa-solid fa-trash"></i>

                    </a>

                </td>

            </tr>

            <%

                }

            }else{

            %>

            <tr>

                <td colspan="7" class="no-data">

                    No Customers Found

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
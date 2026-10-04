<%@page import="java.util.List"%>
<%@page import="com.foodexpress.model.Menu"%>
<%@page import="com.foodexpress.model.Restaurant"%>
<%@page import="com.foodexpress.model.User"%>

<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
User user = (User) session.getAttribute("user");

if(user == null){
    response.sendRedirect("Login.jsp");
    return;
}

List<Menu> menus =
        (List<Menu>) request.getAttribute("menus");

Restaurant restaurant =
        (Restaurant) request.getAttribute("restaurant");

request.setAttribute("activePage", "restaurants");

if(restaurant == null){
    response.sendRedirect("restaurants");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Menu Management - Food Express</title>

    <!-- Font Awesome -->

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <!-- Admin CSS -->

    <link rel="stylesheet"
          href="css/admin.css">

    <style>

        .restaurant-heading{
            display:flex;
            align-items:center;
            gap:10px;
        }

        .restaurant-heading i{
            color:#f47b20;
        }

        .menu-description{
            max-width:250px;
            color:#666;
        }

        .food-img{
            width:70px;
            height:60px;
            object-fit:cover;
            border-radius:8px;
        }

        .menu-btn{
            display:inline-flex;
            align-items:center;
            gap:7px;
            padding:9px 15px;
            background:#f47b20;
            color:white;
            text-decoration:none;
            border-radius:7px;
            font-size:14px;
            font-weight:600;
        }

        .menu-btn:hover{
            background:#df6810;
        }

        .edit-btn,
        .delete-btn{
            text-decoration:none;
            margin-right:8px;
        }

        .status{
            display:inline-block;
            padding:6px 12px;
            border-radius:20px;
            font-size:13px;
            font-weight:600;
        }

        .status.active{
            background:#dcfce7;
            color:#15803d;
        }

        .status.inactive{
            background:#fee2e2;
            color:#dc2626;
        }

        .no-data{
            text-align:center;
            padding:30px;
            color:#777;
        }

    </style>

</head>


<body>


<!-- ================= SIDEBAR ================= -->

<jsp:include page="/WEB-INF/admin/sidebar.jsp"/>


<!-- ================= MAIN ================= -->

<main class="main">


    <!-- ================= HEADER ================= -->

    <jsp:include page="/WEB-INF/admin/header.jsp"/>


    <!-- ================= PAGE TITLE ================= -->

    <!-- ================= PAGE TITLE ================= -->

<div class="page-title">

    <div>

        <div class="restaurant-heading">

            <i class="fa-solid fa-utensils"></i>

            <h1>Menu Management</h1>

        </div>

        <p>
            Manage food items for
            <strong><%=restaurant.getName()%></strong>
        </p>

    </div>


    <!-- ================= PAGE ACTIONS ================= -->

    <div style="display:flex; gap:12px; align-items:center;">

        <!-- BACK BUTTON -->

        <a href="restaurants" class="back-btn">

            <i class="fa-solid fa-arrow-left"></i>

            Back

        </a>


        <!-- ADD MENU BUTTON -->

        <a href="addMenu?restaurantId=<%=restaurant.getRestaurantId()%>"
           class="btn">

            <i class="fa-solid fa-plus"></i>

            Add Menu

        </a>

    </div>

</div>


    <!-- ================= RESTAURANT INFO ================= -->

    <div class="table-card"
         style="margin-bottom:25px; padding:20px;">

        <div style="display:flex;
                    justify-content:space-between;
                    align-items:center;
                    flex-wrap:wrap;
                    gap:15px;">

            <div>

                <h2 style="margin:0 0 5px 0;">

                    <%=restaurant.getName()%>

                </h2>

                <p style="margin:0; color:#777;">

                    <%=restaurant.getCuisineType()%>

                    &nbsp; • &nbsp;

                    ⭐ <%=restaurant.getRating()%>

                    &nbsp; • &nbsp;

                    <%=restaurant.getEta()%> mins

                </p>

            </div>

            <div>

                <span class="status
                    <%=restaurant.isAvailable()
                        ? "active"
                        : "inactive"%>">

                    <%=restaurant.isAvailable()
                        ? "Active"
                        : "Inactive"%>

                </span>

            </div>

        </div>

    </div>


    <!-- ================= MENU TABLE ================= -->

    <div class="table-card">

        <table>

            <thead>

                <tr>

                    <th>Image</th>

                    <th>Name</th>

                    <th>Description</th>

                    <th>Price</th>

                    <th>Rating</th>

                    <th>Category</th>

                    <th>Status</th>

                    <th>Actions</th>

                </tr>

            </thead>


            <tbody>


            <%

            if(menus != null && !menus.isEmpty()){

                for(Menu menu : menus){

            %>


            <tr>


                <!-- ================= IMAGE ================= -->

                <td>

                    <img src="<%=menu.getImageUrl()%>"
                         alt="<%=menu.getName()%>"
                         class="food-img">

                </td>


                <!-- ================= NAME ================= -->

                <td>

                    <strong>

                        <%=menu.getName()%>

                    </strong>

                </td>


                <!-- ================= DESCRIPTION ================= -->

                <td>

                    <div class="menu-description">

                        <%=menu.getDescription()%>

                    </div>

                </td>


                <!-- ================= PRICE ================= -->

                <td>

                    ₹ <%=menu.getPrice()%>

                </td>


                <!-- ================= RATING ================= -->

                <td>

                    ⭐ <%=menu.getRating()%>

                </td>


                <!-- ================= TYPE ================= -->

                <td>

                    <%=menu.getType()%>

                </td>


                <!-- ================= STATUS ================= -->

                <td>

                    <%

                    if(menu.isAvailable()){

                    %>

                        <span class="status active">

                            Available

                        </span>

                    <%

                    }else{

                    %>

                        <span class="status inactive">

                            Unavailable

                        </span>

                    <%

                    }

                    %>

                </td>


                <!-- ================= ACTIONS ================= -->

                <td>


                    <!-- EDIT -->

                    <a href="editMenu?menuId=<%=menu.getMenuId()%>"
                       class="edit-btn"
                       title="Edit Menu">

                        <i class="fa-solid fa-pen"></i>

                    </a>


                    <!-- DELETE -->

                    <a href="deleteMenu?menuId=<%=menu.getMenuId()%>"
                       class="delete-btn"
                       title="Delete Menu"

                       onclick="return confirm(
                           'Are you sure you want to delete this food item?'
                       );">

                        <i class="fa-solid fa-trash"></i>

                    </a>


                </td>


            </tr>


            <%

                }

            }else{

            %>


            <!-- ================= NO MENU ================= -->

            <tr>

                <td colspan="8"
                    class="no-data">

                    <i class="fa-solid fa-utensils"
                       style="font-size:30px;
                              margin-bottom:10px;
                              display:block;">
                    </i>

                    No Food Items Found

                </td>

            </tr>


            <%

            }

            %>


            </tbody>

        </table>

    </div>


</main>


</body>

</html>
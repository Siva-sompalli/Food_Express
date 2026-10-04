<%@page import="com.foodexpress.model.Restaurant"%>
<%@page import="com.foodexpress.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
User user = (User) session.getAttribute("user");

if(user == null){
    response.sendRedirect("Login.jsp");
    return;
}

Restaurant restaurant =
        (Restaurant) request.getAttribute("restaurant");

if(restaurant == null){
    response.sendRedirect("restaurants");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Food Express | Edit Restaurant</title>

<link rel="stylesheet" href="css/admin.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

<style>

/* =========================================
   REMOVE SEARCH BAR
========================================= */

.topbar {
    display: flex !important;
    justify-content: flex-end !important;
    align-items: center !important;
    margin-bottom: 30px;
}

.topbar .profile {
    margin-left: auto;
}


/* =========================================
   FORM CARD
========================================= */

.form-card {
    background: #FFFFFF;
    border-radius: 20px;
    padding: 40px;
    box-shadow: 0 10px 30px rgba(33, 26, 46, 0.08);
    border: 1px solid #E9E2F5;
}


/* =========================================
   TITLE ROW
========================================= */

.title-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 35px;
}

.title-row h1 {
    margin: 0;
    color: #211A2E;
    font-size: 36px;
    font-weight: 700;
}


/* =========================================
   BACK BUTTON
========================================= */

.back-btn {
    display: inline-flex;
    align-items: center;
    gap: 8px;

    background: #8B5CF6;
    color: #FFFFFF;

    padding: 14px 24px;

    border-radius: 11px;

    text-decoration: none;

    font-size: 16px;
    font-weight: 600;

    transition: 0.3s;
}

.back-btn:hover {
    background: #7C3AED;
    transform: translateY(-2px);
    box-shadow: 0 8px 18px rgba(139, 92, 246, 0.25);
}


/* =========================================
   FORM GRID
========================================= */

.form-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 28px 25px;
}


/* =========================================
   INPUT GROUP
========================================= */

.input-group {
    display: flex;
    flex-direction: column;
}

.input-group.full-width {
    grid-column: 1 / -1;
}

.input-group label {
    color: #211A2E;
    font-size: 16px;
    font-weight: 600;
    margin-bottom: 10px;
}


/* =========================================
   INPUTS
========================================= */

.input-group input,
.input-group textarea,
.input-group select {

    width: 100%;

    padding: 15px 16px;

    border: 1px solid #E3DCEA;

    border-radius: 10px;

    background: #FFF9F2;

    color: #211A2E;

    font-family: 'Poppins', sans-serif;

    font-size: 15px;

    outline: none;

    transition: 0.3s;

    box-sizing: border-box;
}

.input-group input:focus,
.input-group textarea:focus,
.input-group select:focus {

    border-color: #8B5CF6;

    box-shadow:
        0 0 0 3px rgba(139, 92, 246, 0.12);
}

.input-group textarea {
    resize: none;
}


/* =========================================
   UPDATE BUTTON
========================================= */

.save-btn {

    margin-top: 30px;

    padding: 15px 28px;

    background: #FF5A36;

    color: #FFFFFF;

    border: none;

    border-radius: 10px;

    font-size: 16px;

    font-weight: 600;

    cursor: pointer;

    transition: 0.3s;
}

.save-btn:hover {

    background: #E94A27;

    transform: translateY(-2px);

    box-shadow:
        0 8px 18px rgba(255, 90, 54, 0.25);
}


/* =========================================
   RESPONSIVE
========================================= */

@media(max-width: 900px) {

    .main {
        padding: 20px;
    }

    .form-grid {
        grid-template-columns: 1fr;
    }

    .input-group.full-width {
        grid-column: auto;
    }

    .title-row {
        flex-direction: column;
        align-items: flex-start;
        gap: 20px;
    }

    .title-row h1 {
        font-size: 30px;
    }

    .form-card {
        padding: 25px;
    }
}

</style>

</head>


<body>

<%
request.setAttribute("activePage", "restaurants");
%>

<div class="container">


<!-- =========================================
     SIDEBAR
========================================= -->

<div class="sidebar">

    <jsp:include page="/WEB-INF/admin/sidebar.jsp"/>

</div>



<!-- =========================================
     MAIN CONTENT
========================================= -->

<main class="main">

<jsp:include page="/WEB-INF/admin/header.jsp"/>



    <!-- =========================================
         EDIT RESTAURANT CARD
    ========================================= -->

    <div class="form-card">


        <!-- TITLE -->

        <div class="title-row">


            <h1>
                Edit Restaurant
            </h1>


            <!-- BACK -->

            <a href="restaurants"
               class="back-btn">

                <i class="fa-solid fa-arrow-left"></i>

                Back

            </a>


        </div>



        <!-- =====================================
             FORM
        ====================================== -->

        <form action="updateRestaurant"
              method="post"
              class="restaurant-form">


            <!-- HIDDEN RESTAURANT ID -->

            <input type="hidden"
                   name="restaurantId"
                   value="<%=restaurant.getRestaurantId()%>">


            <!-- HIDDEN ADMIN ID -->

            <input type="hidden"
                   name="adminId"
                   value="<%=restaurant.getAdminId()%>">



            <div class="form-grid">


                <!-- RESTAURANT NAME -->

                <div class="input-group">

                    <label>
                        Restaurant Name
                    </label>

                    <input type="text"
                           name="name"
                           value="<%=restaurant.getName()%>"
                           required>

                </div>



                <!-- CUISINE -->

                <div class="input-group">

                    <label>
                        Cuisine Type
                    </label>

                    <input type="text"
                           name="cuisineType"
                           value="<%=restaurant.getCuisineType()%>"
                           required>

                </div>



                <!-- DELIVERY TIME -->

                <div class="input-group">

                    <label>
                        Delivery Time
                    </label>

                    <input type="number"
                           name="eta"
                           value="<%=restaurant.getEta()%>"
                           required>

                </div>



                <!-- RATING -->

                <div class="input-group">

                    <label>
                        Rating
                    </label>

                    <input type="number"
                           step="0.1"
                           min="0"
                           max="5"
                           name="rating"
                           value="<%=restaurant.getRating()%>"
                           required>

                </div>



                <!-- ADDRESS -->

                <div class="input-group full-width">

                    <label>
                        Address
                    </label>

                    <textarea
                        name="address"
                        rows="4"
                        required><%=restaurant.getAddress()%></textarea>

                </div>



                <!-- IMAGE URL -->

                <div class="input-group full-width">

                    <label>
                        Image URL
                    </label>

                    <input type="text"
                           name="imageUrl"
                           value="<%=restaurant.getImageUrl()%>"
                           required>

                </div>



                <!-- STATUS -->

                <div class="input-group">

                    <label>
                        Status
                    </label>

                    <select name="isAvailable">


                        <option value="true"
                            <%=restaurant.isAvailable()
                                ? "selected"
                                : ""%>>

                            Available

                        </option>


                        <option value="false"
                            <%=!restaurant.isAvailable()
                                ? "selected"
                                : ""%>>

                            Not Available

                        </option>


                    </select>

                </div>


            </div>



            <!-- =================================
                 UPDATE BUTTON
            ================================== -->

            <button type="submit"
                    class="save-btn">

                <i class="fa-solid fa-pen-to-square"></i>

                Update Restaurant

            </button>


        </form>


    </div>


</main>


</div>


<script src="js/admin.js"></script>


</body>

</html>
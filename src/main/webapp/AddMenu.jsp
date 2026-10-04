<%@ page import="java.util.List" %>
<%@ page import="com.foodexpress.model.Restaurant" %>
<%@ page import="com.foodexpress.model.User" %>

<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    User user = (User) session.getAttribute("user");

    if(user == null){
        response.sendRedirect("Login.jsp");
        return;
    }

    List<Restaurant> restaurants =
            (List<Restaurant>) request.getAttribute("restaurants");

    Restaurant selectedRestaurant =
            (Restaurant) request.getAttribute("selectedRestaurant");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Add Food - Food Express</title>

    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <!-- Admin CSS -->
    <link rel="stylesheet" href="css/admin.css">

    <style>

        /* =========================================
           PAGE CONTENT
        ========================================= */

        .page-content {
            padding: 35px;
        }


        /* =========================================
           PAGE TITLE
        ========================================= */

        .page-title {
            display: flex;
            justify-content: space-between;
            align-items: center;

            margin-bottom: 30px;
        }

        .title-content h1 {
            font-size: 36px;
            margin: 0 0 5px 0;
            color: #211A2E;
        }

        .title-content p {
            margin: 0;
            color: #6B7280;
            font-size: 16px;
        }


        /* =========================================
           BACK BUTTON
        ========================================= */

        .back-btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;

            padding: 14px 24px;

            background: #8B5CF6;
            color: #FFFFFF;

            text-decoration: none;

            border-radius: 10px;

            font-size: 16px;
            font-weight: 600;

            transition: 0.3s;
        }

        .back-btn:hover {
            background: #7C3AED;

            transform: translateY(-2px);

            box-shadow:
                0 8px 18px rgba(139, 92, 246, 0.30);
        }


        /* =========================================
           FORM CARD
        ========================================= */

        .form-card {
            width: 850px;
            max-width: 90%;

            margin: auto;

            background: #FFFFFF;

            padding: 40px;

            border-radius: 15px;

            box-shadow:
                0 8px 25px rgba(0, 0, 0, 0.08);
        }


        /* =========================================
           FORM ROW
        ========================================= */

        .form-row {
            display: grid;

            grid-template-columns: 1fr 1fr;

            gap: 20px;

            margin-bottom: 20px;
        }


        /* =========================================
           FORM GROUP
        ========================================= */

        .form-group {
            display: flex;

            flex-direction: column;
        }

        .form-group.full {
            grid-column: 1 / -1;
        }

        .form-group label {
            font-weight: 600;

            margin-bottom: 8px;
        }


        /* =========================================
           INPUTS
        ========================================= */

        .form-group input,
        .form-group select,
        .form-group textarea {

            padding: 14px;

            border: 1px solid #DDD;

            border-radius: 8px;

            font-size: 15px;

            outline: none;

            font-family: inherit;

            transition: 0.3s;
        }

        .form-group input:focus,
        .form-group select:focus,
        .form-group textarea:focus {

            border-color: #8B5CF6;

            box-shadow:
                0 0 0 3px rgba(139, 92, 246, 0.10);
        }


        /* =========================================
           TEXTAREA
        ========================================= */

        .form-group textarea {

            height: 100px;

            resize: none;
        }


        /* =========================================
           CHECKBOX
        ========================================= */

        .checkbox-group {

            display: flex;

            align-items: center;

            gap: 10px;

            margin: 20px 0;
        }

        .checkbox-group input {

            width: 18px;

            height: 18px;

            accent-color: #8B5CF6;
        }


        /* =========================================
           BUTTONS
        ========================================= */

        .buttons {

            display: flex;

            gap: 15px;

            margin-top: 20px;
        }


        /* ADD FOOD */

        .add-btn {

            background: #FF5A36;

            color: #FFFFFF;

            border: none;

            padding: 14px 25px;

            border-radius: 8px;

            font-size: 16px;

            font-weight: 600;

            cursor: pointer;

            transition: 0.3s;
        }

        .add-btn:hover {

            background: #E94A27;

            transform: translateY(-2px);

            box-shadow:
                0 8px 18px rgba(255, 90, 54, 0.25);
        }


        /* CANCEL */

        .cancel-btn {

            background: #6B7280;

            color: #FFFFFF;

            padding: 14px 25px;

            border-radius: 8px;

            text-decoration: none;

            font-size: 16px;

            display: inline-flex;

            align-items: center;

            gap: 8px;
        }


        /* SELECTED RESTAURANT */

        .selected-restaurant {

            background: #FFF9F2;

            border: 1px solid #FF5A36;

            color: #211A2E;

            padding: 14px;

            border-radius: 8px;

            font-weight: 600;
        }


        /* =========================================
           RESPONSIVE
        ========================================= */

        @media(max-width: 800px) {

            .form-row {

                grid-template-columns: 1fr;
            }

            .form-card {

                width: auto;

                max-width: 100%;
            }

            .page-title {

                flex-direction: column;

                align-items: flex-start;

                gap: 15px;
            }

        }

    </style>

</head>


<body>

<%
    request.setAttribute("activePage", "restaurants");
%>


<!-- ================= SIDEBAR ================= -->

<jsp:include page="/WEB-INF/admin/sidebar.jsp"/>


<!-- ================= MAIN ================= -->

<main class="main">


    <!-- ================= HEADER ================= -->

    <jsp:include page="/WEB-INF/admin/header.jsp"/>


    <!-- ================= PAGE CONTENT ================= -->

    <div class="page-content">


        <!-- ================= PAGE TITLE ================= -->

        <div class="page-title">

            <div class="title-content">

                <h1>Add Food</h1>

                <p>Add a new food item to a restaurant</p>

            </div>


            <!-- BACK TO RESTAURANTS -->

<%
if(selectedRestaurant != null){
%>

<a href="menuList?restaurantId=<%=selectedRestaurant.getRestaurantId()%>"
   class="back-btn">

    <i class="fa-solid fa-arrow-left"></i>
    Back

</a>

<%
}else{
%>

<a href="dashboard" class="back-btn">

    <i class="fa-solid fa-arrow-left"></i>
    Back

</a>

<%
}
%>

        </div>


        <!-- ================= FORM CARD ================= -->

        <div class="form-card">


            <form action="addMenu" method="post">


                <!-- ================= RESTAURANT + FOOD NAME ================= -->

                <div class="form-row">


                    <!-- RESTAURANT -->

                    <div class="form-group">

                        <label>
                            Restaurant
                        </label>


                        <%
                        if(selectedRestaurant != null){
                        %>

                            <div class="selected-restaurant">

                                <i class="fa-solid fa-store"></i>

                                <%=selectedRestaurant.getName()%>

                            </div>


                            <input type="hidden"
                                   name="restaurantId"
                                   value="<%=selectedRestaurant.getRestaurantId()%>">


                        <%
                        }else{
                        %>


                            <select name="restaurantId" required>

                                <option value="">
                                    Select Restaurant
                                </option>


                                <%
                                if(restaurants != null){

                                    for(Restaurant restaurant : restaurants){
                                %>

                                    <option value="<%=restaurant.getRestaurantId()%>">

                                        <%=restaurant.getName()%>

                                    </option>

                                <%
                                    }
                                }
                                %>

                            </select>


                        <%
                        }
                        %>

                    </div>


                    <!-- FOOD NAME -->

                    <div class="form-group">

                        <label>
                            Food Name
                        </label>

                        <input type="text"
                               name="name"
                               placeholder="Enter food name"
                               required>

                    </div>

                </div>


                <!-- ================= DESCRIPTION ================= -->

                <div class="form-row">

                    <div class="form-group full">

                        <label>
                            Description
                        </label>

                        <textarea
                            name="description"
                            placeholder="Enter food description"
                            required></textarea>

                    </div>

                </div>


                <!-- ================= PRICE + RATING ================= -->

                <div class="form-row">


                    <div class="form-group">

                        <label>
                            Price
                        </label>

                        <input type="number"
                               name="price"
                               placeholder="Enter price"
                               step="0.01"
                               min="0"
                               required>

                    </div>


                    <div class="form-group">

                        <label>
                            Rating
                        </label>

                        <input type="number"
                               name="rating"
                               placeholder="0 - 5"
                               step="0.1"
                               min="0"
                               max="5"
                               required>

                    </div>

                </div>


                <!-- ================= IMAGE + TYPE ================= -->

                <div class="form-row">


                    <div class="form-group">

                        <label>
                            Image URL
                        </label>

                        <input type="text"
                               name="imageUrl"
                               placeholder="images/Biryani.jpg"
                               required>

                    </div>


                    <div class="form-group">

                        <label>
                            Food Type
                        </label>

                        <select name="type" required>

                            <option value="">
                                Select Type
                            </option>

                            <option value="Veg">
                                Veg
                            </option>

                            <option value="Non-Veg">
                                Non-Veg
                            </option>

                            <option value="Egg">
                                Egg
                            </option>

                        </select>

                    </div>

                </div>


                <!-- ================= AVAILABLE ================= -->

                <div class="checkbox-group">

                    <input type="checkbox"
                           name="isAvailable"
                           id="available"
                           checked>

                    <label for="available">
                        Available
                    </label>

                </div>


                <!-- ================= BUTTONS ================= -->

                <div class="buttons">


                    <button type="submit"
                            class="add-btn">

                        <i class="fa-solid fa-plus"></i>

                        Add Food

                    </button>


                    <a href="restaurants"
                       class="cancel-btn">

                        <i class="fa-solid fa-arrow-left"></i>

                        Cancel

                    </a>

                </div>


            </form>

        </div>

    </div>

</main>


</body>

</html>
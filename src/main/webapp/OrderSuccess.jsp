<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Food Express | Order Successful</title>

<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

<style>

/* =========================================
   RESET
========================================= */

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', Arial, sans-serif;
}


/* =========================================
   BODY
========================================= */

body {

    min-height: 100vh;

    background:
        radial-gradient(
            circle at 20% 20%,
            rgba(139, 92, 246, 0.12),
            transparent 30%
        ),
        radial-gradient(
            circle at 80% 80%,
            rgba(255, 90, 54, 0.10),
            transparent 30%
        ),
        #FFF9F2;

    color: #211A2E;

}


/* =========================================
   NAVBAR
========================================= */

.navbar {

    height: 78px;

    display: flex;

    align-items: center;

    justify-content: space-between;

    padding: 0 60px;

    background: #5B21B6;

    box-shadow:
        0 5px 20px rgba(33, 26, 46, 0.18);

}


/* LOGO */

.logo {

    color: white;

    font-size: 30px;

    font-weight: 700;

    display: flex;

    align-items: center;

    gap: 10px;

}

.logo i {

    color: white;

}


/* NAV LINKS */

.nav-links {

    display: flex;

    align-items: center;

    gap: 28px;

    list-style: none;

}

.nav-links a {

    color: white;

    text-decoration: none;

    font-size: 16px;

    font-weight: 500;

    transition: 0.3s;

}

.nav-links a:hover {

    color: #FFD6CC;

}


/* =========================================
   SUCCESS SECTION
========================================= */

.success-container {

    min-height: calc(100vh - 78px);

    display: flex;

    justify-content: center;

    align-items: center;

    padding: 50px 20px;

}


/* =========================================
   SUCCESS CARD
========================================= */

.success-card {

    width: 650px;

    max-width: 100%;

    background: white;

    border-radius: 24px;

    padding: 50px 45px;

    text-align: center;

    border: 1px solid #E8DFF0;

    box-shadow:
        0 20px 50px rgba(33, 26, 46, 0.12);

}


/* =========================================
   SUCCESS ICON
========================================= */

.success-icon {

    width: 110px;

    height: 110px;

    margin: 0 auto 25px;

    border-radius: 50%;

    background: #DCFCE7;

    color: #16A34A;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 55px;

    border: 6px solid #F0FDF4;

    box-shadow:
        0 10px 25px rgba(22, 163, 74, 0.15);

}


/* =========================================
   HEADING
========================================= */

.success-card h1 {

    font-size: 34px;

    color: #211A2E;

    margin-bottom: 12px;

    font-weight: 700;

}


.success-card h1 span {

    color: #5B21B6;

}


/* =========================================
   MESSAGE
========================================= */

.success-message {

    font-size: 17px;

    color: #756C80;

    margin-bottom: 10px;

}


.success-submessage {

    font-size: 14px;

    color: #9A91A5;

    margin-bottom: 30px;

}


/* =========================================
   ORDER INFO
========================================= */

.order-info {

    background: #FFF9F2;

    border: 1px solid #E8DFF0;

    border-radius: 15px;

    padding: 20px;

    margin-bottom: 30px;

}


.order-info p {

    color: #756C80;

    font-size: 15px;

    margin: 6px 0;

}


.order-info strong {

    color: #211A2E;

}


/* =========================================
   BUTTONS
========================================= */

.action-buttons {

    display: flex;

    justify-content: center;

    gap: 15px;

    flex-wrap: wrap;

}


.btn {

    display: inline-flex;

    align-items: center;

    justify-content: center;

    gap: 8px;

    padding: 14px 25px;

    border-radius: 10px;

    text-decoration: none;

    font-size: 15px;

    font-weight: 600;

    transition: 0.3s;

}


/* CONTINUE SHOPPING */

.shop-btn {

    background: #FF5A36;

    color: white;

    box-shadow:
        0 6px 15px rgba(255, 90, 54, 0.20);

}


.shop-btn:hover {

    background: #E94A28;

    transform: translateY(-2px);

}


/* MY ORDERS */

.orders-btn {

    background: #8B5CF6;

    color: white;

    box-shadow:
        0 6px 15px rgba(139, 92, 246, 0.20);

}


.orders-btn:hover {

    background: #7C3AED;

    transform: translateY(-2px);

}


/* =========================================
   FOOTER
========================================= */

footer {

    background: #5B21B6;

    color: #F5EDFF;

    text-align: center;

    padding: 25px;

}


footer h2 {

    color: white;

    margin-bottom: 6px;

}


footer p {

    color: #E9DFFF;

    font-size: 14px;

}


/* =========================================
   RESPONSIVE
========================================= */

@media (max-width: 768px) {

    .navbar {

        padding: 0 25px;

    }

    .logo {

        font-size: 24px;

    }

    .nav-links {

        gap: 15px;

    }

    .nav-links a {

        font-size: 14px;

    }

    .success-card {

        padding: 40px 25px;

    }

    .success-card h1 {

        font-size: 28px;

    }

}


@media (max-width: 480px) {

    .navbar {

        height: auto;

        padding: 15px;

        flex-direction: column;

        gap: 12px;

    }

    .nav-links {

        flex-wrap: wrap;

        justify-content: center;

    }

    .success-container {

        padding: 30px 15px;

    }

    .success-icon {

        width: 90px;

        height: 90px;

        font-size: 45px;

    }

    .success-card h1 {

        font-size: 24px;

    }

    .action-buttons {

        flex-direction: column;

    }

    .btn {

        width: 100%;

    }

}

</style>

</head>


<body>


<!-- =========================================
     NAVBAR
========================================= -->

<nav class="navbar">

    <div class="logo">

        <i class="fa-solid fa-utensils"></i>

        Food Express

    </div>


    <ul class="nav-links">

        <li>

            <a href="restaurant">

                <i class="fa-solid fa-store"></i>

                Restaurant

            </a>

        </li>


        <li>

            <a href="Cart.jsp">

                <i class="fa-solid fa-cart-shopping"></i>

                Cart

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


<!-- =========================================
     SUCCESS
========================================= -->

<div class="success-container">


    <div class="success-card">


        <!-- SUCCESS ICON -->

        <div class="success-icon">

            <i class="fa-solid fa-check"></i>

        </div>


        <!-- HEADING -->

        <h1>

            Order Placed <span>Successfully!</span>

        </h1>


        <p class="success-message">

            🎉 Thank you for ordering with Food Express!

        </p>


        <p class="success-submessage">

            Your delicious food is being prepared.

        </p>


        <!-- ORDER INFO -->

        <div class="order-info">

            <p>

                <i class="fa-solid fa-circle-check"
                   style="color:#16A34A;"></i>

                Your order has been successfully placed.

            </p>

            <p>

                <i class="fa-solid fa-truck"
                   style="color:#8B5CF6;"></i>

                Your food will be delivered soon.

            </p>

        </div>


        <!-- BUTTONS -->

        <div class="action-buttons">


            <a href="restaurant"
               class="btn shop-btn">

                <i class="fa-solid fa-store"></i>

                Continue Shopping

            </a>


            <a href="orderHistory"
               class="btn orders-btn">

                <i class="fa-solid fa-box"></i>

                My Orders

            </a>


        </div>


    </div>

</div>


<!-- =========================================
     FOOTER
========================================= -->

<footer>

    <h2>Food Express</h2>

    <p>

        Fresh Food • Fast Delivery • Happy Customers

    </p>

    <p>

        © 2026 Food Express Ordering System

    </p>

</footer>


</body>

</html>
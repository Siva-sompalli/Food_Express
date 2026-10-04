// =======================================
// Food Express Ordering System
// orderhistory.js
// =======================================


// ---------- Navbar Shadow ----------

window.addEventListener("scroll", function () {

    const navbar = document.querySelector(".navbar");

    if (window.scrollY > 20) {

        navbar.style.boxShadow = "0 8px 20px rgba(0,0,0,.3)";

    } else {

        navbar.style.boxShadow = "0 5px 15px rgba(0,0,0,.15)";

    }

});


// ---------- Order Card Animation ----------

window.addEventListener("load", function () {

    const cards = document.querySelectorAll(".order-card");

    cards.forEach(function(card, index){

        card.style.opacity = "0";
        card.style.transform = "translateY(30px)";

        setTimeout(function(){

            card.style.transition = ".5s";
            card.style.opacity = "1";
            card.style.transform = "translateY(0px)";

        }, index * 150);

    });

});


// ---------- Status Color ----------

const statusList = document.querySelectorAll(".status");

statusList.forEach(function(status){

    let text = status.innerText.trim().toLowerCase();

    if(text === "pending"){

        status.style.background = "#ffc107";
        status.style.color = "#000";

    }
    else if(text === "preparing"){

        status.style.background = "#17a2b8";

    }
    else if(text === "delivered"){

        status.style.background = "#28a745";

    }
    else if(text === "cancelled"){

        status.style.background = "#dc3545";

    }

});


// ---------- Order Card Hover ----------

const cards = document.querySelectorAll(".order-card");

cards.forEach(function(card){

    card.addEventListener("mouseenter",function(){

        card.style.transform = "translateY(-5px)";

    });

    card.addEventListener("mouseleave",function(){

        card.style.transform = "translateY(0px)";

    });

});


// ---------- Social Icons ----------

const icons = document.querySelectorAll(".social i");

icons.forEach(function(icon){

    icon.addEventListener("mouseenter",function(){

        icon.style.transform = "scale(1.2)";

    });

    icon.addEventListener("mouseleave",function(){

        icon.style.transform = "scale(1)";

    });

});


// ---------- Empty Order Animation ----------

const empty = document.querySelector(".empty");

if(empty){

    empty.style.opacity = "0";
    empty.style.transform = "scale(.8)";

    setTimeout(function(){

        empty.style.transition = ".6s";
        empty.style.opacity = "1";
        empty.style.transform = "scale(1)";

    },300);

}


// ---------- Console ----------

console.log("Order History Loaded Successfully");
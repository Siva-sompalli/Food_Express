// ==========================================
// Food Express Ordering System
// menu.js
// ==========================================

// ---------- Live Search ----------

const searchFood = document.getElementById("searchFood");

if (searchFood) {

    searchFood.addEventListener("keyup", function () {

        let filter = this.value.toLowerCase();

        let cards = document.querySelectorAll(".menu-card");

        cards.forEach(function (card) {

            let itemName = card.querySelector("h3").innerText.toLowerCase();

            let description = card.querySelector(".description").innerText.toLowerCase();

            if (itemName.includes(filter) || description.includes(filter)) {

                card.style.display = "block";

            } else {

                card.style.display = "none";

            }

        });

    });

}


// ---------- Navbar Shadow ----------

window.addEventListener("scroll", function () {

    let navbar = document.querySelector(".navbar");

    if (window.scrollY > 20) {

        navbar.style.boxShadow = "0px 8px 20px rgba(0,0,0,.35)";

    } else {

        navbar.style.boxShadow = "0px 5px 15px rgba(0,0,0,.15)";

    }

});


// ---------- Card Hover Animation ----------

const cards = document.querySelectorAll(".menu-card");

cards.forEach(function(card){

    card.addEventListener("mouseenter",function(){

        card.style.transform="translateY(-10px) scale(1.02)";
        card.style.transition=".3s";

    });

    card.addEventListener("mouseleave",function(){

        card.style.transform="translateY(0px) scale(1)";

    });

});


// ---------- Add To Cart Button ----------

const buttons = document.querySelectorAll(".add-btn");

buttons.forEach(function(button){

    button.addEventListener("click",function(){

        if(!button.disabled){

            button.innerHTML =
            "<i class='fa-solid fa-spinner fa-spin'></i> Adding...";

        }

    });

});


// ---------- Smooth Scroll ----------

document.querySelectorAll('a[href^="#"]').forEach(anchor => {

    anchor.addEventListener("click", function (e) {

        e.preventDefault();

        let target = document.querySelector(this.getAttribute("href"));

        if(target){

            target.scrollIntoView({

                behavior:"smooth"

            });

        }

    });

});


// ---------- Highlight Search Box ----------

if(searchFood){

    searchFood.addEventListener("focus",function(){

        this.style.boxShadow="0 0 12px rgba(255,81,47,.5)";

    });

    searchFood.addEventListener("blur",function(){

        this.style.boxShadow="0 5px 15px rgba(0,0,0,.15)";

    });

}


// ---------- Restaurant Header Animation ----------

window.addEventListener("load",function(){

    let header=document.querySelector(".restaurant-header");

    if(header){

        header.style.opacity="0";
        header.style.transform="translateY(-20px)";

        setTimeout(function(){

            header.style.transition=".6s";
            header.style.opacity="1";
            header.style.transform="translateY(0px)";

        },200);

    }

});


// ---------- Menu Card Fade In ----------

window.addEventListener("load",function(){

    let cards=document.querySelectorAll(".menu-card");

    cards.forEach(function(card,index){

        card.style.opacity="0";
        card.style.transform="translateY(25px)";

        setTimeout(function(){

            card.style.transition=".5s";
            card.style.opacity="1";
            card.style.transform="translateY(0px)";

        },index*120);

    });

});


// ---------- Welcome ----------

console.log("Welcome to Food Express Ordering System");
// ======================================
// Food Express Ordering System
// cart.js
// ======================================

// -------- Navbar Shadow --------

window.addEventListener("scroll", function () {

    const navbar = document.querySelector(".navbar");

    if (window.scrollY > 20) {

        navbar.style.boxShadow = "0 8px 20px rgba(0,0,0,0.30)";

    } else {

        navbar.style.boxShadow = "0 5px 15px rgba(0,0,0,0.15)";

    }

});


// -------- Cart Card Hover --------

const cards = document.querySelectorAll(".cart-item");

cards.forEach(function(card){

    card.addEventListener("mouseenter",function(){

        card.style.transform="translateY(-8px)";
        card.style.transition=".3s";

    });

    card.addEventListener("mouseleave",function(){

        card.style.transform="translateY(0px)";

    });

});


// -------- Quantity Button Animation --------

const quantityButtons = document.querySelectorAll(".quantity-box button");

quantityButtons.forEach(function(button){

    button.addEventListener("click",function(){

        button.style.transform="scale(.9)";

        setTimeout(function(){

            button.style.transform="scale(1)";

        },120);

    });

});


// -------- Remove Confirmation --------

const removeButtons = document.querySelectorAll(".remove-btn");

removeButtons.forEach(function(button){

    button.addEventListener("click",function(event){

        let confirmDelete = confirm("Remove this item from cart?");

        if(!confirmDelete){

            event.preventDefault();

        }

    });

});


// -------- Checkout Button --------

const checkoutButton = document.querySelector(".checkout-btn");

if(checkoutButton){

    checkoutButton.addEventListener("click",function(){

        checkoutButton.innerHTML =
        "<i class='fa-solid fa-spinner fa-spin'></i> Processing...";

    });

}


// -------- Empty Cart Animation --------

const emptyCart = document.querySelector(".empty-cart");

if(emptyCart){

    emptyCart.style.opacity="0";
    emptyCart.style.transform="translateY(30px)";

    window.onload=function(){

        emptyCart.style.transition=".6s";

        emptyCart.style.opacity="1";

        emptyCart.style.transform="translateY(0px)";

    }

}


// -------- Cart Item Fade In --------

window.addEventListener("load",function(){

    const items=document.querySelectorAll(".cart-item");

    items.forEach(function(item,index){

        item.style.opacity="0";
        item.style.transform="translateY(20px)";

        setTimeout(function(){

            item.style.transition=".5s";

            item.style.opacity="1";

            item.style.transform="translateY(0px)";

        },index*120);

    });

});


// -------- Footer Icons --------

const socialIcons=document.querySelectorAll(".social i");

socialIcons.forEach(function(icon){

    icon.addEventListener("mouseenter",function(){

        icon.style.transform="scale(1.3)";

    });

    icon.addEventListener("mouseleave",function(){

        icon.style.transform="scale(1)";

    });

});


// -------- Welcome --------

console.log("Food Express Ordering System - Cart Loaded");
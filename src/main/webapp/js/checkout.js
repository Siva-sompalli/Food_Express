// ==========================================
// Food Express Ordering System
// checkout.js
// ==========================================

// -------- Navbar Shadow --------

window.addEventListener("scroll", function () {

    const navbar = document.querySelector(".navbar");

    if (window.scrollY > 20) {

        navbar.style.boxShadow = "0 8px 20px rgba(0,0,0,.3)";

    } else {

        navbar.style.boxShadow = "0 5px 15px rgba(0,0,0,.15)";

    }

});


// -------- Input Focus Effect --------

const inputs = document.querySelectorAll("input, textarea");

inputs.forEach(function(input){

    input.addEventListener("focus",function(){

        this.style.borderColor="#ff512f";
        this.style.boxShadow="0 0 10px rgba(255,81,47,.3)";

    });

    input.addEventListener("blur",function(){

        this.style.boxShadow="none";

    });

});


// -------- Payment Option Highlight --------

const paymentOptions=document.querySelectorAll(".payment-option");

paymentOptions.forEach(function(option){

    option.addEventListener("click",function(){

        paymentOptions.forEach(function(opt){

            opt.style.border="1px solid #ddd";
            opt.style.background="#fff";

        });

        option.style.border="2px solid #ff512f";
        option.style.background="#fff3ef";

        const radio=option.querySelector("input[type='radio']");

        if(radio){

            radio.checked=true;

        }

    });

});


// -------- Form Validation --------

const checkoutForm=document.querySelector("form");

if(checkoutForm){

checkoutForm.addEventListener("submit",function(event){

    const name=document.getElementById("name");
    const phone=document.getElementById("phone");
    const address=document.getElementById("address");
    const payment=document.querySelector("input[name='paymentMethod']:checked");

    if(name.value.trim()===""){

        alert("Please enter your name.");

        name.focus();

        event.preventDefault();

        return;

    }

    if(phone.value.trim()===""){

        alert("Please enter your phone number.");

        phone.focus();

        event.preventDefault();

        return;

    }

    if(phone.value.length!=10){

        alert("Phone number must contain 10 digits.");

        phone.focus();

        event.preventDefault();

        return;

    }

    if(address.value.trim()===""){

        alert("Please enter your delivery address.");

        address.focus();

        event.preventDefault();

        return;

    }

    if(payment==null){

        alert("Please select a payment method.");

        event.preventDefault();

        return;

    }

});

}


// -------- Place Order Button --------

const placeOrder=document.querySelector(".place-order-btn");

if(placeOrder){

placeOrder.addEventListener("click",function(){

    placeOrder.innerHTML="<i class='fa-solid fa-spinner fa-spin'></i> Placing Order...";

});

}


// -------- Fade In Animation --------

window.addEventListener("load",function(){

    const delivery=document.querySelector(".delivery-box");
    const summary=document.querySelector(".summary");

    if(delivery){

        delivery.style.opacity="0";
        delivery.style.transform="translateX(-30px)";

        setTimeout(function(){

            delivery.style.transition=".5s";
            delivery.style.opacity="1";
            delivery.style.transform="translateX(0px)";

        },150);

    }

    if(summary){

        summary.style.opacity="0";
        summary.style.transform="translateX(30px)";

        setTimeout(function(){

            summary.style.transition=".5s";
            summary.style.opacity="1";
            summary.style.transform="translateX(0px)";

        },250);

    }

});


// -------- Social Icons --------

const icons=document.querySelectorAll(".social i");

icons.forEach(function(icon){

    icon.addEventListener("mouseenter",function(){

        icon.style.transform="scale(1.25)";

    });

    icon.addEventListener("mouseleave",function(){

        icon.style.transform="scale(1)";

    });

});


// -------- Console --------

console.log("Checkout Page Loaded Successfully");
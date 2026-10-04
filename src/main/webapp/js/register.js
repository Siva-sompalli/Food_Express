// =======================================
// Food Express Ordering System
// register.js
// =======================================

// ---------- Navbar Shadow ----------

window.addEventListener("scroll", function () {

    const navbar = document.querySelector(".navbar");

    if (window.scrollY > 20) {

        navbar.style.boxShadow = "0 8px 20px rgba(0,0,0,0.3)";

    } else {

        navbar.style.boxShadow = "0 5px 15px rgba(0,0,0,0.15)";

    }

});


// ---------- Form Validation ----------

const form = document.querySelector("form");

if(form){

form.addEventListener("submit", function(event){

    let username = document.getElementById("username").value.trim();
    let email = document.getElementById("email").value.trim();
    let password = document.getElementById("password").value;
    let confirmPassword = document.getElementById("confirmPassword").value;
    let phone = document.getElementById("phoneNumber").value.trim();
    let address = document.getElementById("address").value.trim();

    // Username
    if(username.length < 3){

        alert("Username must contain at least 3 characters.");

        event.preventDefault();
        return;

    }

    // Email

    const emailPattern =
    /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;

    if(!emailPattern.test(email)){

        alert("Please enter a valid email.");

        event.preventDefault();
        return;

    }

    // Password

    if(password.length < 6){

        alert("Password must contain at least 6 characters.");

        event.preventDefault();
        return;

    }

    // Confirm Password

    if(password !== confirmPassword){

        alert("Passwords do not match.");

        event.preventDefault();
        return;

    }

    // Phone Number

    const phonePattern=/^[0-9]{10}$/;

    if(!phonePattern.test(phone)){

        alert("Phone number must contain exactly 10 digits.");

        event.preventDefault();
        return;

    }

    // Address

    if(address.length < 10){

        alert("Please enter a complete address.");

        event.preventDefault();
        return;

    }

});

}


// ---------- Password Strength ----------

const password=document.getElementById("password");

if(password){

password.addEventListener("keyup",function(){

    if(password.value.length>=8){

        password.style.border="2px solid green";

    }else{

        password.style.border="2px solid orange";

    }

});

}


// ---------- Confirm Password ----------

const confirm=document.getElementById("confirmPassword");

if(confirm){

confirm.addEventListener("keyup",function(){

    if(confirm.value===password.value){

        confirm.style.border="2px solid green";

    }else{

        confirm.style.border="2px solid red";

    }

});

}


// ---------- Register Button ----------

const registerButton=document.querySelector(".register-btn");

if(registerButton){

registerButton.addEventListener("click",function(){

    registerButton.innerHTML=
    "<i class='fa-solid fa-spinner fa-spin'></i> Registering...";

});

}


// ---------- Fade Animation ----------

window.addEventListener("load",function(){

    const card=document.querySelector(".register-card");

    card.style.opacity="0";
    card.style.transform="translateY(30px)";

    setTimeout(function(){

        card.style.transition=".5s";

        card.style.opacity="1";

        card.style.transform="translateY(0px)";

    },200);

});


// ---------- Social Icons ----------

const icons=document.querySelectorAll(".social i");

icons.forEach(function(icon){

    icon.addEventListener("mouseenter",function(){

        icon.style.transform="scale(1.2)";

    });

    icon.addEventListener("mouseleave",function(){

        icon.style.transform="scale(1)";

    });

});


console.log("Register Page Loaded");
// =======================================
// Food Express Ordering System
// profile.js
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


// ---------- Profile Card Animation ----------

window.addEventListener("load", function () {

    const card = document.querySelector(".profile-card");

    card.style.opacity = "0";
    card.style.transform = "translateY(40px)";

    setTimeout(function () {

        card.style.transition = ".6s";
        card.style.opacity = "1";
        card.style.transform = "translateY(0px)";

    }, 200);

});


// ---------- Profile Image Hover ----------

const profileImage = document.querySelector(".profile-image");

if (profileImage) {

    profileImage.addEventListener("mouseenter", function () {

        profileImage.style.transform = "scale(1.08) rotate(5deg)";
        profileImage.style.transition = ".3s";

    });

    profileImage.addEventListener("mouseleave", function () {

        profileImage.style.transform = "scale(1) rotate(0deg)";

    });

}


// ---------- Button Hover Animation ----------

const buttons = document.querySelectorAll(".btn");

buttons.forEach(function (button) {

    button.addEventListener("mouseenter", function () {

        button.style.transform = "translateY(-3px)";

    });

    button.addEventListener("mouseleave", function () {

        button.style.transform = "translateY(0px)";

    });

});


// ---------- Detail Card Animation ----------

const details = document.querySelectorAll(".detail");

details.forEach(function (detail, index) {

    detail.style.opacity = "0";
    detail.style.transform = "translateX(-20px)";

    setTimeout(function () {

        detail.style.transition = ".5s";
        detail.style.opacity = "1";
        detail.style.transform = "translateX(0px)";

    }, index * 150);

});


// ---------- Social Icons ----------

const icons = document.querySelectorAll(".social i");

icons.forEach(function (icon) {

    icon.addEventListener("mouseenter", function () {

        icon.style.transform = "scale(1.2)";
        icon.style.color = "#ff512f";

    });

    icon.addEventListener("mouseleave", function () {

        icon.style.transform = "scale(1)";
        icon.style.color = "";

    });

});


// ---------- Welcome Message ----------

const userName = document.querySelector(".profile-header h1");

if (userName) {

    console.log("Welcome " + userName.innerText + " to Food Express!");

}


// ---------- Console ----------

console.log("Profile Page Loaded Successfully");
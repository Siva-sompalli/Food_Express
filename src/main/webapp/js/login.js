// =======================================
// Food Express Ordering System
// login.js
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


// ---------- Show / Hide Password ----------

const password = document.getElementById("password");
const togglePassword = document.getElementById("togglePassword");

if (togglePassword) {

    togglePassword.addEventListener("click", function () {

        if (password.type === "password") {

            password.type = "text";
            togglePassword.classList.remove("fa-eye");
            togglePassword.classList.add("fa-eye-slash");

        } else {

            password.type = "password";
            togglePassword.classList.remove("fa-eye-slash");
            togglePassword.classList.add("fa-eye");

        }

    });

}


// ---------- Login Validation ----------

const loginForm = document.querySelector("form");

if (loginForm) {

    loginForm.addEventListener("submit", function (event) {

        const email = document.getElementById("email").value.trim();
        const passwordValue = document.getElementById("password").value.trim();

        const emailPattern =
        /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;

        if (!emailPattern.test(email)) {

            alert("Please enter a valid email address.");

            event.preventDefault();
            return;

        }

        if (passwordValue.length < 6) {

            alert("Password must contain at least 6 characters.");

            event.preventDefault();
            return;

        }

    });

}


// ---------- Input Focus Effect ----------

const inputs = document.querySelectorAll("input");

inputs.forEach(function (input) {

    input.addEventListener("focus", function () {

        this.style.borderColor = "#ff512f";
        this.style.boxShadow = "0 0 10px rgba(255,81,47,.3)";

    });

    input.addEventListener("blur", function () {

        this.style.boxShadow = "none";

    });

});


// ---------- Login Button Animation ----------

const loginButton = document.querySelector(".login-btn");

if (loginButton) {

    loginButton.addEventListener("click", function () {

        loginButton.innerHTML =
        "<i class='fa-solid fa-spinner fa-spin'></i> Logging In...";

    });

}


// ---------- Fade Animation ----------

window.addEventListener("load", function () {

    const card = document.querySelector(".login-card");

    if (card) {

        card.style.opacity = "0";
        card.style.transform = "translateY(30px)";

        setTimeout(function () {

            card.style.transition = ".5s";
            card.style.opacity = "1";
            card.style.transform = "translateY(0px)";

        }, 200);

    }

});


// ---------- Social Icons ----------

const icons = document.querySelectorAll(".social i");

icons.forEach(function (icon) {

    icon.addEventListener("mouseenter", function () {

        icon.style.transform = "scale(1.2)";

    });

    icon.addEventListener("mouseleave", function () {

        icon.style.transform = "scale(1)";

    });

});


// ---------- Console ----------

console.log("Food Express Login Page Loaded");
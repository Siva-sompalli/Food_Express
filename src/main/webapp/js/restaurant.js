// ==============================
// Food Express Ordering System
// restaurant.js
// ==============================

// ---------- Live Search ----------

const searchBox = document.getElementById("searchRestaurant");

if (searchBox) {

    searchBox.addEventListener("keyup", function () {

        let filter = searchBox.value.toLowerCase();

        let cards = document.querySelectorAll(".restaurant-card");

        cards.forEach(function (card) {

            let name = card.querySelector("h3").innerText.toLowerCase();

            let cuisine = card.querySelectorAll("p")[0].innerText.toLowerCase();

            if (name.includes(filter) || cuisine.includes(filter)) {

                card.style.display = "block";

            } else {

                card.style.display = "none";

            }

        });

    });

}

// ---------- Category Filter ----------

const categories = document.querySelectorAll(".category-item");

categories.forEach(function (category) {

    category.addEventListener("click", function () {

        categories.forEach(c => c.classList.remove("active-category"));

        this.classList.add("active-category");

        let selected = this.innerText.toLowerCase();

        if (selected.includes("🍕") ||
            selected.includes("🍔") ||
            selected.includes("🍛") ||
            selected.includes("🥗") ||
            selected.includes("🍟") ||
            selected.includes("🍜")) {

            selected = selected.substring(2).trim();
        }

        let cards = document.querySelectorAll(".restaurant-card");

        cards.forEach(function (card) {

            let cuisine = card.querySelectorAll("p")[0].innerText.toLowerCase();

            if (cuisine.includes(selected)) {

                card.style.display = "block";

            } else {

                card.style.display = "none";

            }

        });

    });

});

// ---------- Reset Search ----------

if (searchBox) {

    searchBox.addEventListener("search", function () {

        location.reload();

    });

}

// ---------- Navbar Shadow ----------

window.addEventListener("scroll", function () {

    let navbar = document.querySelector(".navbar");

    if (window.scrollY > 20) {

        navbar.style.boxShadow = "0px 5px 20px rgba(0,0,0,0.35)";

    } else {

        navbar.style.boxShadow = "0px 5px 15px rgba(0,0,0,0.15)";

    }

});

// ---------- Smooth Scroll ----------

document.querySelectorAll('a[href^="#"]').forEach(anchor => {

    anchor.addEventListener("click", function (e) {

        e.preventDefault();

        let target = document.querySelector(this.getAttribute("href"));

        if (target) {

            target.scrollIntoView({

                behavior: "smooth"

            });

        }

    });

});

// ---------- Card Hover Animation ----------

const cards = document.querySelectorAll(".restaurant-card");

cards.forEach(function (card) {

    card.addEventListener("mouseenter", function () {

        card.style.transition = ".3s";

        card.style.transform = "translateY(-10px) scale(1.02)";

    });

    card.addEventListener("mouseleave", function () {

        card.style.transform = "translateY(0px) scale(1)";

    });

});

// ---------- Welcome Message ----------

window.onload = function () {

    console.log("Welcome to Food Express Ordering System");

};
// =========================================
// Food Express Admin Dashboard
// admin.js
// =========================================

// Sidebar Active Menu
const menuItems = document.querySelectorAll(".sidebar ul li");

menuItems.forEach(item => {

	item.addEventListener("click", function () {

		menuItems.forEach(i => i.classList.remove("active"));

		this.classList.add("active");

	});

});

// Dashboard Card Animation
window.addEventListener("load", () => {

	const cards = document.querySelectorAll(".card");

	cards.forEach((card, index) => {

		card.style.opacity = "0";
		card.style.transform = "translateY(30px)";

		setTimeout(() => {

			card.style.transition = "0.5s ease";

			card.style.opacity = "1";

			card.style.transform = "translateY(0)";

		}, index * 150);

	});

});

// Quick Action Button Animation
const actionButtons = document.querySelectorAll(".action-buttons a");

actionButtons.forEach(button => {

	button.addEventListener("mouseenter", () => {

		button.style.transform = "translateY(-5px)";

	});

	button.addEventListener("mouseleave", () => {

		button.style.transform = "translateY(0px)";

	});

});

// Search Box
const searchBox = document.querySelector(".search input");

if (searchBox) {

	searchBox.addEventListener("keyup", function () {

		console.log("Searching : " + this.value);

		// Later we will connect this with Restaurant/Menu Search

	});

}

// Welcome Animation
const welcome = document.querySelector(".welcome");

if (welcome) {

	welcome.style.opacity = "0";

	welcome.style.transform = "translateX(-40px)";

	setTimeout(() => {

		welcome.style.transition = "0.6s";

		welcome.style.opacity = "1";

		welcome.style.transform = "translateX(0px)";

	}, 300);

}

// Profile Hover
const profile = document.querySelector(".profile img");

if (profile) {

	profile.addEventListener("mouseenter", () => {

		profile.style.transform = "scale(1.08)";
		profile.style.transition = "0.3s";

	});

	profile.addEventListener("mouseleave", () => {

		profile.style.transform = "scale(1)";

	});

}

// Counter Animation
const counters = document.querySelectorAll(".card h2");

counters.forEach(counter => {

	const target = parseInt(counter.innerText);

	if (!isNaN(target)) {

		let count = 0;

		const speed = target / 50;

		const update = () => {

			if (count < target) {

				count += speed;

				counter.innerText = Math.ceil(count);

				requestAnimationFrame(update);

			} else {

				counter.innerText = target;

			}

		};

		update();

	}

});

// Current Date
const today = new Date();

console.log("Dashboard Loaded : " + today.toLocaleString());

console.log("Food Express Admin Dashboard Ready");
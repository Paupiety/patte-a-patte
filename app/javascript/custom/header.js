document.addEventListener("turbo:load", function() {
    console.log("turbo:load. runs every time a page is loaded");
    const burger = document.getElementById("burger");
    const dropdown = document.getElementById("mobile-menu");

    const burgerOnClick = function () {
      dropdown.classList.toggle("hidden");
    };

    burger.addEventListener("click", burgerOnClick);
  });
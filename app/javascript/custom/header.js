//add function to wait page loaded to add button
document.addEventListener("DOMContentLoaded", function() {
  const dropdown = document.getElementById("mobile-menu");
  const burger = document.getElementById("burger");

  const burgerOnClick = function () {
    dropdown.classList.toggle("hidden");
  };

  burger.addEventListener("click", burgerOnClick);
});
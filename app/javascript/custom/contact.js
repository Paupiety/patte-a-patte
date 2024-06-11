document.addEventListener("turbo:load", function() {
    const buttonFaq = document.getElementById("button-faq");
    const questionFaq = document.getElementById("question");
    const arrowFaq = document.getElementById("arrow_question")

    const questionOnClick = function () {
        if (questionFaq.classList.contains("question_on")){
          questionFaq.classList.remove("question_on");
          questionFaq.classList.add("question_off");
          arrowFaq.classList.remove("arrow_rotate_on");
          arrowFaq.classList.add("arrow_rotate_off");
        }
        else {
          questionFaq.classList.remove("question_off");
          questionFaq.classList.add("question_on");
          arrowFaq.classList.remove("arrow_rotate_off");
          arrowFaq.classList.add("arrow_rotate_on");
        }
    };

    buttonFaq.addEventListener("click", questionOnClick);
  });

// document.addEventListener("turbo:load", function() {
//     console.log("turbo:load. runs every time a page is loaded");
//     const burger = document.getElementById("burger");
//     const dropdown = document.getElementById("mobile-menu");

//     const burgerOnClick = function () {
//       dropdown.classList.toggle("hidden");
//     };

//     burger.addEventListener("click", burgerOnClick);
//   });
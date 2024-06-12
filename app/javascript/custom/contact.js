document.addEventListener("turbo:load", function () {
  const containersQuestions = document.getElementsByClassName("container_question");
  console.log(containersQuestions[0].getElementsByClassName("question")[0])
  console.log(containersQuestions[0].getElementsByClassName("button-faq")[0])

    for (let container of containersQuestions) {
      container.getElementsByClassName("button-faq")[0].addEventListener("click", function(){
        if (container.getElementsByClassName("question")[0].classList.contains("question_on")) {
          container.getElementsByClassName("question")[0].classList.remove("question_on");
          container.getElementsByClassName("question")[0].classList.add("question_off");
  
          container.getElementsByClassName("arrow_question")[0].classList.remove("arrow_rotate_on");
          container.getElementsByClassName("arrow_question")[0].classList.add("arrow_rotate_off");
  
        } else if (container.getElementsByClassName("question")[0].classList.contains("question_off")) {
          container.getElementsByClassName("question")[0].classList.remove("question_off");
          container.getElementsByClassName("question")[0].classList.add("question_on");
  
          container.getElementsByClassName("arrow_question")[0].classList.remove("arrow_rotate_off");
          container.getElementsByClassName("arrow_question")[0].classList.add("arrow_rotate_on");
        }
      });
    };
});
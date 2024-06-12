document.addEventListener("turbo:load", function () {
  const form = document.getElementsByClassName("form")[0];
  const plusOff = document.getElementsByClassName("plus_off")[0];
  const plusOn = document.getElementsByClassName("plus_on")[0];
  const button = document.getElementsByClassName("button")[0];
  console.log(form)
  console.log(plusOff)
  console.log(plusOn)
  console.log(button)

  button.addEventListener("click", function () {
    if (plusOn.classList.contains("hidden")) {
      plusOff.classList.add("hidden");
      plusOn.classList.remove("hidden");
    } else {
        plusOn.classList.add("hidden");
        plusOff.classList.remove("hidden");
    }

    if (form.classList.contains("form_off")) {
      form.classList.remove("form_off");
      form.classList.add("form_on");
    } else {
        form.classList.remove("form_on");
      form.classList.add("form_off");
    }
  });
});

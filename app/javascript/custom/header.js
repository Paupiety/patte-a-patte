const dropdown = document.getElementById("mobile-menu");
const burger = document.getElementById("burger");

const burgerOnClick = function () {
  dropdown.classList.toggle("hidden");
};
burger.addEventListener("click", burgerOnClick);

// const footer = document.querySelector("footer.text-muted");
// let number = 0;
// const footerOnClick = function () {
//   console.log("click n°" + (number += 1));
// };
// footer.addEventListener("click", footerOnClick);

// const navBarHeader = document.getElementById("navbarHeader");
// const burgerButton = document.querySelector("button.navbar-toggler");

// burgerButtonClick = function () {
//   navBarHeader.classList.toggle("collapse");
// };
// burgerButton.addEventListener("click", burgerButtonClick);

// const parentCard = document.querySelector("div.album .row");
// const card1 = parentCard.querySelectorAll("div.col-md-4")[0];
// const btn1 = card1.querySelector(".btn-outline-secondary");

// const changeColorRed = function () {
//   const p = card1.querySelector("p.card-text");
//   p.style.color = "red";
// };

// const card2 = parentCard.querySelectorAll("div.col-md-4")[1];
// const btn2 = card2.querySelector(".btn-outline-secondary");

// const changeColorGreen = function () {
//   const p = card2.querySelector("p.card-text");
//   if (p.style.color) {
//     p.style.removeProperty("color");
//   } else {
//     p.style.color = "green";
//   }
// };
// btn1.addEventListener("click", changeColorRed);
// btn2.addEventListener("click", changeColorGreen);

// const head = document.getElementsByTagName("head")[0];

// const linkHead = head.getElementsByTagName("link")[0];

// removeCDN = function () {
//   if (linkHead.href) {
//     linkHead.removeAttribute("href");
//   } else {
//     linkHead.setAttribute(
//       "href",
//       "https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
//     );
//   }
// };

// const header = document.getElementsByTagName("header")[0];

// header.addEventListener("dblclick", removeCDN);

// const card2View = card2.querySelector(".btn-success");
// const style = document.createElement("style");

// const cardReduce = function (card) {
//   const cardp = card.getElementsByTagName("p")[0];
//   const cardimg = card.getElementsByTagName("img")[0];
//   style.innerHTML =
//     ".hidden { height: 0px; overflow: hidden;} .width {width:20%;}";
//   document.head.appendChild(style);
//   cardp.classList.toggle("hidden");
//   cardimg.classList.toggle("width");
// };

// for (let card of parentCard.querySelectorAll("div.col-md-4")) {
//   const cardView = card.querySelector(".btn-success");
//   cardView.addEventListener("mouseenter", function () {
//     cardReduce(card);
//   });
// }

// const buttonTurn = document.querySelector(".btn-secondary");

// const turnCard = function () {
//   firstElement = parentCard.firstElementChild;
//   lastElement = parentCard.lastElementChild;
//   parentCard.insertBefore(lastElement, firstElement);
// };

// buttonTurn.addEventListener("click", turnCard);

// const buttonInverseTurn = document.querySelector(".btn-primary");
// const inverseTurnCard = function (e) {
//   e.preventDefault();
//   firstElement = parentCard.firstElementChild;
//   lastElement = parentCard.lastElementChild;
//   parentCard.insertBefore(firstElement, lastElement.nextSibling);
//   //?? ça marche même sans .nextSibling trop chelou
// };

// buttonInverseTurn.addEventListener("click", inverseTurnCard);

// const logo = document.querySelector(".navbar-brand");
// let btnSelected = false;
// const clickButton = function () {
//   btnSelected = true;
//   console.log(btnSelected);
// };

// const keyPress = function (e) {
//   const body = document.body;
//   if (btnSelected) {
//     if (e.key === "a") {
//       //prend un attribut de <body> et change son contenu
//       body.setAttribute("class", "");
//       body.classList.add("col-4");
//       btnSelected = false;
//     } else if (e.key === "y") {
//       body.setAttribute("class", "");
//       body.classList.add("col-4", "offset-md-4");
//       btnSelected = false;
//     } else if (e.key === "p") {
//       body.setAttribute("class", "");
//       body.classList.add("col-4", "offset-md-8");
//       btnSelected = false;
//     } else if (e.key === "b") {
//       body.setAttribute("class", "");
//       btnSelected = false;
//     }
//   }
// };
// logo.addEventListener("click", clickButton);
// logo.addEventListener("keydown", keyPress);

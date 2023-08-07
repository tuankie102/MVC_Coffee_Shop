/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
const signInModal = document.querySelector(".signin-modal");
const signInBtn = document.querySelector(".js-signin");
const signInContainer = document.querySelector(".signin-container");
const signInClose = document.querySelector(".signin-close");
const submitBtns = document.querySelectorAll(".btn-submit");

//Sign In
function openmodalIn() {
  signInModal.classList.add("open");
}
function hidemodalIn() {
  signInModal.classList.remove("open");
}

//Sign In
signInBtn.addEventListener("click", openmodalIn);
signInClose.addEventListener("click", hidemodalIn);
signInModal.addEventListener("click", hidemodalIn);

signInContainer.addEventListener("click", function (event) {
  event.stopPropagation();
});

for (submitBtn of submitBtns) {
  submitBtn.addEventListener("click",hidemodalIn);
}




const navbarMenu = document.querySelector(".navbar .links");
const hamburgerBtn = document.querySelector(".hamburger-btn");
const hideMenuBtn = navbarMenu.querySelector(".close-btn");
const showPopupBtn = document.querySelector(".login-btn");
const formPopup = document.querySelector(".form-popup");
const hidePopupBtn = formPopup.querySelector(".close-btn");
const forgotPasswordLink = document.getElementById("forgot-password-link");
const loginLink = document.getElementById("login-link");
const sendResetLinkBtn = document.getElementById("send-reset-link");
const rememberedPasswordLink = document.querySelector(
    ".reset-password .bottom-link a"
);

// Show mobile menu
hamburgerBtn.addEventListener("click", () => {
    navbarMenu.classList.toggle("show-menu");
});

// Hide mobile menu
hideMenuBtn.addEventListener("click", () => hamburgerBtn.click());

// Show login popup
showPopupBtn.addEventListener("click", () => {
    document.body.classList.toggle("show-popup");
});

// Hide login popup
hidePopupBtn.addEventListener("click", () => showPopupBtn.click());

// Show forgot password form
forgotPasswordLink.addEventListener("click", (e) => {
    e.preventDefault();
    formPopup.classList.add("show-forgot-password");
});

// Show login form
loginLink.addEventListener("click", (e) => {
    e.preventDefault();
    formPopup.classList.remove("show-forgot-password");
    formPopup.classList.remove("show-reset-password");
});

// Show reset password form
sendResetLinkBtn.addEventListener("click", (e) => {
    e.preventDefault();
    formPopup.classList.remove("show-forgot-password");
    formPopup.classList.add("show-reset-password");
});

// Navigate back to login form from reset password form
rememberedPasswordLink.addEventListener("click", (e) => {
    e.preventDefault();
    formPopup.classList.remove("show-reset-password");
    formPopup.classList.remove("show-forgot-password");
});



const toggleShadow = () => {

  const togglerBoxStrip = document.getElementById("toggler-box-strip");
  const buttonToggler = document.getElementById("button-toggler");

  buttonToggler.addEventListener('click', (e) => {
    togglerBoxStrip.classList.toggle("shadow-off");
  });
}

export { toggleShadow };








// find target for button
// find target for toggle_box strip
// listen for a click on our button
// create a CSS class for our box shadaw
// on the click we want to toggle on and off the .shadow class on the .toggle_box strip

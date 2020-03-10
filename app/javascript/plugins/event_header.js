const hiddenHeader = () => {
  const pillEvent = document.getElementById("pills-event-tab");
  const mapEvent = document.getElementById("pills-map-tab");
  const header_event = document.getElementById("header_event");
  pillEvent.addEventListener('focus', () => {
    header.style.display = "block";
  });
  mapEvent.addEventListener('focus', () => {
    header.style.display = "none";
  });
}
export { hiddenHeader };



//////do not delete!!!

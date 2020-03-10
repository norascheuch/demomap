const hiddenHeader = () => {
  const pillEvent = document.getElementById("pills-event-tab");
  const mapEvent = document.getElementById("pills-map-tab");
  const header_event = document.getElementById("header_event");
  if (pillEvent) {
    pillEvent.addEventListener('click', () => {
      header_event.style.display = "block";
    });

    mapEvent.addEventListener('click', () => {
      header_event.style.display = "none";
    });
  }
}
export { hiddenHeader };




// require('dotenv').config()
var L = require('leaflet');
require('leaflet-control-geocoder');

const leafletNewEvent = () => {
// require('dotenv').config()

  // finds map container
  const newEvent = document.getElementById('new-event');

  if (newEvent) {

    // gets all map data from HTML
    const accessToken = newEvent.dataset.token;

    // creates empty map
    const map = L.map('new-event', {zoomControl: true}).setView([52.521321, 13.4111854], 13);

    // add tiles to map
    L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
        attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
        maxZoom: 18,
        id: 'mapbox/light-v10',
        tileSize: 512,
        zoomOffset: -1,
        accessToken: accessToken
    }).addTo(map);
    L.Control.geocoder({
        collapsed: false,
        placeholder: "Enter location"
    })
     .on('markgeocode', function(e) {
    var location = e.geocode.name;
    var coordinates = e.geocode.center;
    document.getElementById('event_location').value = location;
    document.getElementById('event_latitude').value = coordinates.lat;
    document.getElementById('event_longitude').value = coordinates.lng;
  }).addTo(map);
  }
};




export { leafletNewEvent };

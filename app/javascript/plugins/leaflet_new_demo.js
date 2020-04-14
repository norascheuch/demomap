// require('dotenv').config()
var L = require('leaflet');
require('leaflet-routing-machine');
require('leaflet-control-geocoder');

const leafletNewDemo = () => {
// require('dotenv').config()

  // finds map container
  const newDemo = document.getElementById('new-demo');

  if (newDemo) {

    // gets all map data from HTML
    const accessToken = newDemo.dataset.token;

    // creates empty map
    const map = L.map('new-demo', {zoomControl: true}).setView([52.521321, 13.4111854], 13);

    // add tiles to map
    L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
        attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
        maxZoom: 18,
        id: 'mapbox/light-v10',
        tileSize: 512,
        zoomOffset: -1,
        accessToken: accessToken
    }).addTo(map);



    L.Routing.control({
    // waypoints: [
    //     L.latLng(57.74, 11.94),
    //     L.latLng(57.6792, 11.949)
    // ],
    router: new L.Routing.mapbox(accessToken, {profile: 'mapbox/walking'}),
    geocoder: L.Control.Geocoder.mapbox(accessToken)
    }).addTo(map);


  }
};




export { leafletNewDemo };

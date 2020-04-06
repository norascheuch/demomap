var L = require('leaflet');
require('leaflet-routing-machine');

// gets all map data from HTML
const demoMap = document.getElementById('map');

const markers = JSON.parse(demoMap.dataset.markers);

// creates empty map
const map = L.map('map', {zoomControl: false}).setView([52.521321, 13.4111854], 13);

console.log(demoMap.dataset.mappoints)

// add markers to map and the bounds array that fits the map to its markers
let bounds = []

markers.forEach((rawMarker) => {
  markerLoc = [rawMarker.lat, rawMarker.lng]
  const icon = L.icon({
    iconUrl: rawMarker.image_url,
    iconSize: [38, 95], // size of the icon
    popupAnchor: [0,-15]
  });
  var customOptions = {'maxWidth': '200', 'className' : 'custom' }
  bounds.push(markerLoc)
  L.marker(markerLoc, {icon: icon}).bindPopup(rawMarker.infoWindow, customOptions).openPopup().addTo(map);
});


map.fitBounds(bounds);



// add routing
L.Routing.control({
  waypoints: [
    L.latLng(57.74, 11.94),
    L.latLng(57.6792, 11.949)
  ]
}).addTo(map);


// add tiles to map
L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 18,
    id: 'mapbox/light-v10',
    tileSize: 512,
    zoomOffset: -1,
    accessToken: demoMap.dataset.mapboxApiKey
}).addTo(map);




     // L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
     //    maxZoom: 19,
     //    attribution: '&copy; <a href="https://openstreetmap.org/copyright">OpenStreetMap contributors</a>'
     //  }).addTo(map);

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
    let route = newDemo.dataset.route;
    if (route != null) {
        route = route.slice(1, route.length).split(';').map(entry => entry.split(',').map(ent => parseFloat(ent)));
    }


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
    waypoints: route,
    router: new L.Routing.mapbox(accessToken, {profile: 'mapbox/walking'}),
    geocoder: L.Control.Geocoder.mapbox(accessToken)
    })
    .on('routeselected', function(e) {
        var route = e.route;
        console.log(JSON.stringify(route.inputWaypoints, null, 2));
        document.getElementById('demo_route').value = JSON.stringify(route.inputWaypoints, null, 2);
    })
    .addTo(map);
  }
};




export { leafletNewDemo };

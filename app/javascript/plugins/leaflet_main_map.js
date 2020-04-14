// require('dotenv').config()
var L = require('leaflet');
require('leaflet-routing-machine');

const leafletMainMap = () => {

  // finds map container
  const mainMap = document.getElementById('main-map');

  if (mainMap) {

    // gets all map data from HTML
    const markers = JSON.parse(mainMap.dataset.markers);
    const accessToken = mainMap.dataset.token;
    let route = mainMap.dataset.mappoints;
    route = route.slice(1, route.length).split(';').map(entry => entry.split(',').map(ent => parseFloat(ent)));

    // creates empty map
    const map = L.map('main-map', {zoomControl: false}).setView([52.521321, 13.4111854], 13);


    let bounds = []

    // extract marker information and add markers to map with pop up, expand map bound
    markers.forEach((rawMarker) => {
      const markerLoc = [rawMarker.lat, rawMarker.lng]
      bounds.push(markerLoc)
      const icon = L.icon({
        iconUrl: rawMarker.image_url,
        iconSize: [38, 95], // size of the icon
        popupAnchor: [0,-15]
      });
      const customOptions = {'maxWidth': '200', 'className' : 'custom' }
      L.marker(markerLoc, {icon: icon}).bindPopup(rawMarker.infoWindow, customOptions).openPopup().addTo(map);
    });


    // fit map to marker
    map.fitBounds(bounds);


    // add route
    L.Routing.control({
      waypoints: route,
      createMarker: function() { return null; },
      lineOptions : {
        addWaypoints: false,
        styles: [{fillColor: '#74B1F9', opacity: 0.7, weight: 5}]
      },
      router: L.Routing.mapbox(accessToken, {profile: 'mapbox/walking'})
    }).addTo(map);


    // add user location button
    document.getElementById('locate-position').addEventListener('click', () => {
      map.locate({setView: true, maxZoom: 15});
    });

    map.on('locationfound', function(e) {
        L.marker(e.latlng).addTo(map)
    });


    // add tiles to map
    L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
        attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
        maxZoom: 18,
        id: 'mapbox/light-v10',
        tileSize: 512,
        zoomOffset: -1,
        accessToken: accessToken
    }).addTo(map);

  }
};


export { leafletMainMap };

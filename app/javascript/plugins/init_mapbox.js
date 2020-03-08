import mapboxgl from 'mapbox-gl';

import MapboxDirections from '@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions';

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  const mapElementTwo = document.getElementById('map_two');




  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    console.log(bounds)
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 12, duration: 0 });
  };

  const getRoute = (map, mappoints) => {
    // make a directions request using cycling profile
    // an arbitrary start will always be the same
    // only the end or destination will change


    var url = 'https://api.mapbox.com/directions/v5/mapbox/walking/' + mappoints + '?steps=true&geometries=geojson&access_token=' + mapboxgl.accessToken;

    // make an XHR request https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest
    var req = new XMLHttpRequest();
    req.open('GET', url, true);
    req.onload = function() {
      var json = JSON.parse(req.response);
      var data = json.routes[0];
      var route = data.geometry.coordinates;
      var geojson = {
        type: 'Feature',
        properties: {},
        geometry: {
          type: 'LineString',
          coordinates: route
        }
      };
      // if the route already exists on the map, reset it using setData
      if (map.getSource('route')) {
        map.getSource('route').setData(geojson);
      } else { // otherwise, make a new request
        const routeLayer = map.addLayer({
          id: 'route',
          type: 'line',
          source: {
            type: 'geojson',
            data: {
              type: 'Feature',
              properties: {},
              geometry: {
                type: 'LineString',
                coordinates: route
              }
            }
          },
          layout: {
            'line-join': 'round',
            'line-cap': 'round'
          },
          paint: {
            'line-color': '#326ecd',
            'line-width': 8,
            'line-opacity': 0.75
          }
        });
      }
      // add turn instructions here at the end
    };
    req.send();
  }

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/light-v10',
      center: [13.41297, 52.52160],
      zoom: 12,
    });



    map.on('load', function() {
    // make an initial directions request that
    // starts and ends at the same location

      const markers = JSON.parse(mapElement.dataset.markers);
      markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

      const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '25px';
      element.style.height = '25px';


        new mapboxgl.Marker(element)
          .setLngLat([ marker.lng, marker.lat ])
          .setPopup(popup)
          .addTo(map);
      });


      const mappoints = JSON.parse(mapElement.dataset.mappoints);
      getRoute(map, mappoints);
      fitMapToMarkers(map, markers);


    });
  };

  if (mapElementTwo) { // only build a map if there's a div#map to inject into
  mapboxgl.accessToken = mapElementTwo.dataset.mapboxApiKey;
  const map_two = new mapboxgl.Map({
    container: 'map_two',
    style: 'mapbox://styles/mapbox/light-v10',
    center: [13.41297, 52.52160],
    zoom: 12,
    });


  const directions = new MapboxDirections({
    accessToken: mapboxgl.accessToken,
    unit: 'metric',
    profile: 'mapbox/walking'
  });



  map_two.on('load', function() {
    console.log(directions)
    map_two.addControl(
      new MapboxDirections({
      accessToken: mapboxgl.accessToken
      }),
      'top-left'
    );



    });

  };



};

export { initMapbox };



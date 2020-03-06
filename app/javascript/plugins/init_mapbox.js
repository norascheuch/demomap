import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');



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
      center: [52.518743, 13.406523],
      zoom: 12,
    });

    map.on('load', function() {
    // make an initial directions request that
    // starts and ends at the same location


      map.addControl(
      new mapboxgl.GeolocateControl({
      positionOptions: {
      enableHighAccuracy: true
      },
      trackUserLocation: true
      })
      );

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

      // Add starting point to the map
  //     map.addLayer({
  //       id: 'point',
  //       type: 'circle',
  //       source: {
  //         type: 'geojson',
  //         data: {
  //           type: 'FeatureCollection',
  //           features: [{
  //             type: 'Feature',
  //             properties: {},
  //             geometry: {
  //               type: 'Point',
  //               coordinates: start
  //             }
  //           }
  //           ]
  //         }
  //       },
  //       paint: {
  //         'circle-radius': 10,
  //         'circle-color': '#3887be'
  //       }
  //     });
    });
  }
};

export { initMapbox };

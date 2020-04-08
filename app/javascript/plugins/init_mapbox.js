import mapboxgl from 'mapbox-gl';

import MapboxDirections from '@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions';

const initMapbox = () => {
  const mapElementTwo = document.getElementById('map_two');

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
      profile: 'mapbox/walking',
      controls: { instructions: false }
    });


    map_two.addControl(directions, 'top-left');

    directions.on('route', function(route) {
      document.getElementById('demo_route').value = JSON.stringify(directions.getWaypoints());
      document.getElementById('demo_start_location').value = JSON.stringify(directions.getOrigin());
      document.getElementById('demo_end_location').value = JSON.stringify(directions.getDestination());
    })

  };



};

export { initMapbox };



import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css';
import '@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions.css';

import "../plugins/flatpickr"


// import { initMapbox } from '../plugins/init_mapbox';
import { toggleShadow } from '../plugins/footer_menu';
import { hiddenHeader } from '../plugins/event_header';
import { readMore } from '../plugins/read_more';
import { leafletMap } from '../plugins/leaflet_map';
// import { readMore } from '../plugins/add_to_home_screen.js';


// initMapbox();
toggleShadow();
hiddenHeader();
readMore();
leafletMap();
// add_to_home_screen();


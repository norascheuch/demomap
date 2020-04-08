import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css';
import '@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions.css';

import "../plugins/flatpickr"


import { initMapbox } from '../plugins/init_mapbox';
import { toggleShadow } from '../plugins/footer_menu';
import { hiddenHeader } from '../plugins/event_header';
import { readMore } from '../plugins/read_more';
import { leafletMainMap } from '../plugins/leaflet_main_map';
// import { readMore } from '../plugins/add_to_home_screen.js';


initMapbox();
toggleShadow();
hiddenHeader();
readMore();
leafletMainMap();
// add_to_home_screen();



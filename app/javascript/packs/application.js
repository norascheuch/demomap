import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css';
import '@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions.css';

import "../plugins/flatpickr"


import { toggleShadow } from '../plugins/footer_menu';
import { hiddenHeader } from '../plugins/event_header';
import { readMore } from '../plugins/read_more';
import { leafletMainMap } from '../plugins/leaflet_main_map';
import { leafletNewDemo } from '../plugins/leaflet_new_demo';
import { leafletNewEvent } from '../plugins/leaflet_new_event';



// initMapbox();
toggleShadow();
hiddenHeader();
readMore();
leafletMainMap();
leafletNewDemo();
leafletNewEvent();
// add_to_home_screen();


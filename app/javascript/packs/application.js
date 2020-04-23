import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css';
import '@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions.css';

import "../plugins/flatpickr"


import { hiddenHeader } from '../plugins/event_header';
import { readMore } from '../plugins/read_more';
import { leafletMainMap } from '../plugins/leaflet_main_map';
import { leafletNewDemo } from '../plugins/leaflet_new_demo';
import { leafletNewEvent } from '../plugins/leaflet_new_event';
import { sideNav } from '../plugins/side_nav';
import { twitterFeed } from '../plugins/twitter';


sideNav();
twitterFeed();

// initMapbox();
hiddenHeader();
readMore();
leafletMainMap();
leafletNewDemo();
leafletNewEvent();
// add_to_home_screen();



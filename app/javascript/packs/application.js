import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css';
import '@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions.css';

import "../plugins/flatpickr"


import { initMapbox } from '../plugins/init_mapbox';
import { toggleShadow } from '../plugins/footer_menu';


initMapbox();
toggleShadow();


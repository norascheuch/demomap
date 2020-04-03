import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css';
import '@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions.css';

import "../plugins/flatpickr"


import { initMapbox } from '../plugins/init_mapbox';
import { toggleShadow } from '../plugins/footer_menu';
import { commentUpdate } from '../plugins/comment_update';
import { hiddenHeader } from '../plugins/event_header';
import { readMore } from '../plugins/read_more';
// import { readMore } from '../plugins/add_to_home_screen.js';



initMapbox();
toggleShadow();
hiddenHeader();
commentUpdate();  // this is left here to discuss with santi, it can be deleted (inclusive the corresponding file) at the end of march latest
readMore();
// add_to_home_screen();


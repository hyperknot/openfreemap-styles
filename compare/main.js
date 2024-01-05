import './reset.css'
import './style.css'

import { setupMap } from './map.js'
import { loadStyle } from './style.js'

let left, right

// left = await loadStyle('/styles/bright/style.json', 'left')

right = await loadStyle('/styles/liberty/style.json', 'left')

left = await loadStyle('/styles/positron/style.json', 'right')
// right = await loadStyle('/styles/positron/omt_orig_linted.json', 'right')

// right = await loadStyle('/styles/dark/style.json', 'right')
// right = await loadStyle('/dark/omt_orig_linted.json', 'right')

// right = await loadStyle('/_stadia/osm_bright.json', 'right')

// right = await loadStyle('/_maptiler/streets-v2.json', 'right')
// right = await loadStyle('/_maptiler/dataviz-dark.json', 'right')
// right = await loadStyle('/_maptiler/dataviz-light.json', 'right')
// right = await loadStyle('/_maptiler/outdoor-v2.json', 'right')
// right = await loadStyle('/_maptiler/basic-v2.json', 'right')

setupMap(left, right)

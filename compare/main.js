import './reset.css'
import './style.css'

import { setupMap } from './map.js'
import { loadStyle } from './style.js'

let left, right

left = await loadStyle('/styles/bright/style.json')

// right = await loadStyle('/styles/positron/style.json')
right = await loadStyle('/styles/liberty/style.json')

// right = await loadStyle('/styles/positron/style.json')
// right = await loadStyle('/styles/positron/omt_orig_linted.json')

// right = await loadStyle('/styles/dark/style.json')
// right = await loadStyle('/dark/omt_orig_linted.json')

setupMap(left, right)

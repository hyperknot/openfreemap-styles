import './reset.css'
import './style.css'

import { setupMap } from './map.js'
import { loadStyle } from './style.js'

const left = await loadStyle('/bright/omt.json', 'left')
const right = await loadStyle('/bright/maphub.json', 'right')

setupMap(left, right)

export function setupMap(leftStyle, rightStyle) {
  const leftMap = new maplibregl.Map({
    container: 'left',
    style: leftStyle,
    center: [9, 48],
    zoom: 3,
    hash: true,
  })

  const rightMap = new maplibregl.Map({
    container: 'right',
    style: rightStyle,
    center: [9, 48],
    zoom: 3,
  })

  window.leftMap = leftMap
  window.rightMap = rightMap

  window.compare = new maplibregl.Compare(leftMap, rightMap, '#compare', {
    // mousemove: true,
  })

  // rightMap.setZoom(leftMap.getZoom())
}

export async function loadStyle(url) {
  const res = await fetch(url)
  const data = await res.json()

  delete data.bearing
  delete data.center
  delete data.zoom
  delete data.pitch
  delete data.metadata
  delete data.name
  delete data.id

  if (url.startsWith('/')) {
    data.glyphs = 'https://vt.maphub.net/static/fonts/57252b/{fontstack}/{range}.pbf'
    // data.glyphs = "https://demotiles.maplibre.org/font/{fontstack}/{range}.pbf"
    // data.glyphs = "https://protomaps.github.io/basemaps-assets/fonts/{fontstack}/{range}.pbf"

    data.sprite = 'https://vt.maphub.net/static/sprites/bright/6112bc/sprite'

    data.sources.openmaptiles.url = 'https://tiles.openfreemap.org/planet/20231221_134737_pt'

    for (const layer of data.layers) {
      delete layer.metadata

      const layout = layer.layout

      if (layout?.['text-font']) {
        layout['text-font'] = ['Open Sans Regular']
      }

      // if (layout?.visibility === 'visible') {
      //   delete layout.visibility
      // }

      // if (layer.layout)) {
      //   delete layer.layout
      // }
    }
  }

  return data
}

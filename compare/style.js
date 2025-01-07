const OFM_DOMAIN = 'tiles.openfreemap.org'

export async function loadStyle(url) {
  const res = await fetch(url)
  const text = await res.text()
  const modifiedText = text.replace(/__TILEJSON_DOMAIN__/g, OFM_DOMAIN)
  const data = JSON.parse(modifiedText)

  data.bearing = undefined
  data.center = undefined
  data.zoom = undefined
  data.pitch = undefined
  data.metadata = undefined
  data.name = undefined
  data.id = undefined

  if (url.startsWith('/')) {
    for (const layer of data.layers) {
      // delete layer.metadata
      // const layout = layer.layout
      // if (layout?.['text-font']) {
      // layout['text-font'] = 'Noto Sans Regular
      // }
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

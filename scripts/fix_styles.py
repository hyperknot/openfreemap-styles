#!/usr/bin/env python3
import json
from pathlib import Path

import click


@click.command()
@click.argument(
    'style_path',
    type=click.Path(exists=True, path_type=Path),
)
def cli(style_path):
    """
    Fixes text-fields in styles
    """

    with open(style_path) as fp:
        style = json.load(fp)

    style['sources'] = {
        'openmaptiles': {'type': 'vector', 'url': 'https://tiles.openfreemap.org/planet'},
        'natural_earth': {
            'maxzoom': 6,
            'tileSize': 256,
            'tiles': [
                'https://tiles.openfreemap.org/ne/natural_earth_2_shaded_relief.raster/{z}/{x}/{y}.png'
            ],
            'type': 'raster',
        },
    }
    style['glyphs'] = 'https://tiles.openfreemap.org/fonts/ofm/{fontstack}/{range}.pbf'

    for layer in style['layers']:
        if 'layout' not in layer:
            continue

        text_field = layer['layout'].get('text-field')
        if not text_field:
            continue

        if text_field == ['to-string', ['get', 'ref']]:
            continue

        id_ = layer['id']
        if 'line' in id_ or 'highway' in id_:
            separator = ' '
        else:
            separator = '\n'

        layer['layout']['text-field'] = [
            'case',
            ['has', 'name:nonlatin'],
            ['concat', ['get', 'name:latin'], separator, ['get', 'name:nonlatin']],
            ['coalesce', ['get', 'name_en'], ['get', 'name']],
        ]
    with open(style_path, 'w') as fp:
        json.dump(style, fp, ensure_ascii=False)


if __name__ == '__main__':
    cli()

#!/usr/bin/env python3
import json
from pathlib import Path

import click


DOMAIN = 'tiles.openfreemap.org'


@click.command()
@click.argument(
    'style_path',
    type=click.Path(exists=True, path_type=Path),
)
def cli(style_path):
    """
    Set OpenFreeMap specific values in styles
    """

    with open(style_path) as fp:
        style = json.load(fp)

    style.pop('name', None)
    style.pop('metadata', None)

    style['sources'] = {
        'openmaptiles': {'type': 'vector', 'url': f'https://{DOMAIN}/planet'},
        'ne2_shaded': {
            'maxzoom': 6,
            'tileSize': 256,
            'tiles': [f'https://{DOMAIN}/natural_earth/ne2sr/{{z}}/{{x}}/{{y}}.png'],
            'type': 'raster',
        },
    }
    style['glyphs'] = f'https://{DOMAIN}/fonts/{{fontstack}}/{{range}}.pbf'
    style['sprite'] = f'https://{DOMAIN}/sprites/ofm_f384/ofm'

    for layer in style['layers']:
        layer.pop('metadata', None)

        if 'layout' not in layer:
            continue

        text_field = layer['layout'].get('text-field')
        if not text_field:
            continue

        # highway numbers, etc.
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

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

    for layer in style['layers']:
        if 'layout' not in layer:
            continue

        print()

        text_field = layer['layout'].get('text-field')
        if not text_field:
            continue

        if text_field == ['to-string', ['get', 'ref']]:
            continue

        print(layer['id'])
        print(text_field)

    # with open(style_path, 'w') as fp:
    #     json.dump(style, fp, ensure_ascii=False)


if __name__ == '__main__':
    cli()

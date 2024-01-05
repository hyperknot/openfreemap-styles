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

        if 'text-field' in layer['layout']:
            print(layer['layout']['text-field'])

    with open(style_path, 'w') as fp:
        json.dump(style, fp, ensure_ascii=False)


if __name__ == '__main__':
    cli()

#!/usr/bin/env python3
import json
import subprocess
from pathlib import Path

import click


@click.command()
@click.argument(
    'styles_folder',
    type=click.Path(exists=True, file_okay=False, resolve_path=True, path_type=Path),
)
def cli(styles_folder):
    for style_file in styles_folder.rglob('*.json'):
        with open(style_file) as fp:
            style = json.load(fp)
            if 'sources' not in style:
                continue

        for layer in style['layers']:
            if 'layout' not in layer:
                continue

            if 'text-field' in layer['layout']:
                print(layer['layout']['text-field'])


if __name__ == '__main__':
    cli()

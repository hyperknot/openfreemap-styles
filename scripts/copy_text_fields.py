#!/usr/bin/env python3
import json
import subprocess
from pathlib import Path

import click


@click.command()
@click.argument(
    'reference',
    type=click.Path(exists=True, path_type=Path),
)
@click.argument(
    'target',
    type=click.Path(exists=True, path_type=Path),
)
def cli(reference, target):
    """
    Copies text-fields from reference style to target style
    """

    with open(reference) as fp:
        ref_style = json.load(fp)

    collected_layers = []

    for layer in ref_style['layers']:
        if 'layout' not in layer:
            continue

        if 'text-field' in layer['layout']:
            collected_layers.append(layer)

    with open(target) as fp:
        target_style = json.load(fp)

    # remove existing text-fields
    target_style['layers'] = [
        l for l in target_style['layers'] if 'text-field' not in l.get('layout', {})
    ]

    target_style['layers'] += collected_layers

    with open(target, 'w') as fp:
        json.dump(target_style, fp, ensure_ascii=False)


if __name__ == '__main__':
    cli()

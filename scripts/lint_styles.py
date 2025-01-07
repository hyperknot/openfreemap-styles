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
    """
    Lints all style JSON files in a folder
    1. runs gl-style-migrate
    2. runs prettier with recursive JSON sorting
    3. gl-style-format
    4. gl-style-validate
    """

    p = subprocess.run(['pnpm', 'bin'], capture_output=True, text=True)
    node_bin_path = Path(p.stdout.strip())
    prettier_config_path = node_bin_path.parent.parent / '.prettierrc.js'

    for style_file in styles_folder.rglob('*.json'):
        if 'node_modules' in style_file.parts:
            continue

        with open(style_file) as fp:
            data = json.load(fp)
            if 'sources' not in data:
                continue

        print(f'formatting {style_file}')

        keep_original = '_orig.json' in style_file.name

        if not keep_original:
            with open(style_file) as fp:
                data = json.load(fp)

            remove_root_keys(data)
            clean_visibility(data)
            clean_empty_values(data)

            with open(style_file, 'w') as fp:
                json.dump(data, fp, ensure_ascii=False)

            # gl-style-migrate
            p = subprocess.run(
                [node_bin_path / 'gl-style-migrate', style_file], capture_output=True, text=True
            )
            with open(style_file, 'w') as fp:
                fp.write(p.stdout)

            print(p.stderr)

            # upgrade to MapLibre v21 styles
            p = subprocess.run(
                ['node', 'scripts/upgrade_v21.mjs', style_file], capture_output=True, text=True
            )
            print(p.stdout)
            print(p.stderr)

            # prettier
            subprocess.run(
                [
                    node_bin_path / 'prettier',
                    '--config',
                    prettier_config_path,
                    '--write',
                    style_file,
                ],
                capture_output=True,
            )

        # gl-style-format
        p = subprocess.run(
            [node_bin_path / 'gl-style-format', style_file], capture_output=True, text=True
        )
        with open(style_file, 'w') as fp:
            fp.write(p.stdout)

        # gl-style-validate
        subprocess.run(
            [
                node_bin_path / 'gl-style-validate',
                style_file,
            ],
        )


def remove_root_keys(data):
    for key in ['id', 'center', 'zoom', 'bearing', 'pitch']:
        data.pop(key, None)


def clean_visibility(data):
    for layer in data['layers']:
        try:
            if layer['layout']['visibility'] == 'visible':
                del layer['layout']['visibility']
        except KeyError:
            pass


def clean_empty_values(data):
    for layer in data['layers']:
        keys_to_delete = [k for k, v in layer.items() if v == {}]
        for k in keys_to_delete:
            del layer[k]


if __name__ == '__main__':
    cli()

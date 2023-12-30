#!/usr/bin/env bash
set -e

./copy_text_fields.py ../liberty/style.json ../bright/style.json
./copy_text_fields.py ../liberty/style.json ../bright/maplibre.json
./copy_text_fields.py ../liberty/style.json ../dark/style.json
./copy_text_fields.py ../liberty/style.json ../positron/style.json

cd ..
./lint.sh

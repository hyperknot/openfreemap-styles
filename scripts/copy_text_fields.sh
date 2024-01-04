#!/usr/bin/env bash
set -e

./copy_text_fields.py ../styles/bright/style.json ../styles/bright/maplibre.json
./copy_text_fields.py ../styles/bright/style.json ../styles/liberty/style.json
./copy_text_fields.py ../styles/bright/style.json ../styles/dark/style.json
./copy_text_fields.py ../styles/bright/style.json ../styles/positron/style.json

cd ..
./lint.sh

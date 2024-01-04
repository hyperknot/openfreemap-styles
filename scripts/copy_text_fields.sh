#!/usr/bin/env bash
set -e

./copy_text_fields.py ../styles/liberty/style.json ../styles/bright/style.json
./copy_text_fields.py ../styles/liberty/style.json ../styles/bright/maplibre.json
./copy_text_fields.py ../styles/liberty/style.json ../styles/liberty/style.json
./copy_text_fields.py ../styles/liberty/style.json ../styles/positron/style.json
./copy_text_fields.py ../styles/liberty/style.json ../styles/dark/style.json

cd ..
./lint.sh

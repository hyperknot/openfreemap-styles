#!/usr/bin/env bash
set -e

SOURCE=../styles/bright/style.json

./copy_text_fields.py $SOURCE ../styles/bright/style.json
./copy_text_fields.py $SOURCE ../styles/bright/maplibre.json
./copy_text_fields.py $SOURCE ../styles/liberty/style.json
./copy_text_fields.py $SOURCE ../styles/positron/style.json
./copy_text_fields.py $SOURCE ../styles/dark/style.json

cd ..
./lint.sh

#!/usr/bin/env bash
set -e

./fix_styles.py ../styles/bright/style.json
./fix_styles.py ../styles/bright/maplibre.json
./fix_styles.py ../styles/liberty/style.json
./fix_styles.py ../styles/positron/style.json

./fix_styles.py ../styles/dark/style.json
./fix_styles.py ../styles/fiord/style.json


#./fix_text_fields.py ../styles/bright/maphub.json > maphub
#./fix_text_fields.py ../styles/bright/maplibre_orig_linted.json
#./fix_text_fields.py ../styles/bright/omt_orig_linted.json

#./fix_text_fields.py ../styles/liberty/style.json
#./fix_text_fields.py ../styles/liberty/maputnik_orig_linted.json
#./fix_text_fields.py ../styles/positron/style.json
#./fix_text_fields.py ../styles/dark/style.json


cd ..
./lint.sh

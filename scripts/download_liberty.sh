#!/usr/bin/env bash
set -e

rm -rf ../styles/liberty
git clone https://github.com/maputnik/osm-liberty.git ../styles/liberty --depth=1

cd ../styles/liberty

rm -rf \
  .git \
  .github \
  demo \
  thumbnail.png \
  package*.json \
  logo.png \
  .gitignore \
  _config.yml \
  sprites \
  build_sprites.sh \
  sources_list.py \
  iconset.json

cp style.json maputnik_orig_linted.json

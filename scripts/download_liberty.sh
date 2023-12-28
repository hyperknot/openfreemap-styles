#!/usr/bin/env bash
set -e

rm -rf ../liberty
git clone https://github.com/maputnik/osm-liberty.git ../liberty --depth=1

cd ../liberty

rm -rf \
  .git \
  .github

cp style.json maputnik_orig.json
cp style.json maputnik_orig_linted.json

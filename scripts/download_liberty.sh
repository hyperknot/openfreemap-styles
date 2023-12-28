#!/usr/bin/env bash

rm -rf ../liberty
git clone https://github.com/maputnik/osm-liberty.git ../liberty --depth=1

cd ../liberty

rm -rf \
  .git \
  .github



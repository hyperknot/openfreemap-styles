#!/usr/bin/env bash
set -e



if [ ! -d ne ]; then
  git clone --depth=1 -b gh-pages https://github.com/lukasmartinelli/naturalearthtiles.git ne
  rm -rf ne/.git
fi

rm -rf _collected
mkdir -p _collected/ofm

cp -r ne/tiles/natural_earth_2_shaded_relief.raster _collected/ofm/ne2sr

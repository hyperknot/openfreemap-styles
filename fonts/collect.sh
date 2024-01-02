#!/usr/bin/env bash
set -e



git_clone_or_update() {
    if [ ! -d "$2" ]; then
        git clone --depth=1 "$1" "$2"
    else
        git -C "$2" fetch
        git -C "$2" reset --hard @{u}
        git -C "$2" clean -xdf
    fi
}

rm -rf _collected

git_clone_or_update https://github.com/maplibre/demotiles.git maplibre
git_clone_or_update https://github.com/openmaptiles/fonts.git openmaptiles
git_clone_or_update https://github.com/protomaps/basemaps-assets.git protomaps

mkdir _collected
cp -r maplibre/font _collected/maplibre


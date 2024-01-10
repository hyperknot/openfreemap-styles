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


git_clone_or_update https://github.com/maplibre/demotiles.git maplibre

rm -rf _collected
mkdir -p _collected/ofm
cp -r maplibre/font/Noto* _collected/ofm


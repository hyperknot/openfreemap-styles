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


mkdir -p _collected/omt

cp -r maplibre/font/Noto* _collected/omt


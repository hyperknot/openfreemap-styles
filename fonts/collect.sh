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
git_clone_or_update https://github.com/protomaps/basemaps-assets.git protomaps


if [ ! -d openmaptiles/_output ]; then
  git_clone_or_update https://github.com/openmaptiles/fonts.git openmaptiles

  # generate openmaptiles PBFs
  # needs old node version 12, using nvm
  (cd openmaptiles
    source "$NVM_DIR/nvm.sh"
    nvm use 12
    npm i
    node generate.js)
fi



# re-generating protomaps fonts
# currently not needed
# brew install cmake boost
# git_clone_or_update https://github.com/maplibre/font-maker.git fontmaker
# (cd fontmaker
#   git submodule update --init
#   cmake .
#   make
# )



mkdir _collected

cp -r maplibre/font _collected/ml
cp -r protomaps/fonts _collected/pm
cp -r openmaptiles/_output _collected/omt



# creating archive which should be replicatable across runs
# needs GNU tar for --mtime (brew install gnu-tar)
(cd _collected
  GZIP=-n gtar --sort=name --mtime=0 --owner=0 --group=0 -czf ml.tgz ml
  GZIP=-n gtar --sort=name --mtime=0 --owner=0 --group=0 -czf pm.tgz pm
  GZIP=-n gtar --sort=name --mtime=0 --owner=0 --group=0 -czf omt.tgz omt

  rm -rf ml pm omt
  md5 *.tgz
)



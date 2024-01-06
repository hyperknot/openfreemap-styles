#!/usr/bin/env bash
set -e

rm -rf _tmp_src _tmp_dst
mkdir -p _tmp_src _tmp_dst sprites

cp -r ../styles/liberty/svgs/svgs_iconset/. _tmp_src/
cp -r ../styles/liberty/svgs/svgs_not_in_iconset/ _tmp_src/
cp -r ../styles/bright/icons_unique/ _tmp_src/

(cd spritezero
  source "$NVM_DIR/nvm.sh"
  nvm use 12
  if [ ! -d node_modules ]; then
    npm i
  fi
  node spritezero-cli.js ../_tmp_dst/ofm ../_tmp_src/
  node spritezero-cli.js --retina ../_tmp_dst/ofm@2x ../_tmp_src/
)

rm -rf _tmp_src

# calculate dir hash
DIR_HASH=$(find _tmp_dst -type f -exec md5sum {} + | sort -k 2 | cut -d " " -f 1 | md5sum |cut -d " " -f 1)
DIR_HASH_CUT=${DIR_HASH:0:4}
echo "$DIR_HASH_CUT"

HASHED_DIR="sprites/ofm_$DIR_HASH_CUT/"
rm -rf "$HASHED_DIR"
mv _tmp_dst "$HASHED_DIR"


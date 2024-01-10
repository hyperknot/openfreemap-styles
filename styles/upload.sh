#!/usr/bin/env bash
set -e

export RCLONE_CONFIG=../config/rclone.conf

if [ ! -f $RCLONE_CONFIG ]; then
    echo "rclone.conf does not exist. Terminating."
    exit 1
fi


rm -rf _collected ofm.tar.gz
mkdir _collected

jq -c . bright/style.json > _collected/bright.json
jq -c . liberty/style.json > _collected/liberty.json
jq -c . positron/style.json > _collected/positron.json

# creating archive which should be replicatable across runs
# needs GNU tar for --mtime (brew install gnu-tar)
GZIP=-n gtar --sort=name --mtime='2000-01-01' --owner=0 --group=0 \
  -C _collected \
  -czf ofm.tar.gz .
md5 ofm.tar.gz

rclone copy \
  --checksum \
  -v \
  ofm.tar.gz cf:ofm-assets/styles

rm -rf _collected ofm.tar.gz

(cd ../scripts
./cloudflare_index.sh
)

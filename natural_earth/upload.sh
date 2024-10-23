#!/usr/bin/env bash
set -e

export RCLONE_CONFIG=../config/rclone.conf

if [ ! -f $RCLONE_CONFIG ]; then
    echo "rclone.conf does not exist. Terminating."
    exit 1
fi


# creating archive which should be replicatable across runs
# needs GNU tar for --mtime (brew install gnu-tar)
GZIP=-n gtar --sort=name --mtime='2000-01-01' --owner=0 --group=0 \
  -C _collected \
  -czf ofm.tar.gz ofm
md5 ofm.tar.gz


rclone copy \
  --checksum \
  --multi-thread-streams=8 \
  -vP \
  ofm.tar.gz cf:ofm-assets/natural_earth

rm ofm.tar.gz


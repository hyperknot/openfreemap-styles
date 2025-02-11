#!/usr/bin/env bash
set -e

export RCLONE_CONFIG=../config/rclone.conf

if [ ! -f $RCLONE_CONFIG ]; then
    echo "rclone.conf does not exist. Terminating."
    exit 1
fi


# creating archive which should be replicatable across runs
# needs GNU tar for --mtime (brew install gnu-tar)


(cd sprites
  # loop through each subfolder and compress it into a tar file
  for folder in */; do
    base=$(basename "$folder")
    echo $base
    GZIP=-n gtar --sort=name --mtime='2000-01-01' --owner=0 --group=0 -czf "${base}.tar.gz" "${base}"
  done
  md5 *.tar.gz
)

rclone copy \
  --checksum \
  --multi-thread-streams=8 \
  -vP \
  --include "*.tar.gz" \
  sprites cf:ofm-assets/sprites

rm sprites/*.tar.gz


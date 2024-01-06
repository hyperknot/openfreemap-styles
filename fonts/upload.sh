#!/usr/bin/env bash
set -e

export RCLONE_CONFIG=../config/rclone.conf

if [ ! -f $RCLONE_CONFIG ]; then
    echo "rclone.conf does not exist. Terminating."
    exit 1
fi


rm -rf _collected_gzip
mkdir _collected_gzip

# creating archive which should be replicatable across runs
# needs GNU tar for --mtime (brew install gnu-tar)
(cd _collected
  GZIP=-n gtar --sort=name --mtime='2000-01-01' --owner=0 --group=0 -czf ../_collected_gzip/ml.tgz ml
  GZIP=-n gtar --sort=name --mtime='2000-01-01' --owner=0 --group=0 -czf ../_collected_gzip/pm.tgz pm
  GZIP=-n gtar --sort=name --mtime='2000-01-01' --owner=0 --group=0 -czf ../_collected_gzip/omt.tgz omt
  md5 ../_collected_gzip/*.tgz
)


rclone sync \
  --checksum \
  --transfers=8 \
  --multi-thread-streams=8 \
  -vP \
  _collected_gzip cf:ofm-assets/fonts

rm -rf _collected_gzip

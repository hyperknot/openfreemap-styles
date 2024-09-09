#!/usr/bin/env bash
set -e

echo "not used, run in a cronjob on tile_gen server"

# export RCLONE_CONFIG=../config/rclone.conf

# if [ ! -f $RCLONE_CONFIG ]; then
#     echo "rclone.conf does not exist. Terminating."
#     exit 1
# fi

# echo 'creating cloudflare index'

# rm -rf index
# mkdir index

# rclone lsf -R \
#   --files-only \
#   --fast-list \
#   --exclude dirs.txt \
#   --exclude index.txt \
#   cf:ofm-assets > index/index.txt

# rclone lsf -R \
#   --dirs-only \
#   --dir-slash=false \
#   --fast-list \
#   cf:ofm-assets > index/dirs.txt

# rclone copy index cf:ofm-assets

# rm -rf index

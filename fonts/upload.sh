#!/usr/bin/env bash
set -e

export RCLONE_CONFIG=../config/rclone.conf

if [ ! -f $RCLONE_CONFIG ]; then
    echo "rclone.conf does not exist. Terminating."
    exit 1
fi


rclone sync \
  --transfers=8 \
  --multi-thread-streams=8 \
  -vP \
  _collected cf:ofm-assets/fonts



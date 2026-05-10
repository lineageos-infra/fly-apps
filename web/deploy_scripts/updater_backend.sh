#!/bin/bash
set -ex
podman-remote build \
    --tag local-updater-backend:latest \
    https://github.com/lineageos-infra/updater.git#$1
echo | nc -U /run/podman/auto-update.sock

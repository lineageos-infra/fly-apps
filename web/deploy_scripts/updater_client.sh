#!/bin/sh
set -ex
podman-remote build \
    --tag local-updater-client:latest \
    --file app01/Dockerfile \
    https://github.com/lineageos-infra/updater-client.git#$1
echo | nc -U /run/podman/auto-update.sock

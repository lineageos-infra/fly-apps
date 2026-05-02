#!/bin/bash
set -ex
podman-remote build \
    --tag local-updater-client:latest \
    --file app01/Dockerfile \
    https://github.com/lineageos-infra/updater-client.git#$1
busctl call org.freedesktop.systemd1 \
    /org/freedesktop/systemd1 \
    org.freedesktop.systemd1.Manager \
    StartUnit ss \
    podman-auto-update.service \
    replace

#!/bin/bash
set -ex
podman-remote build \
    --tag local-tribble-tracker:latest \
    https://github.com/lineageos-infra/tribble-tracker.git#$1
busctl call org.freedesktop.systemd1 \
    /org/freedesktop/systemd1 \
    org.freedesktop.systemd1.Manager \
    StartUnit ss \
    podman-auto-update.service \
    replace

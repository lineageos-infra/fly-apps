#!/bin/bash
set -ex
podman-remote build \
    --tag local-web:latest \
    https://github.com/lineageos-infra/fly-apps.git#$1:web
busctl call org.freedesktop.systemd1 \
    /org/freedesktop/systemd1 \
    org.freedesktop.systemd1.Manager \
    StartUnit ss \
    podman-auto-update.service \
    replace

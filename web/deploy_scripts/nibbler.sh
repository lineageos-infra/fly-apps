#!/bin/bash
set -ex
podman-remote build \
    --tag local-nibbler:latest \
    https://github.com/lineageos-infra/nibbler.git#$1
busctl call org.freedesktop.systemd1 \
    /org/freedesktop/systemd1 \
    org.freedesktop.systemd1.Manager \
    StartUnit ss \
    podman-auto-update.service \
    replace

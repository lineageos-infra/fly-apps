#!/bin/bash
set -ex
podman-remote build \
    --tag local-buildkite:latest \
    https://github.com/lineageos-infra/fly-apps.git#$1:buildkite
busctl call org.freedesktop.systemd1 \
    /org/freedesktop/systemd1 \
    org.freedesktop.systemd1.Manager \
    StartUnit ss \
    podman-auto-update.service \
    replace

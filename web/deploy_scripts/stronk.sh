#!/bin/bash
set -ex
podman-remote build \
    --tag local-stronk:latest \
    https://github.com/lineageos-infra/fly-apps.git#$1:stronk
echo | nc -U /run/podman/auto-update.sock

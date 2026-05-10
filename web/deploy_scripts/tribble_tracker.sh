#!/bin/bash
set -ex
podman-remote build \
    --tag local-tribble-tracker:latest \
    https://github.com/lineageos-infra/tribble-tracker.git#$1
echo | nc -U /run/podman/auto-update.sock

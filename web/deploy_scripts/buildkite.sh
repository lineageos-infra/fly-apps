#!/bin/bash
set -ex
podman-remote build \
    --tag local-buildkite:latest \
    https://github.com/lineageos-infra/fly-apps.git#$1:buildkite
echo | nc -U /run/podman/auto-update.sock

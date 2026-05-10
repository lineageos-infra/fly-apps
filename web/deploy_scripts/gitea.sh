#!/bin/bash
set -ex
podman-remote build \
    --tag local-gitea:latest \
    https://github.com/lineageos-infra/fly-apps.git#$1:gitea
echo | nc -U /run/podman/auto-update.sock

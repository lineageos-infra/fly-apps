#!/bin/bash
set -ex
podman-remote build \
    --tag local-nibbler:latest \
    https://github.com/lineageos-infra/nibbler.git#$1
echo | nc -U /run/podman/auto-update.sock

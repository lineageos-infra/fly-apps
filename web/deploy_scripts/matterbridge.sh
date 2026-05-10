#!/bin/sh
set -ex
podman-remote build \
    --tag local-matterbridge:latest \
    https://github.com/lineageos-infra/fly-apps.git#$1:matterbridge
echo | nc -U /run/podman/auto-update.sock

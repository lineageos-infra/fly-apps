#!/bin/sh
set -ex
podman-remote build \
    --tag local-issue-bot:latest \
    https://github.com/lineageos-infra/issue-bot.git#$1
echo | nc -U /run/podman/auto-update.sock

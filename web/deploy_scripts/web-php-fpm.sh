#!/bin/sh
set -ex
podman-remote build \
    --tag local-web-php-fpm:latest \
    https://github.com/lineageos-infra/fly-apps.git#$1:web-php-fpm
echo | nc -U /run/podman/auto-update.sock

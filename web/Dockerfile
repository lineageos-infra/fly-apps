FROM caddy:2.11.2-builder AS builder

RUN xcaddy build \
    --with github.com/abiosoft/caddy-exec=github.com/lineageos-infra/caddy-exec@master

FROM caddy:2.11.2

RUN apk add --no-cache bash git netcat-openbsd php-curl php-fpm podman-remote
RUN mv /etc/containers/seccomp.json /usr/share/containers/seccomp.json
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
COPY Caddyfile /etc/caddy/Caddyfile
COPY deploy_scripts /bin/deploy_scripts

CMD sh -c "php-fpm84 && caddy run --config /etc/caddy/Caddyfile --adapter caddyfile"

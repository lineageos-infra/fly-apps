FROM caddy:2.11.4-builder AS builder

RUN xcaddy build \
    --with github.com/abiosoft/caddy-exec=github.com/lineageos-infra/caddy-exec@master \
    --with github.com/greenpau/caddy-security \
    --with github.com/WeidiDeng/caddy-cloudflare-ip=github.com/WeidiDeng/caddy-cloudflare-ip@f53b62aa13cb7ad79c8b47aacc3f2f03989b67e5

FROM caddy:2.11.4

RUN apk add --no-cache git netcat-openbsd php-curl php-fpm podman-remote
RUN mv /etc/containers/seccomp.json /usr/share/containers/seccomp.json
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
COPY Caddyfile /etc/caddy/Caddyfile
COPY deploy_scripts /bin/deploy_scripts

CMD sh -c "php-fpm84 && caddy run --config /etc/caddy/Caddyfile --adapter caddyfile"

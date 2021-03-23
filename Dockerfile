ARG CADDY_VERSION=2

FROM caddy:${CADDY_VERSION}-builder-alpine AS antsot-caddy-builder

RUN xcaddy build \
    --with github.com/dunglas/mercure/caddy \
    --with github.com/dunglas/vulcain/caddy

FROM caddy:${CADDY_VERSION} AS antsot-caddy
COPY --from=antsot-caddy-builder /usr/bin/caddy /usr/bin/caddy

ARG CADDY_VERSION=2

FROM caddy:${CADDY_VERSION}-builder-alpine AS api_platform_caddy_builder

RUN xcaddy build \
    --with github.com/dunglas/mercure/caddy \
    --with github.com/dunglas/vulcain/caddy

FROM caddy:${CADDY_VERSION} AS api_platform_caddy
COPY --from=api_platform_caddy_builder /usr/bin/caddy /usr/bin/caddy

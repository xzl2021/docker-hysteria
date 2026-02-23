# Dockerfile for hysteria2 based alpine
# Copyright (C) 2024 xzl2021 <xzl2021#hotmail.com>
# Reference URL:
# https://github.com/HyNetwork/hysteria

FROM alpine:3.23
LABEL maintainer="xzl2021 <xzl2021#hotmail.com>"

WORKDIR /
RUN set -ex \
    && apk add --no-cache tzdata \
    && wget --no-check-certificate -O /usr/local/bin/hysteria https://github.com/apernet/hysteria/releases/download/app%2Fv2.6.2/hysteria-linux-amd64 \
    && chmod +x /usr/local/bin/hysteria \
    && mkdir -p /etc/hysteria \
    && wget --no-check-certificate -O /ca.crt https://github.com/xzl2021/docker-hysteria/raw/refs/heads/main/ca.crt \
    && wget --no-check-certificate -O /ca.key https://github.com/xzl2021/docker-hysteria/raw/refs/heads/main/ca.key \
    && wget --no-check-certificate -O /server.yaml https://github.com/xzl2021/docker-hysteria/raw/refs/heads/main/server.yaml \
    && wget --no-check-certificate -O /client.yaml https://github.com/xzl2021/docker-hysteria/raw/refs/heads/main/client.yaml \
    && wget --no-check-certificate -O /usr/local/bin/hysteria-entrypoint https://github.com/xzl2021/docker-hysteria/raw/refs/heads/main/hysteria-entrypoint.sh \
    && chmod +x /usr/local/bin/hysteria-entrypoint

ENV TZ=Asia/Shanghai
VOLUME /etc/hysteria

CMD ["hysteria-entrypoint"]
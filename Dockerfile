# Dockerfile for hysteria2 based alpine
# Copyright (C) 2024 xzl2021 <xzl2021#hotmail.com>
# Reference URL:
# https://github.com/HyNetwork/hysteria

FROM alpine:3.13
LABEL maintainer="xzl2021 <xzl2021#hotmail.com>"

ENV TZ=Asia/Shanghai
WORKDIR /

VOLUME /etc/hysteria

RUN set -ex \
    && apk add --no-cache bash tzdata wget \
    && wget -O /usr/bin/hysteria https://github.com/apernet/hysteria/releases/download/app%2Fv2.5.0/hysteria-linux-amd64 >/dev/null 2>&1 \
    && chmod u+x /usr/bin/hysteria

CMD [ "/usr/bin/hysteria", "server", "-c", "/etc/hysteria/server.yaml" ]


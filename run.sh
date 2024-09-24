#!/bin/bash
mkdir -p /etc/hysteria/
cp ./server.yaml /etc/hysteria/
cp ./cert.crt /etc/hysteria/
cp ./private.key /etc/hysteria/
docker run -d -p 0.0.0.0:8443:8443/udp -v /etc/hysteria:/etc/hysteria --restart=always --name hy2 hysteria2:latest

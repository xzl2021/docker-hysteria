#!/bin/sh
if [ ! -f /etc/hysteria/ca.crt ]; then
	cp /ca.crt /etc/hysteria/ca.crt
fi

if [ ! -f /etc/hysteria/ca.key ]; then
	cp /ca.key /etc/hysteria/ca.key
fi

if [ ! -f /etc/hysteria/server.yaml ]; then
	cp /server.yaml /etc/hysteria/server.yaml
fi

if [ ! -f /etc/hysteria/client.yaml ]; then
	cp /client.yaml /etc/hysteria/client.yaml
fi

hysteria server -c /etc/hysteria/server.yaml || exit 1

while true
do
    sleep 1d
done
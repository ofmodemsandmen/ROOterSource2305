#!/bin/sh

log() {
	logger -t "periodreset" "$@"
}

uci set ttl.hotspot.total='0'
uci commit ttl
echo 'PCNT="'"0"'"' > /tmp/periodcnt
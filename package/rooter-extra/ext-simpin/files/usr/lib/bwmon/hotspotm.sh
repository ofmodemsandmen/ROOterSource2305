#!/bin/sh

log() {
	logger -t "hotspotm" "$@"
}

sleep 5

enb=$(uci -q get ttl.hotspot.enable)
oldenb=$(uci -q get ttl.hotspot.oldenable)

if [ $oldenb != $enb ]; then
	uci set ttl.hotspot.oldenable=$enb
	uci commit ttl
	if [ $enb = "1" ]; then
		log "Enabled"
		uci set ttl.hotspot.total='0'
		uci commit ttl
		echo 'PCNT="'"0"'"' > /tmp/periodcnt
	else
		log "Disabled"
	fi
fi
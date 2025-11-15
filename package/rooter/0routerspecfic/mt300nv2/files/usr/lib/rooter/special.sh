#!/bin/sh 

log() {
	wifilog "Wifi Led" "$@"
}


wlan=$1

SM=$(uci get system.wifi)
if [ -z "$SM" ]; then
	uci set system.wifi=led
	uci set system.wifi.name="wifiled"
	uci set system.wifi.sysfs="red:wlan"
	uci set system.wifi.trigger="netdev"
	uci set system.wifi.mode="link tx rx"
	uci set system.wifi.dev='phy0-ap0'
fi
uci commit system
/etc/init.d/led restart

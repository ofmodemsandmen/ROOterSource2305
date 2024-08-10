#!/bin/sh

LED=0
SM=$(uci get system.led_wlan2g)
if [ -z $SM ]; then
	uci set system.led_wlan2g=led
	uci set system.led_wlan2g.name="WLAN2G"
	uci set system.led_wlan2g.sysfs="wifi0"
	uci set system.led_wlan2g.trigger="netdev"
	uci set system.led_wlan2g.dev="phy0-ap0"
	uci set system.led_wlan2g.mode="link tx rx"
	
	uci set system.led_wlan5g=led
	uci set system.led_wlan5g.name="WLAN5G"
	uci set system.led_wlan5g.sysfs="wifi1"
	uci set system.led_wlan5g.trigger="netdev"
	uci set system.led_wlan5g.dev="phy1-ap0"
	uci set system.led_wlan5g.mode="link tx rx"

	uci commit system
	/etc/init.d/led restart
	
	uci set pbr.config.verbosity="0"
	uci commit pbr
	/etc/init.d/pbr restart
fi

i=423
echo $i > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio${i}/direction
echo 1  > /sys/class/gpio/gpio${i}/value



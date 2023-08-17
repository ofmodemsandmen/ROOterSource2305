#!/bin/sh

log() {
	modlog "modem-led " "$@"
}

CURRMODEM=$1
COMMD=$2

DEV=$(uci get modem.modem$CURRMODEM.device)
if [ $COMMD -lt 4 ]; then
	log "$COMMD $DEV"
fi
if [ $DEV = "2-1.2" ]; then
	case $COMMD in
		"0" )
			uci -q delete system.led_4g
			uci commit system
			/etc/init.d/led restart
			echo none > /sys/class/leds/4g:status/trigger
			echo 0  > /sys/class/leds/4g:status/brightness
			;;
		"1" )
			echo timer > /sys/class/leds/4g:status/trigger
			echo 500  > /sys/class/leds/4g:status/delay_on
			echo 500  > /sys/class/leds/4g:status/delay_off
			;;
		"2" )
			echo timer > /sys/class/leds/4g:status/trigger
			echo 200  > /sys/class/leds/4g:status/delay_on
			echo 200  > /sys/class/leds/4g:status/delay_off
			;;
		"3" )
			echo none > /sys/class/leds/4g:status/trigger
			echo 0  > /sys/class/leds/4g:status/brightness
			INTER=$(uci get modem.modem$CURRMODEM.interface)
			uci set system.led_4g=led
			uci set system.led_4g.name="4g"
			uci set system.led_4g.sysfs="4g:status"
			uci set system.led_4g.trigger="netdev"
			uci set system.led_4g.dev="$INTER"
			uci set system.led_4g.mode="link tx rx"
			uci commit system
			/etc/init.d/led restart
			;;
	esac
else
	case $COMMD in
		"0" )
			uci -q delete system.led_4g2
			uci commit system
			/etc/init.d/led restart
			echo none > /sys/class/leds/4g2:status/trigger
			echo 0  > /sys/class/leds/4g2:status/brightness
			;;
		"1" )
			echo timer > /sys/class/leds/4g2:status/trigger
			echo 500  > /sys/class/leds/4g2:status/delay_on
			echo 500  > /sys/class/leds/4g2:status/delay_off
			;;
		"2" )
			echo timer > /sys/class/leds/4g2:status/trigger
			echo 200  > /sys/class/leds/4g2:status/delay_on
			echo 200  > /sys/class/leds/4g2:status/delay_off
			;;
		"3" )
			echo none > /sys/class/leds/4g2:status/trigger
			echo 0  > /sys/class/leds/4g2:status/brightness
			INTER=$(uci get modem.modem$CURRMODEM.interface)
			uci set system.led_4g2=led
			uci set system.led_4g2.name="4g2"
			uci set system.led_4g2.sysfs="4g2:status"
			uci set system.led_4g2.trigger="netdev"
			uci set system.led_4g2.dev="$INTER"
			uci set system.led_4g2.mode="link tx rx"
			uci commit system
			/etc/init.d/led restart
			;;
	esac
fi
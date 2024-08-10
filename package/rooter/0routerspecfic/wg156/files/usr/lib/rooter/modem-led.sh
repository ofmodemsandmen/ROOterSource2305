#!/bin/sh

log() {
	logger -t "modem-led " "$@"
}

CURRMODEM=$1
COMMD=$2

	case $COMMD in
		"0" )
			echo none > /sys/class/leds/4g/trigger
			echo 0  > /sys/class/leds/4g/brightness
			echo none > /sys/class/leds/rssi1/trigger
			echo 0  > /sys/class/leds/rssi1/brightness
			echo none > /sys/class/leds/rssi2/trigger
			echo 0  > /sys/class/leds/rssi2/brightness
			echo none > /sys/class/leds/rssi3/trigger
			echo 0  > /sys/class/leds/rssi3/brightness
			;;
		"1" )
			echo timer > /sys/class/leds/4g/trigger
			echo 500  > /sys/class/leds/4g/delay_on
			echo 500  > /sys/class/leds/4g/delay_off
			;;
		"2" )
			echo timer > /sys/class/leds/4g/trigger
			echo 200  > /sys/class/leds/4g/delay_on
			echo 200  > /sys/class/leds/4g/delay_off
			;;
		"3" )
			echo timer > /sys/class/leds/4g/trigger
			echo 1000  > /sys/class/leds/4g/delay_on
			echo 0  > /sys/class/leds/4g/delay_off
			;;
		"4" )
			echo none > /sys/class/leds/4g/trigger
			echo 1  > /sys/class/leds/4g/brightness
			sig2=$3
			echo timer > /sys/class/leds/rssi1/trigger
			if [ $sig2 -lt 18 -a $sig2 -gt 0 ] 2>/dev/null;then
				echo none > /sys/class/leds/rssi1/trigger
				echo 1  > /sys/class/leds/rssi1/brightness
				echo none > /sys/class/leds/rssi2/trigger
				echo 0  > /sys/class/leds/rssi2/brightness
				echo none > /sys/class/leds/rssi3/trigger
				echo 0  > /sys/class/leds/rssi3/brightness
			elif [ $sig2 -ge 18 -a $sig2 -lt 25 ] 2>/dev/null;then
				echo none > /sys/class/leds/rssi1/trigger
				echo 1  > /sys/class/leds/rssi1/brightness
				echo none > /sys/class/leds/rssi2/trigger
				echo 1  > /sys/class/leds/rssi2/brightness
				echo none > /sys/class/leds/rssi3/trigger
				echo 0  > /sys/class/leds/rssi3/brightness
			elif [ $sig2 -ge 25 ] 2>/dev/null;then
				echo none > /sys/class/leds/rssi1/trigger
				echo 1  > /sys/class/leds/rssi1/brightness
				echo none > /sys/class/leds/rssi2/trigger
				echo 1  > /sys/class/leds/rssi2/brightness
				echo none > /sys/class/leds/rssi3/trigger
				echo 1  > /sys/class/leds/rssi3/brightness
			else
				echo 950  > /sys/class/leds/rssi1/delay_on
				echo 950  > /sys/class/leds/rssi1/delay_off
			fi
			;;
	esac

#!/bin/sh
. /lib/functions.sh

log() {
	modlog "Load" "$@"
}

data=$1

uci set country.global.status=$(echo $data | cut -d, -f1)
uci set country.global.interval=$(echo $data | cut -d, -f2)
uci set country.global.timeout=$(echo $data | cut -d, -f3)
uci set country.global.check=$(echo $data | cut -d, -f4)

ip1=$(echo $data | cut -d, -f5)
if [ "$ip1" = "~" ]; then
	ip1=""
fi
ip2=$(echo $data | cut -d, -f6)
if [ "$ip2" = "~" ]; then
	ip2=""
fi
ip3=$(echo $data | cut -d, -f7)
if [ "$ip3" = "~" ]; then
	ip3=""
fi

uci set country.global.ip1=$ip1
uci set country.global.ip2=$ip2
uci set country.global.ip3=$ip3
uci commit country

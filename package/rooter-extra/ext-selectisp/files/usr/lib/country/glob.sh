#!/bin/sh
. /lib/functions.sh

log() {
	modlog "Load" "$@"
}

data=$1

simpin=$(echo $data | cut -d, -f1)
if [ "$simpin" = "~" ]; then
	simpin=""
fi
uci set country.global.simpin=$simpin
uci set country.global.roaming=$(echo $data | cut -d, -f2)
mcc=$(echo $data | cut -d, -f3)
if [ "$mcc" = "~" ]; then
	mcc=""
fi
uci set country.global.mcc=$mcc
mnc=$(echo $data | cut -d, -f4)
if [ "$mnc" = "~" ]; then
	mnc=""
fi
uci set country.global.mnc=$mnc
uci set country.global.ttl=$(echo $data | cut -d, -f5)
uci set country.global.mtu=$(echo $data | cut -d, -f6)
uci set country.global.autoset=$(echo $data | cut -d, -f7)
uci commit country
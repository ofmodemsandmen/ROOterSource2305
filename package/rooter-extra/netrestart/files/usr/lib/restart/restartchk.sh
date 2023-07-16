#!/bin/sh
. /lib/functions.sh

log() {
	modlog "Restart Check $CURRMODEM" "$@"
}

CURRMODEM=1
connect=$(uci get modem.modem$CURRMODEM.connected)
if [ "$connect" != "1" ]; then
	exit 0
fi
modlog "Timed Restart"
/usr/lib/rooter/luci/restart.sh 1 10
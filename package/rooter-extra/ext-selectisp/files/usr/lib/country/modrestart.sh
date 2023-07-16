#!/bin/sh
. /lib/functions.sh

ROOTER=/usr/lib/rooter

log() {
	modlog "Restart" "$@"
}

log "Modem Restart"
$ROOTER/luci/restart.sh 1 11
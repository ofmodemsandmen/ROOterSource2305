#!/bin/sh
. /lib/functions.sh

log() {
	modlog "Database Load" "$@"
}

mcc=$(cat /tmp/mccdata)
valid=$(echo "$mcc" | grep "**MCCDATA**")
if [ ! -z "$valid" ]; then
	sed -i '1d' /tmp/mccdata
	cp /tmp/mccdata /usr/lib/country/mccdata
	log "Database Not Encoded"
else
	valid=$(echo "$mcc" | grep "KioqTUNDREFUQSoqKgo=")
	if [ ! -z "$valid" ]; then
		rm -f /tmp/mcc
		while IFS= read -r line; do
			echo -n "$line" | base64 --decode >> /tmp/mcc
		done < /tmp/mccdata
		sed -i '1d' /tmp/mcc
		mv /tmp/mcc /usr/lib/country/mccdata
		log "Database Encoded"
	fi
fi


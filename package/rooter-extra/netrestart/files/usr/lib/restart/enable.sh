#!/bin/sh
. /lib/functions.sh

set=$1

uci set restart.info.enabled=$set
uci commit restart

if [ -e /etc/crontabs/root ]; then
	sed -i '/restartchk.sh/d' /etc/crontabs/root
fi

if [ $set = "1" ]; then
	tim=$(uci -q get restart.info.time)
	HOUR=${tim:0:2}
	MIN=${tim:3:2}
	echo "$MIN $HOUR * * * /usr/lib/restart/restartchk.sh &" >> /etc/crontabs/root
else
	result=`ps | grep -i "restartchk.sh" | grep -v "grep" | wc -l`
	if [ $result -lt 1 ]; then
		PID=$(ps | grep "restartchk.sh" | awk '{print $1}')
		if [ ! -z "$PID" ]; then
			kill -9 $PID
		fi
	fi
fi

/etc/init.d/cron restart
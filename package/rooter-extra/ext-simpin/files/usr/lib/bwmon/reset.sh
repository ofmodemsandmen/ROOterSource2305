#!/bin/sh

log() {
	logger -t "BW Reset" "$@"
}

setbackup() {
	extn=$(uci -q get bwmon.general.external)
	if [ "$extn" = "0" ]; then
		backPath=/usr/lib/bwmon/data/
	else
		if [ -e "$extn""/" ]; then
			backPath=$extn"/data/"
		else
			backPath=/usr/lib/bwmon/data/
			uci set bwmon.general.external="0"
			uci commit bwmon
		fi
	fi
}

newamt=$1

if [ -z "$newamt" ]; then
	exit 0
fi

setbackup
basePath="/tmp/bwmon/data/"
while [ -e /tmplockbw ]; do
	sleep 1
done
echo "0" > /tmp/lockbw

let newamt=newamt*1000
newline="\"mac\":\"---\",\"down\":\"$newamt\",\"up\":\"0\",\"offdown\":\"0\",\"offup\":\"0\",\"ip\":\"0.0.0.0\",\"name\":\"Reset Value\""
cDay=$(date +%d)
cYear=$(date +%Y)
cMonth=$(date +%m)
monthlyUsageDB="$basePath$cYear-$cMonth-mac_data.js"
monthlyUsageBack="$backPath$cYear-$cMonth-mac_data.js"
dailyUsageDB="$basePath$cYear-$cMonth-$cDay-daily_data.js"
dailyUsageBack="$backPath$cYear-$cMonth-$cDay-daily_data.js"

rm -f $monthlyUsageDB
rm -f $monthlyUsageBack
rm -f $dailyUsageBack
touch $monthlyUsageDB
echo "$newline" > $dailyUsageDB
/usr/lib/bwmon/backup.sh "daily" $cDay $monthlyUsageDB $dailyUsageDB $monthlyUsageBack $dailyUsageBack
rm -f $monthlyUsageDB
rm -f $monthlyUsageBack
touch $monthlyUsageDB

rm -f /tmp/lockbw

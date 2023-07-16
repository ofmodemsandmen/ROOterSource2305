#!/bin/sh

log() {
	modlog "Country" "$@"
}

data=$1

linen=$(echo $data | cut -d: -f1)
isp=$(echo $data | cut -d: -f2)

rm -f /tmp/mccdata
linecnt=1
while IFS= read -r line; do
	if [ $linecnt -ne $linen ]; then
		echo "$line" >> /tmp/mccdata
	else
		echo "$isp" >> /tmp/mccdata
	fi
	let linecnt=$linecnt+1
done < /usr/lib/country/mccdata

mv /tmp/mccdata /usr/lib/country/mccdata
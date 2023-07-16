#!/bin/sh
. /lib/functions.sh

log() {
	modlog "Save" "$@"
}

PKI_DIR="/www"
cd ${PKI_DIR}
mkdir -p package
cd ..
chmod -R 0777 ${PKI_DIR}/package

flag=$1
if [ "$flag" = "1" ]; then
	echo "***MCCDATA***" > /tmp/tobsf
	base64 /tmp/tobsf > ${PKI_DIR}/package/mccdata.mccdata
	rm -f /tmp/obsf
	while IFS= read -r line; do
		echo "$line" > /tmp/tobsf		
		base64 /tmp/tobsf >> /tmp/obsf
	done < /usr/lib/country/mccdata
	state=$(cat /tmp/obsf)
	echo "$state" >> ${PKI_DIR}/package/mccdata.mccdata
else
	echo "***MCCDATA***" > ${PKI_DIR}/package/mccdata.mccdata
	state=$(cat /usr/lib/country/mccdata)
	echo "$state" >> ${PKI_DIR}/package/mccdata.mccdata
fi
#!/bin/sh

log() {
	modlog "Save" "$@"
}

data=$1

selected=$(echo $data | cut -d: -f1)
uci set country.general.selected=$selected
uci set country.general.country=$(echo $data | cut -d: -f2)
uci set country.general.isp=$(echo $data | cut -d: -f3)
ispdata=$(echo $data | cut -d: -f4)
uci set country.general.ispdata=$ispdata
uci commit country

if [ "$selected" = "1" ]; then
	uci set profile.default.apn=$(echo $ispdata | cut -d, -f2)
	user=$(echo $ispdata | cut -d, -f6)
	if [ "$user" = "~" ]; then
		user=""
	fi
	uci set profile.default.user=$user
	passw=$(echo $ispdata | cut -d, -f4)
	if [ "$passw" = "~" ]; then
		passw=""
	fi
	uci set profile.default.passw=$passw
	uci set profile.default.context=$(echo $ispdata | cut -d, -f5)
	auth=$(echo $ispdata | cut -d, -f7)
	if [ "$auth" = "~" ]; then
		auth="0"
	fi
	uci set profile.default.auth=$auth
	pdp=$(echo $ispdata | cut -d, -f8)
	log "$pdp"
	if [ "$pdp" = "~" ]; then
		pdp="IPV4V6"
	else
		case $pdp in
			"0" )
			pdp="IPV4V6"
			;;
			"1" )
			pdp="IPV6"
			;;
			"2" )
			pdp="IPV6"
			;;
			"3" )
			pdp="IPV4V6"
			;;
		esac
	fi

	uci set profile.default.pdptype=$pdp
else
	uci set profile.default.apn='internet'
	uci set profile.default.context="1"
	uci set profile.default.user=""
	uci set profile.default.passw=""
	uci set profile.default.auth="0"
	uci set profile.default.pdptype="0"
	
fi
uci commit profile
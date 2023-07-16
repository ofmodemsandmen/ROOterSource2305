#!/bin/sh

log() {
	logger -t "period" "$@"
}

delTTL() {
	FLG="0"
	exst=$(cat /etc/ttl.user | grep "#startTTL$CURRMODEM")
	if [ ! -z "$exst" ]; then
		cp /etc/ttl.user /etc/ttl.user.bk
		sed -i -e "s!iptables -t mangle -I POSTROUTING -o $IFACE!iptables -t mangle -D POSTROUTING -o $IFACE!g" /etc/ttl.user.bk
		sed -i -e "s!iptables -t mangle -I PREROUTING -i $IFACE!iptables -t mangle -D PREROUTING -i $IFACE!g" /etc/ttl.user.bk
		sed -i -e "s!ip6tables -t mangle -I POSTROUTING -o $IFACE!iptables -t mangle -D POSTROUTING -o $IFACE!g" /etc/ttl.user.bk
		sed -i -e "s!ip6tables -t mangle -I PREROUTING -i $IFACE!iptables -t mangle -D PREROUTING -i $IFACE!g" /etc/ttl.user.bk
		
		rm -f /tmp/ttl.user
		run=0
		while IFS= read -r line; do
			if [ $run = "0" ]; then
				sttl=$line
				stx=$(echo "$sttl" | grep "#startTTL$CURRMODEM")
				if [ ! -z $stx ]; then
					run=1
				fi
			else
				sttl=$line
				stx=$(echo "$sttl" | grep "#endTTL$CURRMODEM")
				if [ ! -z $stx ]; then
					chmod 777 /tmp/ttl.user
					/tmp/ttl.user
					break
				fi
				echo "$sttl" >> /tmp/ttl.user
			fi
		done < /etc/ttl.user.bk
		cp /etc/ttl.user /etc/ttl.user.bk
		
		sed /"#startTTL$CURRMODEM"/,/"#endTTL$CURRMODEM"/d /etc/ttl.user.bk > /etc/ttl.user
		FLG="1"
	fi
}

doTTL() {
	setdel=$1
	CURRMODEM=0
	if [ $CURRMODEM = "0" ]; then
		IFACE="wan"
		TTL="65"
	else
		IFACE=$(uci -q get modem.modem$CURRMODEM.interface)
		TTL=$(uci -q get modem.modeminfo$CURRMODEM.ttl)
	fi
	delTTL
	if [ "$TTL" = "0" -o "$TTL" = "1" -o "$setdel" = "0" ]; then
		log "Deleted TTL"
		#/etc/init.d/firewall restart
		return
	fi
	VALUE="$TTL"
	echo "#startTTL$CURRMODEM" >> /etc/ttl.user
	log "Setting TTL $VALUE on interface $IFACE"
	if [ "$TTL" = "TTL-INC 1" ]; then
		TTL="0"
	fi
	if [ $VALUE = "0" ]; then
		echo "iptables -t mangle -I POSTROUTING -o $IFACE -j TTL --ttl-inc 1" >> /etc/ttl.user
		echo "iptables -t mangle -I PREROUTING -i $IFACE -j TTL --ttl-inc 1" >> /etc/ttl.user
		iptables -t mangle -I POSTROUTING -o $IFACE -j TTL --ttl-inc 1
		iptables -t mangle -I PREROUTING -i $IFACE -j TTL --ttl-inc 1
		if [ -e /usr/sbin/ip6tables ]; then
			echo "ip6tables -t mangle -I POSTROUTING -o $IFACE -j HL --hl-inc 1" >> /etc/ttl.user
			echo "ip6tables -t mangle -I PREROUTING -i $IFACE -j HL --hl-inc 1" >> /etc/ttl.user
			ip6tables -t mangle -I POSTROUTING -o $IFACE -j HL --hl-inc 1
			ip6tables -t mangle -I PREROUTING -i $IFACE -j HL --hl-inc 1
		fi
	else
		echo "iptables -t mangle -I POSTROUTING -o $IFACE -j TTL --ttl-set $VALUE" >> /etc/ttl.user
		echo "iptables -t mangle -I PREROUTING -i $IFACE -j TTL --ttl-set $VALUE" >> /etc/ttl.user
		log "iptables1"
		iptables -t mangle -I POSTROUTING -o $IFACE -j TTL --ttl-set $VALUE
		iptables -t mangle -I PREROUTING -i $IFACE -j TTL --ttl-set $VALUE
		if [ -e /usr/sbin/ip6tables ]; then
			log "iptables6"
			echo "ip6tables -t mangle -I POSTROUTING -o $IFACE -j HL --hl-set $VALUE" >> /etc/ttl.user
			echo "ip6tables -t mangle -I PREROUTING -i $IFACE -j HL --hl-set $VALUE" >> /etc/ttl.user
			ip6tables -t mangle -I POSTROUTING -o $IFACE -j HL --hl-set $VALUE
			ip6tables -t mangle -I PREROUTING -i $IFACE -j HL --hl-set $VALUE
		fi
	fi
	echo "#endTTL$CURRMODEM" >> /etc/ttl.user
	#/etc/init.d/firewall restart
}

amt=$1
enb=$(uci -q get ttl.hotspot.enable)
max=$(uci -q get ttl.hotspot.amt)
tot=$(uci -q get ttl.hotspot.total)
if [ "$enb" = "1" ]; then
	/usr/lib/bwmon/ttlwork.lua cmp $tot $max
	if [ -e /tmp/ttlcmp ]; then
		if [ ! -e /tmp/periodcnt ]; then
			echo 'PCNT="'"0"'"' > /tmp/periodcnt
		fi
		source /tmp/periodcnt
		if [ $PCNT -ge 5 ]; then
			if [ $PCNT -ge 6 ]; then
				echo 'PCNT="'"0"'"' > /tmp/periodcnt
				/usr/lib/bwmon/ttlwork.lua add $tot $amt
				source /tmp/ttlvar
				log "Set TTL Hotspot amount $TOTALVAR $amt"
				uci set ttl.hotspot.total=$TOTALVAR
				uci commit ttl
				#doTTL 1
			else
				log "Delete TTL"
				#doTTL 0
				let PCNT=PCNT+1
				echo 'PCNT="'"$PCNT"'"' > /tmp/periodcnt
			fi
		else
			let PCNT=PCNT+1
			echo 'PCNT="'"$PCNT"'"' > /tmp/periodcnt
		fi
	fi
fi
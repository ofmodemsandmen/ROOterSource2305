#!/bin/sh 

log() {
	modlog "TTL Settings $CURRMODEM" "$@"
}

delTTL() {
	cp /etc/firewall.user /etc/ttl.user.bk
	sed /"#startTTL$CURRMODEM"/,/"#endTTL$CURRMODEM"/d /etc/ttl.user.bk > /etc/firewall.user
}

CURRMODEM=$1
TTL="$2"
TTLOPTION="$3"

if [ $CURRMODEM = "0" ]; then
	IFACE="wan"
else
	IFACE=$(uci -q get modem.modem$CURRMODEM.interface)
fi

if [ "$TTL" = "0" ]; then
	ENB=$(uci -q get ttl.ttl.enabled)
	if [ $ENB = "1" ]; then
		TTL=$(uci -q get ttl.ttl.value)
		if [ -z "$TTL" ]; then
			TTL=65
		fi
	else
		delTTL
		log "Deleting TTL on interface $IFACE"
		/etc/init.d/firewall restart
		exit 0
	fi
fi

if [ "$TTL" = "1" ]; then
	delTTL
	log "Deleting TTL on interface $IFACE"
	/etc/init.d/firewall restart
	exit 0
fi

delTTL
log "Setting TTL $TTL on interface $IFACE"
echo "#startTTL$CURRMODEM" >> /etc/firewall.user
if [ "$TTL" = "TTL-INC 1" ]; then
	TTLOPTION="0"
	TTL=64
fi


	if [ "$TTLOPTION" = "0" ]; then
		echo "nft add rule inet fw4 mangle_postrouting oifname $IFACE ip ttl set $TTL" >> /etc/firewall.user
		echo "nft add rule inet fw4 mangle_postrouting oifname $IFACE ip6 hoplimit set $TTL" >> /etc/firewall.user
		echo "nft add rule inet fw4 mangle_prerouting oifname $IFACE ip ttl set $TTL" >> /etc/firewall.user
		echo "nft add rule inet fw4 mangle_prerouting oifname $IFACE ip6 hoplimit set $TTL" >> /etc/firewall.user
	else
		if [ "$TTLOPTION" = "1" ]; then
			echo "nft add rule inet fw4 mangle_postrouting oifname $IFACE ip ttl set $TTL" >> /etc/firewall.user
			echo "nft add rule inet fw4 mangle_postrouting oifname $IFACE ip6 hoplimit set $TTL" >> /etc/firewall.user
		else
			echo "nft add rule inet fw4 mangle_postrouting protocol icmp oifname $IFACE ip ttl set $TTL" >> /etc/firewall.user
			echo "nft add rule inet fw4 mangle_postrouting protocol icmp oifname $IFACE ip6 hoplimit set $TTL" >> /etc/firewall.user
		fi
	fi
echo "#endTTL$CURRMODEM" >> /etc/firewall.user
/etc/init.d/firewall restart





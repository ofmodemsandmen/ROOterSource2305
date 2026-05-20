#!/bin/sh 

CURRMODEM=$1

IFACE=$(uci -q get modem.modem$CURRMODEM.interface)
# IFB
modprobe ifb 2>/dev/null
ip link add ifb0 type ifb 2>/dev/null
ip link set ifb0 up

# Clear any existing qdiscs
tc qdisc del dev "$IFACE" root    2>/dev/null
tc qdisc del dev "$IFACE" ingress 2>/dev/null
tc qdisc del dev ifb0 root        2>/dev/null
	
# CAKE uplink
tc qdisc add dev "$IFACE" root handle 1: \
	cake unlimited diffserv4 nat nowash split-gso 2>/dev/null

# CAKE ingress mirror
tc qdisc add dev "$IFACE" handle ffff: ingress 2>/dev/null
tc filter add dev "$IFACE" parent ffff: protocol all \
	u32 match u32 0 0 action mirred egress redirect dev ifb0 2>/dev/null

# CAKE downlink
tc qdisc add dev ifb0 root handle 1: \
	cake unlimited diffserv4 nat ingress 2>/dev/null
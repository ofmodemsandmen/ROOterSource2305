#!/bin/sh
. /lib/functions.sh

set=$1

uci set restart.info.time=$set
uci commit restart
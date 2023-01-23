#!/bin/bash

clear
echo "Service Check Script - starting"

SSHUSER="sushilkumar"
HOST1="192.168.56.101"

echo "Connecting to HOST: $HOST1"
SSHDUMP=`ssh $SSHUSER@$HOST1 "ps -aux | grep -v grep | grep mysqld" || echo "ERROR CONNECTING TO: $HOST1"`
#echo $SSHDUMP

# TEST WHETHER $SSHDUMP VAR is empty

if [ -n "$SSHDUMP" ]; then
	echo "Service is UP on HOST: $HOST1"
else
	echo "Service appears to be DOWN on HOST: $HOST1"
fi

# END





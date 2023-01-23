#!/bin/bash

# filename.sh

# change the base ip address 192.168.56.0 according to your network

for ip in 192.168.56.{1..255}
do
	ping $ip -c 2 &> /dev/null

	if [ $? -eq 0 ]
	then
		echo $ip is alive
	fi
done

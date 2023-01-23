#!/bin/bash

# Descrition : Stub to ensure available memeory for script to execute 

# Parse 'free' output

# Use Command Substitution to extract and store scalar value for free memory
FREEMEM=$(free | grep -i Mem | awk '{ print $4 }')

# Use Command Substitution to extract and store scalar value for free memory
FREESWAP=$(free | grep -i Swap | awk '{ print $4 }')

echo 

# Set MIN FREE mem 1GB Blocks
MINMEM="1000000"


# SET MIN SWAP to - 500MB
MINSWAP="500000"


#echo "Available Memory : $FREEMEM"

if [ "$FREEMEM" -gt "$MINMEM" ]; then
	echo "SUFFICIENT MEMORY: $FREEMEM - IS AVAILABLE"
	echo "WILL CONTINUE PROCESSING"
else
	echo "INSUFFICIENT FREE MEMORY. NEED: $MINMEM - MEMORY"
	exit 200
fi

if [ "$FREESWAP" -gt "$MINSWAP" ]; then
	echo "SUFFICIENT SWAP: $FREESWAP - IS AVAILABLE"
	echo "WILL CONTINUE PROCESSING"
else
	echo "INSUFFICIENT FREE SWAP. NEED: $MINSWAP"
	exit 200
fi

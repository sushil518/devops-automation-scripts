#!/bin/bash


# Parse '/' mount point because: /home & /var are here
# Use Command Substituion to extract and store scalar 
FREEBLOCKS=$(df / | grep '% /' | awk '{ print $3 }')

#SET MIN number of 1k Blocks
MIN="1000000"
# Ensure that MIN number of blocks are available before proceeding with script
if [ "$FREEBLOCKS" -gt "$MIN" ]; then
	echo "Sufficient storage : $FREEBLOCKS exists"
	LOG=df.log
	#Proceed with script
	touch $LOG
	if [ "$?" = "0" ]; then
		echo "LOG File: $LOG: Successfully created"
	else
		echo "ERROR CREATING LOG File: $LOG"
		exit 200
	fi
else
	echo "Insufficient storage exists"
	echo "Only: $FREEBLOCKS Remain"
	echo "This script required: $MIN blocks"
	exit 200
fi

# END



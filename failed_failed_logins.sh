#!/bin/bash


# define source file
LOG=/var/log/auth.log

# Ensure Proper # of CLI ARGS
# Force MIN # of args

if [ "$#" -lt "1" ]; then
        echo "usage: $0 ARG1"
        echo "$0 Requires at Least 1 Argument"
        exit 200

fi


# Defne $USER
if [ -n "$1" ]; then
	USR="$1"
	# Initialize MATCH VAR
	MATCH="0"

	#Iterate through List of users: 
	for i in `awk -F : '{ print $1}' /etc/passwd`; do
		if [ "$i" = "$USR" ]; then
			MATCH="1" 
		fi
	done
	
	# If there is A Match - Continue
	if [ "$MATCH" = "0" ]; then
		echo "USER: $USR DOES NOT EXIST ON THIS SYSTEM - EXITING"
		exit 200
	fi
	
fi
# Define search message
MESSAGE="Failed password for $USR"

# Parse source file for records
# echo $MESSAGE
RECORDS=`grep -i "$MESSAGE" $LOG` || echo "No Records Found for User: $USR"
if [ -n "$RECORDS" ]; then
	echo "$RECORDS"
fi

# EMAIL RESULT
MAILTO="root@localhost"
sendmail -bm $MAILTO < $LOG
if [ "$?" = "0" ]; then
	# DUMP STDOUT
	echo "MAIL SENT TO: $MAILTO"
else
	echo "ERROR SENDING MAIL TO: $MAILTO"
fi

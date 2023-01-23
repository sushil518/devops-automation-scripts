#!/bin/bash


# define source file
LOG=/var/log/auth.log

# Ensure Proper # of CLI ARGS
# Force MIN # of args

if [ "$#" -lt "0" ]; then
        echo "usage: $0 ARG1"
        echo "$0 Requires at Least 1 Argument"
        exit 200

fi

COREDIR="/var"
LOG="$0.log"
LOG2=`basename $0`.log

echo "LOG2: $LOG2"

for i in $(find $COREDIR -name '*coredump'); do
	#DUMP CURRENT FILE
	echo "LOCATED FILE: $i"

	# DEFINE MESSAGE
	MESSAGE="`date +%F` - $i - HAS BEEN DELETED"

	# EXECUTE REMOVAL

	if [ "$?" = "0" ]; then
		echo "FILE: $i - EXISTS"
		rm -rf $i
		if [ "$?" = "0" ]; then
			# DUMP TO STDOUT
			echo "$MESSAGE"

			#DUMP TO $LOG
			echo "$MESSAGE"  >> $LOG
		fi
	fi


done


# END

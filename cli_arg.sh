#!/bin/bash

# clear screen
clear

# Force MIN # of args

if [ "$#" -lt "1" ]; then
	echo "usage: $0 ARG1"
	echo "$0 Requires at Least 1 ARgument"
	exit 200
	
fi

# Exit script if the $1 is outside of the permitted range

if ! [ "$1" -ge "1" -a "$1" -le "10" ]; then
	echo "$1 is outside the permitted range"
	exit 200

fi 
# Dump number of CLI arguments
echo "NUmber of CLI Arguments: $#"
echo "Script Name: $0"
echo "First Argument: $1"

# END

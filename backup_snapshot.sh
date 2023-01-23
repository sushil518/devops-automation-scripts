#!/bin/bash


# Ensure sufficient 

. backup_parse_df_storage.sh

# Define content to Backup

SRC="/home/sushilkumar/shell-scripting/cbt-bash"
DST="/home/sushilkumar"

# Define Backup Files VARs

# 1st Stage Tar Backup File
BFILETAR=`date +%F`.backup.tar

# 2nd Stage BZ2 Backup File
BFILEBZ2=`date +%F`.backup.tar.bz2

# 3rd Stage Tar Bz2-GPG - Backup File compression and encryption
BFILEGPG=$BFILEBZ2.gpg

# Define Backup Command
BCMD="tar -cjvf $DST/$BFILEBZ2 $SRC"

# Define Backup Condition that will use Current BFILEBZ2 if necessary

if ! [ -f "$DST/$BFILEBZ2" ]; then
	echo "The current BACK FILE: $BFILEBZ2 does NOT EXIST"
	echo "WILL CREATE FILE: $BFILEBZ2"
	$BCMD
	if ! [ "$?" = "0" ]; then
		echo "Error ARCHIVING SOURCE: $SRC TO DEST: $DST/$BFILEBz2"
		exit 200
	fi
else
	echo "THE CURRENT BACKUP FILE: $BFILEBZ2 EXIST"
	echo "WILL REUSE"
	bunzip2 $DST/$BFILEBZ2
	if ![ "$?" = "0" ]; then
		echo "ERROR DECOMPRESSING SOURCE: $SRC TO DEST: $DST/$BFILEBZ2"
		exit 200
	fi
	tar -uvf $DST/$BFILETAR $SRC
	# Execute Backup with update Option
	$BCMD
	# Remove Tar File if BZ2 version was created
	if [ "$?" = "0" ]; then
		echo "REMOVING $BFILETAR"
		rm -rf $DST/$BFILETAR
		if ! [ "$?" = "0" ]; then
			echo "ERROR REMOVING: $DST/$BFILETAR"
		fi
	fi
fi


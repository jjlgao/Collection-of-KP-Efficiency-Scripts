#!/bin/bash
#Expected usage: $ ping.sh servers.txt

FILE=$1

# Delete files if they exist and create temp files.
rm -f ping.txt
touch pingtemp10101.txt

# Ping everything in the input once, and dump the result in the temp file.
while read line; do
	ping -n 1 $line >> pingtemp10101.txt
done < $FILE

# Filter the result so we get one IP address per ping.
 tr ' ' '\n' < pingtemp10101.txt | 
 	grep "Please\|address\|\[[0-9]*\.[0-9]*\.[0-9]*\.[0-9]\]*" | 
 	sed 's:^.\(.*\).$:\1:' > ping.txt

# Make sure that any IP addresses and blanks are accounted for,
# by creating blanks or error messages as appropriate.
sed -i 's/ddres//g' ping.txt
sed -i 's/leas/Error/g' ping.txt

# Display the result on the terminal and delete the temp file.
cat ping.txt
rm pingtemp10101.txt
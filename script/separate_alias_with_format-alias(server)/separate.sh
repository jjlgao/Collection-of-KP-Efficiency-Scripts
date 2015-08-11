#!/bin/bash
#Example expected usage: $ separate.sh servers.txt ".nndc.kp.org"

FILE=$1
TAG=$2

# Delete files if they exist and create temp files.
rm -f sep.txt
touch septemp10101.txt

# Filter the server file for server names.
 tr '(' '\n' < $FILE | 
 	grep ".*)" | 
 	sed 's/)$//' > septemp10101.txt

#Filter the server file for aliases.
tr '(' '\n' < $FILE | 
 	grep -v ".*)" >> septemp10101.txt

#Add on the domain name if applicable; else, add nothing at all.
while read line; do
	if [[ ${#line}>0 ]]; then
		echo $line$TAG >> sep.txt
	else
		echo $line >> sep.txt
	fi
done < septemp10101.txt

# Display the result on the terminal and delete the temp file.
cat sep.txt
rm septemp10101.txt
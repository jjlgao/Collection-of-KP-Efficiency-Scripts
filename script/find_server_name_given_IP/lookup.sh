#!/bin/bash
#Expected usage: $ lookup.sh numbers.txt

FILE=$1

# Delete files if they exist and create new files.
rm -f lookup.txt
touch lookup.txt

# Look up and dump.
while read line; do
	#nslookup $line > lookup2.txt 2>>lookup2.txt
	#grep "Name:\| domain\|can't find\|>\|timed out" lookup2.txt | sed 's/Name:    //' | sed 's/.kp.org\|tent domain\|stent domain\|istent domain\|sistent domain\|nsistent domain\|onsistent domain\|consistent domain\|nconsistent domain\|inconsistent domain\|ent domain\|nt domain\|t domain\|domain/ /' >> lookup3.txt

	ping -a -n 1 $line | head -2 | tail -1 | sed 's:Pinging \|::' | sed 's: \[.*\| with .*::' | sed 's/[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*/ /'>> lookup.txt

done < $FILE

#sed 's/\..*//' lookup3.txt > lookup4.txt
#!/bin/bash
#Expected usage: $ isolate.sh address.txt

FILE=$1

# Delete files if they exist and create new files.
rm -f isolate.txt
touch isolate.txt

# Look up and dump.
sed 's/\..*//' $FILE > isolate.txt

#sed 's/\..*//' lookup3.txt > lookup4.txt
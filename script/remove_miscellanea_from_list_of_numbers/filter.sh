#!/bin/bash
#Expected usage: $ filter.sh numbers.txt

FILE=$1

# Delete files if they exist and create new files.
rm -f filter.txt
touch filter.txt

# Filter and dump.
sed 's/[(].*[)]//g' $FILE > filter4.txt
sed 's/".*\|[^0-9\.]*//g' filter4.txt > filter.txt
rm -f filter4.txt
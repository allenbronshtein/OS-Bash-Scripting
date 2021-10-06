#!/bin/bash
# 206228751 Allen Bronshtein
balance=0
bool=1
while read line; do
	#Iterate all relevant entries
	line=$(echo "$line" | grep -w "$1")
	if [ ! -z "$line" ] ; then
		echo "$line"
		# take out value from line
		value=$(echo "$line" | grep -oP "\s-?\d{4,}")
		let "balance+=value"	
		bool=0
	fi
done < $2
if [ $bool == 0 ] ; then
	echo "Total balance: $balance"
fi

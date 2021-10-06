#!/bin/bash
# 206228751 Allen Bronshtein
row_count=0
#read lines in file
while read line; do
	let "row_count++"
	#read words in line
	for word in $line; do
		#check if word is the string in arguments
		if [ "$word" == "$2" ]; then
			printf "$row_count " ; wc -w <<< $line
		fi
	done
done < $1

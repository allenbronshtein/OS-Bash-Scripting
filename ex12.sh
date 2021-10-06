#!/bin/bash
#206228751 Allen Bronshtein
row_counter=0
files=$(dir "$1")
#iterate through directory files
for item in $files ; do
	#fin is final 4 letter of the file name
	fin="${item: -4}"
	#check if the file is .txt
	if [ "$fin" == ".txt" ]; then
		let "row_counter++"
		echo "$row_counter $item is a file"
	fi
done
for item in $files ; do
	#fin is final 4 letter of the file name
	fin="${item: -4}"
	#check if the file is .txt
	if [ ! "$fin" == ".txt" ]; then
		let "row_counter++"
		echo "$row_counter $item is a directory"
	fi
done

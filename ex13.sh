#!/bin/bash
#206228751 Allen Bronshtein
echo "$1"
my_file_name=$(echo "$2" | cut -f1 -d".")
files1=$(dir "$1")
#sort files
files1=$(echo "$files1" | tr ' ' '\n' | sort | tr ' ' '\n')
#iterate through files
for item in $files1 ; do
	item_name=$(echo $item | cut -f1 -d".")
	#if item is directory
	if [ -d "$1/$item" ] ; then
		files2=$(dir "$1/$item")
		#sort files in new directory
		files2=$(echo "$files2" | tr ' ' '\n' | sort | tr ' ' '\n')
		#run through items in inner directory
		for i in $files2 ; do
			i_name=$(echo $i | cut -f1 -d".")
			if [ ! -d "$1/$item_name/$i" ] && [ "$my_file_name" == "$i_name" ] ; then
				echo "In Directory $1/$item_name, found file named $i , and its content is: "
				cat "$1/$item_name/$i"
			fi
		done
	#item not a directory
	else
		if [ "$item_name" == "$my_file_name" ] ; then
			echo "In Directory: $1, found $item , and its content is: "
			cat "$1/$item"
		fi			
	fi
done



























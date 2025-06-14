#/usr/bin/bash

## make use of for loop

for item in $(ls)
do
	if test -d $item
	then
		echo "$item is a directory." 

	elif test -f $item
	then
		echo "$item is a file."
	fi
done

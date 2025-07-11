#!/usr/bin/bash

while read
do
	echo "$REPLY"
done < "$file"

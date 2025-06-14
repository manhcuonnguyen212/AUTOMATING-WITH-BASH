#!/usr/bin/bash

echo "This bash will extract IP field in log file using 'grep command'"

read -p "Enter the path of log file: " path
matched_targets=$(grep -oE "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" $path)
for ip in $matched_targets
do
	echo $ip
done

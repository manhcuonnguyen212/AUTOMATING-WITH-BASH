#!/usr/bin/bash
##  This script will read an access log file and identifiers IP addresses that have made
## more than 50 requests within a minute. 
## This will help rise potential bot activities

#  Firstly, using grep command to find out ip addreses from access.log file. 
# And then, sorting them
# with sort command. Finally, using uniq -c to extract the number of each ip occured 
log_File_Path="data_Sample/www1/access.log"
ip_Count=$(grep -oE "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" $log_File_Path | sort | uniq -c)
## Turning to while loop
## using read line to read line-by-line from ip_Count variable 
## extract count field and ip field using awk command
## check if there was any ip address had more than 50 requests, rising an alert
while read line; do
count=$(echo $line | awk '{print $1}')
ip=$(echo $line | awk '{print $2}')

	echo $count 
	if [[ $count -gt 50 ]]; then
		echo "Potential bot activity from $ip:$count requests"
	fi
done <<< $ip_Count
# Read from a file            | `while read line; do ...; done < file.txt` |
# Read from a variable/string | `while read line; do ...; done <<< "$str"` |
# Read from command output    | `while read line; do ...; done < <(cmd)`   |

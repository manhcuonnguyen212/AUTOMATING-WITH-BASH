#!/usr/bin/bash

# This bash script will continuously monitor the syslog for any occurrences of the string 
# such as 'CriticalError'. If found, it will trigger an alert and log the event 
echo "This bash script will continuously monitor the syslog for any occurrences of the string" 
echo "such as 'CriticalError'. If found, it will trigger an alert and log the event "

read -p "Enter the path of log file : " path
tail -f "$path" | while read line
# read each line of output of tail commands and store values to the line variable
do 
	if [[ $line == *"ssh"* ]]
	then
		echo "ALERT: Critical error detected - $line ." >> alerts.log
		# Genereate an trigger and write to an alert file.
	fi
done 

#!/usr/bin/bash

## This cript will monitor continuously the syslog for any occurences of the string "CriticalError"
## If found, it will trigger an alert and log the event

syslog_Path="/var/log/syslog"

tail -f $syslog_Path | while read line; do
	if [[ $line == *"CriticalError"* ]]
	then
		echo "ALERT: Critical error detected - $line" >> alerts.log
	fi
done

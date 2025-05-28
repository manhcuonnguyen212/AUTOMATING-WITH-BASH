#!/usr/bin/bash

#automate disabling unused services
services_to_disable=("telnet" "ftp" "rpcbind")

for service in ${services_to_disable[@]}; 
do
	if systemctl list-unit-files | grep -q "^$service.\service";
	then
		echo "Disabling and stopping $service..."
		systemctl disable $service
		systemctl stop $service
	else
		echo "Service $service not found, skipping."
	fi
done

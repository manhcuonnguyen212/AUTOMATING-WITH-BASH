#!/usr/bin/bash

## This script will collect automaticallly system infor like syslog, network confs, and important files
## when incidents are detected, storing them in a predefined directory
incident_Dir="/incident_Data"

echo "Incident detected. Collecting data..."
sudo mkdir -p $incident_Dir/logs

sudo cp -R /var/log* $incident_Dir/logs
sudo cp -R /etc/network/* $incident_Dir/
sudo cp /etc/passwd $incident_Dir/

timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
echo "Icident report generated on $timestamp"
sudo echo "Icident report generated on $timestamp" >> $incident_Dir/timestamp.txt
echo "Data collected and stored in $incident_Dir"

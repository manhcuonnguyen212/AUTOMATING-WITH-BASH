#!/usr/bin/bash

## capture network traffic and analyze it to detect anomaly activities such as a huge connections from a IP address 
## using tcpdump

## path where storing the pcap file.
path=$1
## get the interface 
interface=$2
## the maximum connection attempts.
threshold=50

## capture network traffic
tcpdump -i $interface -w $path

## analyze traffic and detect anomalies
high_traffic_ip= $(tcpdump -r $path ) 

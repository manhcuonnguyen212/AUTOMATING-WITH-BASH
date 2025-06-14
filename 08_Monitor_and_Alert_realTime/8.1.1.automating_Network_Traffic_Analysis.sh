#!/bin/bash

#Automate network traffic capture with 'tcpdump'
read -p "Enter the network interface that is captured: " interface
tcpdump -i "$interface" -w "captured_Traffic.pcap"

#!/usr/bin/bash

## using tcpdump to moitor the network traffic on a specific interface and redirect data to a file 
interface=$1
path=$2
tcpdump -i $interface -w $path 

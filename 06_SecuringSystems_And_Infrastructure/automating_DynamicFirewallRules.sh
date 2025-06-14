#!/usr/bin/bash

## using bash to block traffic from the specific ip 
## using iptables tool

target_IP=$1 # take an argument from cmd
iptables -A INPUT --source $target_IP --jump DROP

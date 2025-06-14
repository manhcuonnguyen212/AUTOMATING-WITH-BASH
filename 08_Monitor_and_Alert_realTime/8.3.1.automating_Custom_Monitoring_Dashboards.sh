#!/bin/bash

# This bash script can automate the creation of custom monitoring dashboards that 
# check real-time data from various resources.

# check cpu usage
while true
do
echo "------------------$(date +"%Y-%m-%d_%H-%M-%S")------------------"
cpu_usage=$(sar -u 1 1 | awk 'END{print 100 - $NF}')
## using sar -u 1 1 commands to get cpu infor.
## In which , -u indicates that cpu statistics
## 1: interval 	and 1: count	
## awk command : is used to get the percentage of CPU usage by calculating 100 minus the last field,$idle,which indicates
## that cpu doens't use any process.				
memory_usage=$(free -h | grep Mem | awk '{print $3}')
network_traffic_IN=$(ifstat -t 1 1 | grep -E "[0-9]{2}\:[0-9]{2}\:[0-9]{2}" | awk '{print $2}')
network_traffic_OUT=$(ifstat -t 1 1 | grep -E "[0-9]{2}\:[0-9]{2}\:[0-9]{2}" | awk '{print $3}')
echo "CPU Usage: $cpu_usage%."
echo "Memory Usage: $memory_usage%."
echo "Network Traffic In: $network_traffic_IN kB/s"
echo "Network Traffic Out: $network_traffic_OUT kB/s"
printf "\n"
sleep 2
done

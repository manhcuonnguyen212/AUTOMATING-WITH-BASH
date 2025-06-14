#!/usr/bin/bash

# This script can automate the execution of continuous monitoring that regularly check for
# specific conditions and provide insights into activities

# using while True to repeat the task

while true
do
	process_count=$(ps aux | wc -l)
	process_count=$(($process_count - 1))
	echo "$(date +"%Y-%m-%d_%H-%M-%S"): current process count: $process_count"
	sleep 1
done

#!/usr/bin/bash
# Automate setting CPU usage alerting threshold
threshold=5
current_cpu_usage=$(sar -u 1 1 | awk 'END{print 100-$8}')
signal=$(echo $current_cpu_usage | bc -l)
if [ signal ]
then
	echo "High CPU usage detected! Alerting admin."
fi


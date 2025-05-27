#!/usr/bin/bash
matched_targets=$(grep -oE "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" data_Sample/www1/access.log)
for ip in $matched_targets
do
	echo $ip
done

#!/usr/bin/bash
matched_targets=$(grep -oE "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" tutorialdata/www1/access.log)
for ip in $matched_targets
do
	echo $ip
done

#/usr/bin/bash
# This bash will search a pattern in a specific file
read -p "Enter a pattern such as 'apache','Unauthorized access',...: " pattern
read -p "Enter the path of log file: " path
count=0
count=$(grep -c -i "$pattern" $path)
echo "'$pattern' word appears $count times in $path file"


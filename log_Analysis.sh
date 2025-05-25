#/usr/bin/bash

count=$(grep -c "apache" $Path)
echo "'apache' word appears $count times in $Path file"


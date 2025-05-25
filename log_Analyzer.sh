#/usr/bin/bash
file="/var/log/kern.log"
error_count=0
warning_count=0
error_count=$(grep -i -c "error" $file)
warning_count=$(grep -i - "warning" $file)
echo "Error appears $error_count times in $file"
echo "Warning appears $warning_count times in $file"


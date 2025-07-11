#/bin/bash
min_Mem_Threshold=100 # 100 Mb
hold_time=3
# check the input of users
if [[ ${#1} -gt 0 ]]
then
	echo "[-]Invalid syntax."
	echo "[+]Usage: ./$0"
	exit 1
fi

function memory_util(){
	# Gathering infor about Available memory, Free memory, Memory used in percentage
buffer_cach=$(free -m  | awk '{if(/Mem:/){print $(NF-1)}}')
free=$(free -m  | awk '{if(/Mem:/){print $(NF-3)}}')
total=$(free -m  | awk '{if(/Mem:/){print $2}}')
available=$(free -m  | awk '{if(/Mem:/){print $(NF)}}')
memory_Used=$((total-available))
mem_Usage_Percent=$(bc<<< "scale=2;$memory_Used*100/$total")
  echo -e "........................................\nMEMORY UTILIZATION\n"
  echo -e "Total Memory\t\t:$total MB"
  echo -e "Available Memory\t:$available MB"
  echo -e "Buffer+Cache Memory\t:$buffer_cach MB"
  echo -e "Free Memory\t\t:$free MB"
  echo -e "Memory Usage Percentage\t:$mem_Usage_Percent %"

 # check if available Mem is too low -> print warning
	if [[ $available -lt $min_Mem_Threshold ]]
	then
		echo "Available Memory is too low!"
		echo "Unhealthy Memory!"
	elif dmesg | grep -i "omm-killer" >> /dev/null ;then
		echo "System is critically low on memory!"
	else
		echo -e "\nMEMORY OK\n"
	fi

}

function cpu_util()
{
	# number of processors installed 
	cores=$(nproc)
	idle=$(sar -u 1 1 | awk 'BEGIN{r=@/^Average/};{if($0~r){print $NF}}')
	echo -e "........................................\nCPU UTILIZATION\n"
	echo -e "Number of Cores\t:$cores\n"
	echo -e "Average of idle time:\t$idle\n"

}
function disk_util()
{
	  ROOT_DISK_USED=$(df -h | grep -w '/' | awk '{print $5}')
	  ROOT_DISK_USED=$(printf %s "$ROOT_DISK_USED" | tr -d [="%"=])
	  ROOT_DISK_AVAIL=$(( 100 - $ROOT_DISK_USED ))
	  echo -e "........................................\nDISK UTILIZATION\n"
	  echo -e "Root(/) Used\t\t:$ROOT_DISK_USED%"
	  echo -e "Root(/) Available\t:$ROOT_DISK_AVAIL%\n"
	  #print warning if any of the disk is used above 95%
  	if [[ $ROOT_DISK_USED -ge 95 ]] ; then
	    echo -e "\nDisk is almost full! Free up some space!"
	  else
	    echo -e "\nDISK OK"
	  fi
}
# main function
main(){
while [[ 1 -gt 0 ]]
do
	memory_util
	cpu_util
	disk_util

	sleep $hold_time
	clear
done
}
main



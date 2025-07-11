#!/usr/bin/bash

echo "__________===__________"
read -p "[+]Enter the name of package: " var
if [[ ${#var} -eq 0 ]]
then
	echo "[+]Usage: $0 pakage_name"
	exit 1
fi
check=$(apt list --installed | grep $var >> /dev/null) 
echo "$check"
if [[ $check == *not* ]]
then
	echo "[-] $check"
	apt install $var
	echo "[+]Install $var successfully!"
	exit 1
else
	echo "[+] $check"
	exit 0
fi


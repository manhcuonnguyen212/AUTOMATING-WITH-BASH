#/usr/bin/bash

echo "$0 will perform simple math operations"
read -p "Enter the first number:" first
read -p "Enter the second number:" second
read -p "Enter the operator + - * /:" operator
result=0
if [ "$operator"=="+" ];then
	result=$((first+second))
elif [ "$operator"=="-" ]
then 	
	result=$((first-second))
elif [ "$operator"=="*" ]
then 
	result=$((first*second))
elif [ "$operator"=="/" ]
then
	result=$((first/second))
else
	echo "Invalid operator."
	exit 1
fi
echo "Result: $result"



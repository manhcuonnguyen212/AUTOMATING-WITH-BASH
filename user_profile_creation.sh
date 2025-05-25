#!/usr/bin/bash

## get current directory working
program_Name=$0
echo -e "-----Welcome to our system----- "
echo -e "$program_Name will initialize your profile"
read -p "Enter your name: " username
## make a profile file
`touch $username.txt`
echo $username>>$username.txt
read -p "Enter your age: " age
echo $age>>$username.txt
read -p "Enter your email address: " email_Add
echo $email_Add>>$username.txt
echo "user infor has been created in $username.txt"

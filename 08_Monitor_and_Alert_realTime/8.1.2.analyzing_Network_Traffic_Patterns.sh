#/bin/bash
# Automate detection of excessive failed login attempts
read -p "Enter the pattern such as Failed password: " pattern
read -p "Enter the path of pcap file: " path
tcpdump -r $path | grep "$pattern" | awk '{print $2}'| sort

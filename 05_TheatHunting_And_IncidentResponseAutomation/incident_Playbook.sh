#!/usr/bin/bash
## This bash will present a menu of icident types and, user selection, automates the execution of 
## predefined playbook steps for that incident type
echo "Select incident type:"
select incident_type in "malware_infection" "data_breach" "unauthorized_access" "other"; do
	case $incident_type in
		"malware_infection")
			echo "Isolate system, collect data, scan for malware, perform cleanup."
			echo "grep -r "suspicious_pattern" /var/log"
			echo "strace -p PID -o /incident_data/process_trace.txt	"
			echo "iptables -A INPUT -s compromised_IP -j DROP"
				;;
		"data_breach")
			echo "Notify affected parties, review logs, initiative forensic analysis."
				;;
		"unauthorized_access")
			echo "Isolate system, review logs, change passwords, initiative investigation."
				;;
		"other")
			echo "Perform appropriate actions based on incident type."
				;;
		esac 
	break
done

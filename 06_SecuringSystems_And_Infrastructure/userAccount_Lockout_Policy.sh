#!/usr/bin/bash

# the password rules file
config_file="/etc/security/pwquality.conf"
# the authentication rule file
lockout_file="/etc/security/faillock.conf"

echo "minlen = 12" >> $config_file
echo "maxretry = 5" >> $lockout_file
echo "deny = 5 " >> $lockout_file
echo "unlock_time = 600 " >> $lockout_file

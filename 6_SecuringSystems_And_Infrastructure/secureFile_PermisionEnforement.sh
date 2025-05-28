#!/usr/bin/bash
target_directory=$1
target_files=$2
find $target_directory -type d -exec chmod 755 {} \;
find $target_directory -type f -name $target_files -exec chmod 644 {} \;

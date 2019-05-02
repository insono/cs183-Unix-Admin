#!/bin/bash

echo "Finding all files in bin, sbin, usr/bin, and usr/sbin that are setuid and owned by root"
read -p "Hit enter to continue."
find /bin /sbin /usr/bin /usr/sbin -perm /4000 -user root
#these files are potential security risks because if someone with malicious intent gained access to these files, they could execute files in the name of root

echo "Find all files across the entire system that have setuid or setgid enabled"
read -p "Hit enter to continue."
find / -perm /u=s,g=s

echo "Find all files in /var that have changed in the last 20 minutes."
read -p "Hit enter to continue."
find /var -cmin -20

echo "Find all files in /var that are reg files of zero length."
read -p "Hit enter to continue."
find /var -type f -size 0

echo "Find all files in /dev that are not regular files and not directories"
read -p "Hit enter to continue."
find /dev ! -type f ! -type d | xargs ls -l

echo "Find all directories in /home not owned by root and change permissions to 711"
read -p "Hit enter to continue."
find /home -type d ! -user root | xargs chmod -v 711

echo "Find all regular files in /home that are not owned by root and changed permissions to 755"
read -p "Hit enter to continue."
find /home -type f ! -user root | xargs chmod -v 755

echo "Find all files of all types in /etc that have changed in the last 5 days/"
read -p "Hit enter to continue."
find /etc -ctime -5

#!/bin/sh

[ -e "temp.txt" ] && echo "$(date) temp.txt file exists" >> /var/log/cs183/uptime.log || echo "$(date) temp.txt file not found" >> /var/log/cs183/uptime.log

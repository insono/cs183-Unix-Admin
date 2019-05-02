#!/bin/bash

userLogin=$(cat /etc/passwd | awk -F ":" '{print $1}')

for USER in $userLogin
do
	echo "$USER `id -u $USER` `id -Gn $USER`"
done

#!/bin/bash

printf "gateway: "; ip route | grep default | awk '{print $3}'
device=$(ip route | grep default | awk '{print $5}')
printf "netmask: "; ifconfig $device | awk '/netmask/{print $4}'
printf "device: $device\n"

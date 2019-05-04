#!/bin/bash

#<command> - <short description>
#<what command is doing>
<command>

# dd - purpose is to convert & copy files
# this command is copying backing up the disk for me and converting it into a disk image
dd if=/dev/sda of=~/diskTest.img

# find - purpose is to find files
# this line will find all shell scripts and print their permission details
find ../labs/ -name '*.sh' | xargs ls -l >> hw2.sh

# file - used to determine file type
# this will look inside compressed files
file -z labs.tar.gz

# fuser - finds which process is using a file/directory/socket/etc.
# this will find which processes are accessing the specified file
fuser -v -m temp.txt

# grep - searches inside a file
# this will ignore case and find all that match the string: magic
grep -i "magic" temp.txt

# host - used to perform DNS lookup
# this will find out the ip address of google.com
host google.com

# ldd - used to find the shared library dependencies of an executable or shared a library
# this will show dependencies of the copy command
ldd -v /bin/cp

# lsof - lists all open files
# this will display all opened files of root
lsof -u root

# mount - attaches file systems and removable devices
# this will mount the usb to my /media/usbs directory
sudo mount /dev/sdd1 /media/usb 

# ps - prints a list of currently running processes
# prints all running processes
ps -A

# pkill - kills processes based on name
# this will kill the crond process
pkill crond

# netstat - used for monitoring network connections
# this will show statistics by protocol
netstat -s

# renice - used for chaning priority of running processes
# changes priority of systemd which has a pid of 1
renice -n -5 -p 1

# rsync - used for copying/synchronizing files & directories remotely
# will sync files from one directory to another directory of the same computer
rsync -avzh /labs /backups/

# time - used to execute a command and printes summy of real time, user cpu time, and system time
# this will see how long it takes to execute the ls -l command
time ls -l

# ssh - used to securely connect to a remote server/system
# logining into the ucr bolt server
ssh ayuan003@bolt.cs.ucr.edu

# stat - used to view file/file system status
# viewing the status of the hw2.sh file
stat -f hw2.sh

# strace - used for debugging/troubleshooting by recording all system calls made by a process and th signals recieved by the process
# traces the systemd process using its pid
sudo strace -p 1

# uname - prints system information
# prints kernel version
uname -v

# wget - used for downloading files from server even when user isnt logged on or in the background
# downloads the google.com webpage in the background
wget -b google.com

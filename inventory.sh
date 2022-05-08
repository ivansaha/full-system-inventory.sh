#!/bin/bash

# Scritp written by Ivan Saha
# Email sahaivan89@gmail.com
# 05/07/2022
# This sript will be use to do a full inventory of a server
# Feel free to reach out if you have any suggestion

echo "This script will automatically display the full inventory of your system"
sleep 1

echo "The OS running and the version are :"
cat /etc/*release | head -3
sleep 1

echo "This total size memory is:"
free -m | grep Mem | awk -F" " '{print $2}'

echo "The size of hardrive is :"
lsblk | grep sda | awk -F" " '{print $4}' | head -1
sleep 1

echo "The cpu speed is:"
cat /proc/cpuinfo | grep MHz
sleep 1

echo "The kernel version is :"
uname -r | awk -F"x" '{print $1}'
sleep 1

echo "The system bits is :"
arch
sleep 1

echo "The hostname is :"
echo $HOSTNAME
sleep 1

echo "The ipaddress is :"
ifconfig | grep inet | head -3 | tail -1 | awk -F" " '{print $2}'
sleep 1

echo "Here is the list of all opened ports :"
lsof -i -P -n | grep LISTEN
sleep 1

echo "Display DNS"
cat /etc/resolv.conf | grep nameserver
sleep 1

echo "The equipment manufacturer"
dmidecode | grep Vendor | awk -F" " '{print $2}'
sleep 1

echo "What type of system it is :"
dmidecode | grep Family | awk -F":" '{print $2}'
sleep 1

echo "The mac address is :"
ip address show dev enp0s3 |grep ether | awk '{print$2}'
sleep 1
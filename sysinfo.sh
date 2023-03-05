#!/bin/bash
#System Information Script by Nicholas Marchand
echo "SYSTEM INFORMATION"
echo
echo "Current User @ Hostname: $(whoami)@$(hostname -s)"
echo
echo "CPU Name and Speed:"
lscpu | grep name
lscpu | grep MHz
echo
#These send results of free through grep and truncate spaces to use as delimiter for cut fields
echo "Free Memory: $(free -h | grep Mem | tr -s ' ' | cut -d ' ' -f 4)"
echo "Total Memory: $(free -h | grep Mem | tr -s ' ' | cut -d ' ' -f 2)"
echo "Free Swap Space: $(free -h | grep Swap | tr -s ' ' | cut -d ' ' -f 4)"
echo "Total Swap Space: $(free -h | grep Swap | tr -s ' ' | cut -d ' ' -f 2)"
echo
#sed changes avail and size to free and total to match message
echo "Free and Total Space on ext4 Partitions: "
df -ht ext4 --output=source,avail,size | sed 's/Avail/Free/g' | sed 's/Size/Total/g'
echo
echo "Free and Total Space on xfs Partitions: "
df -ht xfs --output=source,avail,size | sed 's/Avail/Free/g' | sed 's/Size/Total/g'
echo
echo "Current IP Address and Subnet Mask: "
#sed changes inet and netmask to IP_Address and Subnet_Mask
ifconfig | grep 'inet ' | sed 's/inet/IP_Address:/g' | sed 's/netmask/Subnet_Mask:/g' | tr -s ' ' | cut -d ' ' -f 2-5
exit 0

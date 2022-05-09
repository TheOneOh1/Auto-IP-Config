#!/bin/bash

function showip(){
ifconfig ens33 | grep "inet " | awk -F" " '{print "Current IP : " $2 }'
ifconfig virbr0 | grep inet | awk -F" " '{print "Gateway    : " $2}'
echo -e "DNS        : $dns"
}


echo -e "\n-------------------------------\n"
read -p "Enter new IP	: " ip
read -p "Enter Netmask	: " netmask
read -p "Enter DNS	: " dns

echo "$(ifconfig ens33 $ip netmask $netmask)"
echo "$(echo nameserver $dns > /etc/resolv.conf)"

echo -e "-------------------------------\n"
showip
echo -e "-------------------------------\n"

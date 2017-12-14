#!/bin/bash
CURRENT_HOSTNAME=`cat /etc/hostname | tr -d " \t\n\r"`
NEW_HOSTNAME=$(</boot/script/hostname.txt)
echo "Applying new hostname:"
echo "$NEW_HOSTNAME"
echo ${NEW_HOSTNAME} > /etc/hostname
sed -i "s/127.0.1.1.*$CURRENT_HOSTNAME/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
rm -rf /boot/script/hostname.txt
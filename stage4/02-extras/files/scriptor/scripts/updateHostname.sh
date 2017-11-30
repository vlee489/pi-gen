#!/bin/bash
RED='\033[0;31m'
BLUE='\033[1;36m'
NC='\033[0m' # No Color
USER_HOME=$(eval echo ~${SUDO_USER})

echo "Checking for root access"
sleep 1
if (( $EUID != 0 ));
then
  echo -e "${RED}===================="
  echo -e "Please run as root!"
  echo -e "====================${NC}"
  exit
else
# update Hostname
  CURRENT_HOSTNAME=`cat /etc/hostname | tr -d " \t\n\r"`
  NEW_HOSTNAME=$(</boot/script/hostname.txt)
  echo "Applying new hostname:"
  echo "$NEW_HOSTNAME"
  echo ${NEW_HOSTNAME} > /etc/hostname
  sed -i "s/127.0.1.1.*$CURRENT_HOSTNAME/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
  rm -rf /boot/script/hostname.txt
fi

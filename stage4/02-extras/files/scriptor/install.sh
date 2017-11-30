#!/bin/bash

if [ "$(id -u)" != "0" ]; then  #Check if script is being run as root
   echo "This script must be run as root" 1>&2
   exit 1
fi

echo "Install Scriptor"
mkdir /boot/script/
idir="/opt/scriptor"
mkdir "$idir"
cp -a scripts/. "$idir/scripts/"
cp -a info/. "/boot/script"
sed -ie '$d' /etc/rc.local
echo 'python3 /opt/scriptor/scripts/main.py' >> /etc/rc.local
echo 'exit 0' >> /etc/rc.local
echo "Install Done!"

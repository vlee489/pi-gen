#!/usr/bin/env bash
# Constants and variables
RED='\033[0;31m'
BLUE='\033[1;36m'
NC='\033[0m' # No Color
USER_HOME=$(eval echo ~${SUDO_USER})

clear
echo "This is made for the NI Raspberry Jam Robotics Course!"
echo "This is the PiBot install script that installs the following"
echo "* Adafruit WebIDE"
#echo "* unicornhat Libaries"
echo ""
echo -e "${BLUE}Your Pi will reboot after the install!${NC}"
echo "Checking for root access"
sleep 1
if (( $EUID != 0 ));
then
  echo -e "${RED}===================="
  echo -e "Please run as root!"
  echo -e "====================${NC}"
  exit
else
#Install adafruit WebIDE
  echo -e "${BLUE}Installing Adafruit WebIDE${NC}"
  sleep 0.5
  cd ${USER_HOME}
  sudo dpkg -i adafruitwebide-0.3.12-Linux.deb
  sudo apt-get -f -y install
  sudo service adafruit-webide.sh start
#Install Unicorn Hat Libaries
#  sudo pip3 install unicornhat
#  sudo pip install unicornhat
#Delete pibot.txt to stop this script being triggered again
  rm -rf /boot/script/pibot.txt
  cd ${USER_HOME}
  rm -rf adafruitwebide-0.3.12-Linux.deb
fi

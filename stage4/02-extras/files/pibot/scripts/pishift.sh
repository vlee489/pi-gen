RED='\033[0;31m'
BLUE='\033[1;36m'
NC='\033[0m' # No Color
USER_HOME=$(eval echo ~${SUDO_USER})

clear
echo "This is made for the NI Raspberry Jam Robotics Course!"
echo "This is the PiBot install script that installs the following"
echo "* PiShift"
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
#Install PiShift
  cd "/home/pi/"
  cd piShift
  sudo ./install.sh
  cd "/home/pi/"
  rm -rf piShift
fi

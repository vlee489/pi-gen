# Import packages
import os
from pathlib import Path

# Variable like script location
pythonLocation = '/boot/script/'
typeNeeded = '.py'
pythonCMD = 'python3'


def pibot():
    pibot_file = Path("/boot/script/pibot.txt")
    # Checks if pibot.txt exists
    if pibot_file.is_file():
        # If yes, executes install script.
        os.system('sudo bash /opt/pibot/scripts/pibot.sh')
    else:
        print("No Need to Install PiBot")


def pishift():
    pibot_file = Path("/boot/script/pishift.txt")
    # Checks if pishift.txt exists
    if pibot_file.is_file():
        # If yes, executes install script.
        os.system('sudo bash /opt/pibot/scripts/pishift.sh')
    else:
        print("No Need to Install piShift")


def pipinstall():
    pip_file = Path("/boot/script/pip.txt")
    # Checks if pip.txt exists
    if pip_file.is_file():
        # If yes, executes install script.
        os.system('sudo bash /opt/pibot/scripts/pipInstall.sh')
    else:
        print('No Need to Install PIP packages')

os.system('sudo bash /opt/pibot/scripts/ntp.sh')
hostname_file = Path("/boot/script/hostname.txt")
if hostname_file.is_file():
    print(Skipping to scriptor)
    exit()
else:
    pipinstall()
    pibot()
    pishift()
    os.system('sudo service adafruit-webide.sh start')
    exit()

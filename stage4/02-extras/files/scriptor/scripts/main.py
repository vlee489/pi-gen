# Import packages
import os
import re
import time
from pathlib import Path

# Variable like script location
pythonLocation = '/boot/script/'
typeNeeded = '.py'
pythonCMD = 'python3'


# Finds the file
def findfile(directory, filetype):
    for file in os.listdir(directory):
        if file.endswith(filetype):
            file = (os.path.join(directory, file))
            print(file)
            return file


# Executes commands with Ifile
def execute(command, file):
    cmd = (command, ' ', file)
    cmd = str(cmd)
    # Removes speech marks and brackets
    cmd = re.sub('[\(\)\{\}\'\"\,<>]', '', cmd)
    print('Running ', cmd)
    # Executes command
    os.system(cmd)


def updatehost():
    hostname_file = Path("/boot/script/hostname.txt")
    # checks if the file to change hostname exists
    if hostname_file.is_file():
        # If file exists executes bash script
        os.system('sudo bash /opt/scriptor/scripts/updateHostname.sh')
        # Reboots to apply new Hostname
        print("Rebooting to apply new hostname")
        time.sleep(5)
        os.system('sudo reboot')
    else:
        print('no Hostname to update')


updatehost()
bashFile = findfile(pythonLocation, '.sh')
execute('bash', bashFile)
time.sleep(1)
pythonFile = findfile(pythonLocation, typeNeeded)
execute(pythonCMD, pythonFile)
exit()

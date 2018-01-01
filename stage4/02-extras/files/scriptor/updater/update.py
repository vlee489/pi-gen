# Import packages
import git
import os
import requests
import socket

# Import variables and constants
onlineRepo = 'https://api.github.com/repos/vlee489/scriptor/git/refs/heads/master'
storageLocation = '/home/pi/.update/scriptor'


# This function obtains the SHAs of the last commits and compares them
def check_git_status(master, slave):
    # Requests the sha of the last commit via the github API
    base_repo = requests.get(master)
    base_repo = base_repo.json()
    # Separates the SHA from the the other nonsense
    base_sha = base_repo["object"]["sha"]
    # Obtains SHA of local Repo
    compare_repo = git.Repo(slave)
    compare_sha = compare_repo.head.object.hexsha
    if compare_sha != base_sha:
        return False
    elif compare_sha == base_sha:
        return True
    else:
        exit(1)


# Check if internet is up via checking if it can assess google's DNS
def internet_check(host="8.8.8.8", port=53):
    try:
        socket.setdefaulttimeout(1)
        socket.socket(socket.AF_INET, socket.SOCK_STREAM).connect((host, port))
        return True
    except Exception as ex:
        pass
    return False


internet = internet_check()
if internet == True:
    check = check_git_status(onlineRepo, storageLocation)
    if check == True:
        os.system('python3 /opt/scriptor/scripts/main.py')
    elif check == False:
        os.system('bash /opt/scriptor/updater/update.sh')
    else:
        os.system('python3 /opt/scriptor/scripts/main.py')
elif internet == False:
    print('No Internet connection, unable to check for scriptor update')
    os.system('python3 /opt/scriptor/scripts/main.py')
else:
    print('Unable to check internet status')
    os.system('python3 /opt/scriptor/scripts/main.py')

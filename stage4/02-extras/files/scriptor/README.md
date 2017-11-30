# Scriptor

## Introduction

This tool allows you to drop a **python** or **bash** script into the boot partition of the Raspberry Pi's SD card.

## Install

```
sudo apt-get update
sudo apt-get install python3 git
git clone https://github.com/vlee489/scriptor.git
cd scriptor
sudo bash install.sh
```

## Usage

To use this too after installing just drop you Python and/or bash script in to the **Script** folder created on the boot partition.
**File names can't have spaces**

**You can only have ONE Python Script and ONE Bash Script in the script folder at once!** Else you might break stuff. *just Delete either one of the files if you run into problems with 2 or more files*

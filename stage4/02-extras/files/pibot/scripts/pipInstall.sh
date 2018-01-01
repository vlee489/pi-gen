#!/usr/bin/env bash
if (( $EUID != 0 ));
then
  echo "Please run as root!"
  exit
else
#Install adafruit WebIDE
  pip3 install gitpython
  pip3 install unicornhat
  pip install unicornhat
  rm -rf /boot/script/pip.txt
fi

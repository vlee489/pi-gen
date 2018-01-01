#!/usr/bin/env bash
idir="/opt/scriptor"
cd "/home/pi/.update/scriptor"
git reset --hard
git pull
rm -rf "$idir/scripts/"
cp -a /home/pi/.update/scriptor/scripts/. "$idir/scripts/"

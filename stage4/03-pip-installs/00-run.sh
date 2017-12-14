#!/bin/bash -e

on_chroot << EOF
pip3 install --upgrade pip
pip install --upgrade pip
pip3 install gitpython
pip3 install unicornhat
pip install unicornhat
EOF

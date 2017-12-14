#!/bin/bash -e

on_chroot << EOF
pip3 install --upgrade pip
pip3 install gitpython
EOF

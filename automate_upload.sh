#!/bin/bash

# Written by Karl Kaiser 06/25/2019
# Last updated by Karl Kaiser 06/25/2019

# Set working directory
cd "$(dirname "$0")"

# Check if the a share file folder exists. If not; create one
if [ ! -d "/mnt/share" ]; then
    mkdir -v /mnt/share
fi

# Execute buildscript
sh ttbuild.sh

# Mount the share file to the aforementioned folder
mount -t cifs -o password=$PASSWORD,username=$USR,vers=1.0 //netfiles00.uvm.edu/CDCshare /mnt/share

# Hold on while drive mounts
sleep 5

# Move output of buildscript to relevant folder in CDCshare
pv out/sys* > /mnt/share/TechRescue/techrescue.iso

# Unmount share folder from /mnt/share
umount /mnt/share

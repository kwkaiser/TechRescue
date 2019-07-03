#!/bin/bash

# Written by Karl Kaiser 06/25/2019
# Last updated by Karl Kaiser 06/25/2019

# Check if the a share file folder exists. If not; create one
if [ ! -d "/mnt/share" ]; then
    mkdir -v /mnt/share
fi

# Execute buildscript
sh ttbuild.sh

# Mount the share file to the aforementioned folder
mount -t cifs -o password=$PASS,username=$USERNAME,vers=1.0 //netfiles00.uvm.edu/CDCshare /mnt/share

# Move output of buildscript to relevant folder in CDCshare
pv out/sys* > /mnt/share/TechRescue/techrescue.iso

# Unmount share folder from /mnt/share
umount /mnt/share

# Clean up / delete itself
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
rm -rf $DIR

#!/bin/bash

# Written by Karl Kaiser 06/25/2019
# Last updated by Karl Kaiser 06/25/2019

# Check if the a share file folder exists. If not; create one
if [ ! -d "/mnt/share" ]; then
    mkdir -v /mnt/share
fi

# Mount the share file to the aforementioned folder
mount -t cifs -o password=$PASSWORD,username=$USERNAME //$ADDRESS /mnt/share

# Execute buildscript
exec ttbuild.sh

# Move output of buildscript to relevant folder in CDCshare
# mv stuff to wherever

# Unmount share folder from /mnt/share



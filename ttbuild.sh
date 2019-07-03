#!/bin/bash

# Written by Karl Kaiser on 06/25/2019
# Last updated by Karl Kaiser on 06/25/2019

# Clone to sysrescue source:
git clone https://gitlab.com/fdupoux/sysresccd-src.git

# Clean up buildscript (line 9 is broke at time of writing)
sed -i 's/"$(<${version_file})"/"$(<"${version_file}")"/g' sysresccd-src/build.sh

# Modify the pacman.conf repos to remove custom repos
sed -i '78,80s/^/#/' sysresccd-src/pacman.conf

# Remove old package list, replace it with custom packages
rm sysresccd-src/packages.x86_64
cp packages.x86_64 sysresccd-src/packages.x86_64

# Make system level modifications to /etc/
cp .bashrc sysresccd-src/airootfs/etc/.bashrc
cp sudoers sysresccd-src/airootfs/etc/sudoers
cp -r NetworkManager sysresccd-src/airootfs/etc/NetworkManager
cp -r lightdm sysresccd-src/airootfs/etc/lightdm
sed -i 's/sysresccd/techrescue/g' sysresccd-src/airootfs/etc/hostname

# Make user folder level modifications in /etc/skel
cp .Xresources sysresccd-src/airootfs/etc/skel/.Xresources
cp -r .config sysresccd-src/airootfs/etc/skel/.config

# Copy background photos into /usr/share
mkdir -pv sysresccd-src/airootfs/usr/share/
cp -r bgphotos/ sysresccd-src/airootfs/usr/share/bgphotos/
cp -r applications/ sysresccd-src/airootfs/usr/share/applications

# Initial root commands:
cat >> sysresccd-src/airootfs/root/customize_airootfs.sh <<\EOF
#
# TECH TEAM MODIFICATIONS BELOW
#

# Systemctl modifications
systemctl enable lightdm.service
systemctl enable NetworkManager
systemctl set-default graphical.target

# User / group modifications
groupadd sudo
useradd -m -G sudo -p $(openssl passwd -1 T3chT34m!) clinic

# Create some default mountpoints
mkdir /mnt/backup
mkdir /mnt/source
mkdir /mnt/windows
mkdir /mnt/macos

#
# END OF TECH TEAM MODIFICATIONS
#

EOF

# Build the iso
sh sysresccd-src/build.sh -v

#!/bin/bash

# use AU mirror
sed -i -e 's|http://archive.ubuntu.com|http://au.archive.ubuntu.com|g' /etc/apt/sources.list

# install the backported kernel
apt-get update
apt-get install -y linux-image-generic-lts-raring linux-headers-generic-lts-raring

# reboot
echo "Rebooting the machine..."
reboot
sleep 60

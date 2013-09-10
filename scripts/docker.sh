#!/bin/bash

# enable memory and swap cgroup
perl -p -i -e 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1"/g'  /etc/default/grub
/usr/sbin/update-grub

# add docker group and add SSH user to it
sudo groupadd docker
for user in vagrant ubuntu; do
  if getent passwd $user > /dev/null; then
    sudo usermod -a -G docker $user
  fi
done

# install curl
apt-get update
apt-get install -y curl

# add the docker gpg key
curl https://get.docker.io/gpg | apt-key add -

# Add the Docker repository to your apt sources list.
echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list

# Update your sources
apt-get update

# Install. Confirm install.
apt-get install -y lxc-docker

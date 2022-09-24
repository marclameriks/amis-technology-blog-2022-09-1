#!/bin/bash
echo "**** Begin installing Podman"

#Set up the repository
##Update the apt package index
sudo apt-get -y update
#Install Podman
sudo apt-get -y install podman

echo "**** End installing Podman"
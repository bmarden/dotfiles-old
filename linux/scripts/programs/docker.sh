#!/bin/bash

sudo apt-get update

# Install packages to allow apt to use a repository over HTTPS:
sudo apt-get install \
apt-transport-https \
ca-certificates \
curl \
gnupg-agent \
software-properties-common

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Verify fingerprint by searching for last 8 chars
sudo apt-key fingerprint 0EBFCD88

# Add stable repo
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
# Install latest version of Docker Engine - Community
sudo apt-get install docker-ce docker-ce-cli containerd.io

# Test
sudo docker run hello-world

# Install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Apply executable permission to binary
sudo chmod +x /usr/local/bin/docker-compose


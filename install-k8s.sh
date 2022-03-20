#!/bin/bash


# 1. Install docker

sudo apt-get update

sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common



curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update ; clear

sudo apt-get install -y docker-ce

sudo echo '{"exec-opts": ["native.cgroupdriver=systemd"]}' > sudo /etc/docker/daemon.json

sudo service docker restart

sudo service docker status 



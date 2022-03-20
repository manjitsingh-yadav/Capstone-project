#!/bin/bash
sudo touch /etc/docker/daemon.json
sudo echo '{"exec-opts": ["native.cgroupdriver=systemd"]}' > /etc/docker/daemon.json

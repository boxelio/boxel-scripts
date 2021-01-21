#!/bin/sh

#
# install-docker.sh
#
# Retrieves and intalls Docker on Ubuntu
#

apt remove docker docker-engine docker.io containerd runc docker-ce docker-ce-cli containerd.io

echo "[BoxOS] Installing Docker"
curl -fsSL https://get.docker.com | sh 2>&1 >> /tmp/boxel-docker-install.log

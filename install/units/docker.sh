#!/bin/sh

#
# install-docker.sh
#
# Retrieves and intalls Docker on Ubuntu
#

echo "[BoxOS] Installing Docker"
curl -fsSL https://get.docker.com | sh 2>&1 >> /tmp/boxel-docker-install.log

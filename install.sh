#!/bin/sh

#
# install.sh
#
# Install everything
#

echo "[BoxOS] Installing Boxel..."
./install-docker.sh
./install-portainer.sh
./install-containers.sh
echo "[BoxOS] Boxel installation complete."

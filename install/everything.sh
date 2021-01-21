#!/bin/sh

#
# install.sh
#
# Install everything
#

echo "[BoxOS] Installing Boxel..."
./units/install-docker.sh
./units/install-portainer.sh
./units/install-containers.sh
echo "[BoxOS] Boxel installation complete."

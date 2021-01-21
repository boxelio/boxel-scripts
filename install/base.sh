#!/bin/sh

#
# base.sh
#
# Install Boxel Base
#

echo "[BoxOS] Installing Boxel Base"
./units/docker.sh
./units/portainer.sh
echo "[BoxOS] Boxel Base installation complete."

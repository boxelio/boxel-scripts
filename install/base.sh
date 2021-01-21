#!/bin/sh

#
# base.sh
#
# Install Boxel Base
#

echo "[BoxOS] Installing Boxel Base"
./install/units/docker.sh
./install/units/portainer.sh
echo "[BoxOS] Boxel Base installation complete."

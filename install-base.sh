#!/bin/sh

#
# install.sh
#
# Install Boxel Base
#

echo "[BoxOS] Cloning boxel-scripts repository"
git clone https://github.com/boxelio/boxel-scripts /tmp/boxel-scripts

echo "[BoxOS] Changing directory to /tmp/boxel-scripts"
cd /tmp/boxel-scripts

echo "[BoxOS] Installing Boxel Base"
./install/units/docker.sh
./install/units/portainer.sh
echo "[BoxOS] Boxel Base installation complete."

echo "[BoxOS] Cleaning up"
cd ~
rm -rf /tmp/boxel-scripts

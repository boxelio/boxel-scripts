#!/bin/sh

#
# install.sh
#
# Install everything
#

echo "[BoxOS] Installing Boxel..."
./install/base.sh
./install/units/containers.sh
echo "[BoxOS] Boxel installation complete."

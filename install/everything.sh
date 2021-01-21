#!/bin/sh

#
# install.sh
#
# Install everything
#

echo "[BoxOS] Installing Boxel..."
./base.sh
./units/containers.sh
echo "[BoxOS] Boxel installation complete."

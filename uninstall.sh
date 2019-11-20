#!/bin/sh

#
# uninstall.sh
#
# Uninstall everything
#

echo "[BoxOS] Uninstalling Boxel..."
./remove-containers.sh
./remove-portainer.sh
./remove-docker.sh
echo "[BoxOS] Boxel uninstallation complete."

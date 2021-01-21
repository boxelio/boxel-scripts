#!/bin/sh

#
# uninstall.sh
#
# Uninstall everything
#

echo "[BoxOS] Uninstalling Boxel..."
../remove/units/containers.sh
../remove/units/portainer.sh
../remove/units/docker.sh
echo "[BoxOS] Boxel uninstallation complete."

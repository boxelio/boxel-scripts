#!/bin/sh

#
# remove-docker.sh
#
# Uninstalls Docker from the system
#

echo "[BoxOS] Removing Docker..."
apt remove -y -qq docker-ce-cli
apt remove -y -qq docker-ce
echo "[BoxOS] Docker removed."

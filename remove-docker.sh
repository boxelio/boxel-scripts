#!/bin/sh

#
# remove-docker.sh
#
# Uninstalls Docker from the system
#

echo "[BoxOS] Removing Docker..."
apt remove -y -qq docker-ce-cli 2>&1 >> /tmp/boxel-extra.log
apt remove -y -qq docker-ce 2>&1 >> /tmp/boxel-extra.log
echo "[BoxOS] Docker removed."

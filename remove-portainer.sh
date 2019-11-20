#!/bin/sh

#
# remove-portainer.sh
#
# Stops and removes the Portainer Docker container

echo "[BoxOS] Stopping the Portainer container..."
docker stop portainer 2>&1 >> /tmp/boxel-extra.log
echo "[BoxOS] Portainer stopped."

echo "[BoxOS] Removing the Portainer container..."
docker rm portainer 2>&1 >> /tmp/boxel-extra.log
echo "[BoxOS] Portainer removed."

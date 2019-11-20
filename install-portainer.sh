#!/bin/sh

#
# install-portainer.sh
#
# Installs Portainer to manage Docker
#

docker run -d \
  -p 8000:8000 \
  -p 9000:9000 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  --restart always \
  --name portainer \
  portainer/portainer

echo "[BoxOS] Portainer installed and running at http://localhost:9000/"
echo "[BoxOS] Login and finish setting up Portainer."

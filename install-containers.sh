#!/bin/sh

#
# install-containers.sh
#
# Retrieves and installs Docker containers for this Boxel recipe
#

# TODO: Parse the recipe file and substitute the values appropriately

############
# Settings #
############

# User Defined
BOXEL_RECIPE_FILE="boxel.json"
LATITUDE="38.6857"
LONGITUDE="-121.0822"
ALTITUDE="1007"

# Computed
HOST_IP=`ip route get 8.8.8.8 | awk '{print $3; exit}'`
DOCKER_GATEWAY_IP=`ip addr show docker0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1`

######################
# Install Components #
######################

echo "[BoxOS] Installing Boxel components..."

# flightaware-dump1090
echo "[BoxOS]   - flightaware-dump1090"
docker run -d \
  -v run-dump1090-fa:/run/dump1090-fa \
  -p 30001-30005:30001-30005/tcp \
  -p 30104:30104/tcp \
  -e BEAST_OUTPUT_PORT="30005" \
  -e RAW_OUTPUT_PORT="30002" \
  -e SBS_OUTPUT_PORT="30003" \
  -e LATITUDE="${LATITUDE}" \
  -e LONGITUDE="${LONGITUDE}" \
  -e DECODER_OPTIONS="--max-range 360 --quiet" \
  -e JSON_OPTIONS="--write-json-every .2 --write-json /run/dump1090-fa --json-location-accuracy 1" \
  -e NET_OPTIONS="--net --net-heartbeat 60 --net-ro-size 1000 --net-ro-interval 1 --net-ri-port 0 --net-ro-port 30002 --net-sbs-port 30003 --net-bi-port 30004,30104 --net-bo-port 30005" \
  -e RECEIVER_OPTIONS="--net-only" \
  --add-host host:${HOST_IP} \
  --add-host docker-gateway:${DOCKER_GATEWAY_IP} \
  --restart unless-stopped \
  --name flightaware-dump1090 \
  boxel/flightaware-dump1090:latest 2>&1 >> /tmp/boxel-extra.log

# adsbexchange-mlat-client
echo "[BoxOS]   - adsbexchange-mlat-client"
docker run -d \
  -v run-dump1090-fa:/run/dump1090-fa \
  -p 8081:80/tcp \
  -e INPUT_CONNECT="host:30005" \
  -e LATITUDE="${LATITUDE}" \
  -e LONGITUDE="${LONGITUDE}" \
  -e ALTITUDE="${ALTITUDE}" \
  -e MLAT_SERVER="feed.adsbexchange.com:31090" \
  -e MLAT_USER="testignore20191119" \
  -e RESULTS_BEAST_CONNECT="beast,connect,host:30104" \
  --add-host host:${HOST_IP} \
  --add-host docker-gateway:${DOCKER_GATEWAY_IP} \
  --restart unless-stopped \
  --name adsbexchange-mlat-client \
  boxel/mutability-mlat-client:latest 2>&1 >> /tmp/boxel-extra.log

# flightaware-skyview1090
echo "[BoxOS]   - flightaware-skyview1090"
docker run -d \
  -v run-dump1090-fa:/run/dump1090-fa \
  -p 8080:80/tcp \
  -e LATITUDE="${LATITUDE}" \
  -e LONGITUDE="${LONGITUDE}" \
  -e WEB_PORT="80" \
  --add-host host:${HOST_IP} \
  --add-host docker-gateway:${DOCKER_GATEWAY_IP} \
  --restart unless-stopped \
  --name flightaware-skyview1090 \
  boxel/flightaware-skyview1090:latest 2>&1 >> /tmp/boxel-extra.log

# wiedehopf-tar1090
echo "[BoxOS]   - wiedehopf-tar1090"
docker run -d \
  -v run-dump1090-fa:/run/dump1090-fa \
  -p 8081:80/tcp \
  -e LATITUDE="${LATITUDE}" \
  -e LONGITUDE="${LONGITUDE}" \
  --add-host host:${HOST_IP} \
  --add-host docker-gateway:${DOCKER_GATEWAY_IP} \
  --restart unless-stopped \
  --name wiedehopf-tar1090 \
  boxel/wiedehopf-tar1090:latest 2>&1 >> /tmp/boxel-extra.log

echo "[BoxOS] Installation of Boxel components complete."

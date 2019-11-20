#!/bin/sh

#
# remove-containers.sh
#
# Stop and remove all of the defined Docker containers
#

# TODO: Generate this from the boxos.json definition file

# Stop the containers
echo "[BoxOS] Stopping containers..."
echo "[BoxOS]   - adsbexchange-mlat-client"
docker stop adsbexchange-mlat-client
echo "[BoxOS]   - flightaware-dump1090"
docker stop flightaware-dump1090
echo "[BoxOS]   - flightaware-skyview1090"
docker stop flightaware-skyview1090
echo "[BoxOS]   - wiedehopf-tar1090"
docker stop wiedehopf-tar1090
echo "[BoxOS] Containers stopped."

# Remove the containers
echo "[BoxOS] Removing containers..."
echo "[BoxOS]   - adsbexchange-mlat-client"
docker rm adsbexchange-mlat-client
echo "[BoxOS]   - flightaware-dump1090"
docker rm flightaware-dump1090
echo "[BoxOS]   - flightaware-skyview1090"
docker rm flightaware-skyview1090
echo "[BoxOS]   - wiedehopf-tar1090"
docker rm wiedehopf-tar1090
echo "[BoxOS] Containers removed."

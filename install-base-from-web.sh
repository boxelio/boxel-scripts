#!/bin/sh

echo "[BoxOS] Updating apt and installing git..."
apt update && apt install -y git

echo "[BoxOS] Fetching install scripts from https://github.com/boxelio/boxel-scripts"
git clone https://github.com/boxelio/boxel-scripts /tmp/boxel-scripts
cd /tmp/boxel-scripts
chmod +x install/base.sh && install/base.sh

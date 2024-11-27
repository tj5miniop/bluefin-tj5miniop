#!/bin/bash

mkdir /tmp/bluefin-custom
cd /tmp/bluefin-custom

curl -O https://raw.githubusercontent.com/tj5miniop/ublue-scripts/refs/heads/Main/bluefin/build.sh
curl -O https://raw.githubusercontent.com/tj5miniop/ublue-scripts/refs/heads/Main/bluefin/setup.sh

bash build.sh
bash setup.sh
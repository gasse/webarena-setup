#!/bin/bash

# stop if any error occur
set -e

source 00_vars.sh

# install flask in a venv
apt install python3-venv -y
python3 -m venv venv_reset
source venv_reset/bin/activate

cd reset_server/
python server.py --port ${RESET_PORT} >> server.log 2>&1

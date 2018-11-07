#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd $SCRIPT_DIR
cd ..

. ./env-development
PTO=$DEV_PORT ./s_node_1st.sh yarn run serve --port $DEV_PORT

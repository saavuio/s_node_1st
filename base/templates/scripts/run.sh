#!/bin/bash
set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd $SCRIPT_DIR
cd ..

. ./env-development

# bundle
if [ ! -f dist/main.js ]; then
  echo "No build found. Building..."
  ./s_node_1st.sh yarn run bundle:dev
fi

# run
CONTAINER_NAME=$IDENTIFIER-cnt \
  NET_NAME=saavunet \
  PORT_TO_OPEN=$DEV_PORT \
  NODE_ENV=development ./s_node_1st.sh yarn run start

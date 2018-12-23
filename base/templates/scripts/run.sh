#!/bin/bash
set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd $SCRIPT_DIR
cd ..

. ./env-development

# bundle
./s_node_1st.sh yarn run bundle:dev

# run
CONTAINER_NAME=$IDENTIFIER-app \
  NET_NAME=saavunet \
  PORT_TO_OPEN=$DEV_PORT \
  NODE_ENV=development ./s_node_1st.sh yarn run start

#!/bin/bash
set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd $SCRIPT_DIR
cd ..

. ./env-development

echo "NOTE: this runs webpack build and nodemon in parallel. That is why the
app will first run once, then webpack will build the code once, then the app
will run again. After that it will pick up changes and rerun on edit."
echo

# run
CONTAINER_NAME=$IDENTIFIER-cnt \
  NET_NAME=saavunet \
  PORT_TO_OPEN=$DEV_PORT \
  NODE_ENV=development ./s_node_1st.sh yarn run dev

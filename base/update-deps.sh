#!/bin/bash
RUN_DIR=$(pwd)
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

cd $(realpath $SCRIPT_DIR)

echo "install dependencies"
./yarn.sh install

echo
echo "compress node_modules"
tar cjf node_modules.tar.bz2 node_modules/

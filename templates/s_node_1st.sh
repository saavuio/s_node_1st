#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd $SCRIPT_DIR

./dependencies/s_node_1st/scripts/docker_run.sh ${@:1}

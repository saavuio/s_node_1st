#!/bin/bash
echo "Fetching stuff from inside the container."

IMAGE_NAME=s_node_1st
RUNNER=./$IMAGE_NAME.sh
if [ ! -f $RUNNER ]; then exit 1; fi
CONTAINER_NAME=${IMAGE_NAME}_tmp
CONTAINER_NAME=$CONTAINER_NAME NO_TTY=1 $RUNNER eval "sleep 30;" &

sleep 3

docker cp $CONTAINER_NAME:/$IMAGE_NAME/node_modules ./
docker cp $CONTAINER_NAME:/$IMAGE_NAME/.eslintrc.js ./

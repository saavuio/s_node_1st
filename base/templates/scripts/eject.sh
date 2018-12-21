#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd $SCRIPT_DIR
cd ..

if [ ! -f .ejected ]; then
  echo "Fetching stuff from inside the container."
  IMAGE_ID=s_node_1st
  RUNNER=./${IMAGE_ID}.sh
  if [ ! -f $RUNNER ]; then exit 1; fi
  CONTAINER_NAME=${IMAGE_ID}_tmp
  CONTAINER_NAME=$CONTAINER_NAME NO_TTY=1 $RUNNER eval "sleep 30;" &
  #
  echo "run container..."
  until docker ps | grep "$CONTAINER_NAME" > /dev/null; do
    sleep 2
    echo "waiting for container to start..."
  done
  echo "container started!"

  echo "copy files from container..."
  #
  docker cp ${CONTAINER_NAME}:/$IMAGE_ID/.eslintrc.js ./
  #
  docker cp ${CONTAINER_NAME}:/$IMAGE_ID/node_modules.tar.bz2 ./
  echo "extract node_modules..."
  tar xjf node_modules.tar.bz2
  rm node_modules.tar.bz2
  #
  docker stop ${CONTAINER_NAME}
  #
  touch .ejected
fi

echo "done."

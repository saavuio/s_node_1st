#!/bin/bash
if [ -z $PROJECT_ROOT_PATH ]; then
  echo "PROJECT_ROOT_PATH not provided"
  exit 1
fi

$PROJECT_ROOT_PATH/scripts/build.sh

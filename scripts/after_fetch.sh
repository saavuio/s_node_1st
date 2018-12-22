#!/bin/bash
if [ -z $PROJECT_ROOT_PATH ]; then
  echo "PROJECT_ROOT_PATH not provided"
  exit 1
fi

VERSION=v4
rm -rf s_node_1st_cache
git clone --single-branch -b $VERSION https://github.com/saavuio/s_node_1st_cache
cp s_node_1st_cache/node_modules.tar.bz2 s_node_1st/base

# folders required
mkdir ${PROJECT_ROOT_PATH}/src 2> /dev/null
mkdir ${PROJECT_ROOT_PATH}/dist 2> /dev/null
mkdir ${PROJECT_ROOT_PATH}/.webpack-cache 2> /dev/null
touch ${PROJECT_ROOT_PATH}/src/index.js

# link to self
cp ./s_node_1st/base/templates/s_node_1st.sh ${PROJECT_ROOT_PATH}

# scripts
if [ ! -d ${PROJECT_ROOT_PATH}/scripts ]; then
  cp -a ./s_node_1st/base/templates/scripts ${PROJECT_ROOT_PATH}/scripts
fi
# .gitignore skel
if [ ! -f ${PROJECT_ROOT_PATH}/.gitignore ]; then
  cp ./s_node_1st/base/templates/gitignore ${PROJECT_ROOT_PATH}/.gitignore
fi
# env-development skel
if [ ! -f ${PROJECT_ROOT_PATH}/env-development ]; then
  cp ./s_node_1st/base/templates/env-development ${PROJECT_ROOT_PATH}/env-development
fi
# package.json skel
if [ ! -f ${PROJECT_ROOT_PATH}/package.json ]; then
  echo "{}" > ${PROJECT_ROOT_PATH}/package.json
fi

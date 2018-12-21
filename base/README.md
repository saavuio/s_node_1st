# What?
This is a wrapper that makes it a bit easier to configure a Node.js -based app here at Saavu.

## Run stuff through dockerized yarn/npm/node
docker run --rm --entrypoint yarn saavu-local/s_node --version

## Random notes

### Diagnose deprecations
docker run --rm -v $(pwd)/src:/s_node/src --entrypoint sh saavu-local/s_node -c 'cd .. && node --trace-deprecation ./node_modules/.bin/webpack'

### TODO
Follow https://github.com/zhirzh/flow-babel-webpack-plugin for a fix to:
DeprecationWarning: Tapable.plugin is deprecated. Use new API on `.hooks` instead

When fixed, remove:
process.noDeprecation = true;
from webpack.config.js

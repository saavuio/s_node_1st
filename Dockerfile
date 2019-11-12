# NOTE: needs to match base/yarn.sh
FROM node:10.16.3

ARG container_user_id
ARG is_dev

RUN useradd --shell /bin/bash -u $container_user_id -o -c "" -m user-in-container

# install vim to help testing inside container
RUN if [ "$is_dev" = "true" ]; then apt-get update && apt-get install -y vim; fi

RUN mkdir -p /s_node_1st/src && mkdir -p /ext/node_modules

RUN yarn global add package-json-merge flow-typed@2.4 --network-timeout 80000

ADD ./base /s_node_1st
ADD ./scripts/entry.sh /entry.sh

RUN chown -R user-in-container:user-in-container /s_node_1st /ext && chmod +x /entry.sh

USER user-in-container

RUN cd /s_node_1st && tar xjof node_modules.tar.bz2

WORKDIR /s_node_1st/src

FROM node:8.11.3

ARG container_user_id

RUN useradd --shell /bin/bash -u $container_user_id -o -c "" -m user-in-container

# install vim to help testing inside container
RUN apt-get update && apt-get install -y vim

RUN mkdir -p /s_node_1st/src && mkdir -p /ext/node_modules

ADD ./package.json /s_node_1st

RUN cd /s_node_1st && yarn install --network-timeout 80000

RUN yarn global add package-json-merge flow-typed --network-timeout 80000

ADD ./ /s_node_1st

ADD ./entryfiles/entry.sh /entry.sh

RUN chown -R user-in-container:user-in-container /s_node_1st /ext && chmod +x /entry.sh
USER user-in-container

WORKDIR /s_node_1st/src

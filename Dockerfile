# This is a Dockerfile for creating a Manet container from a base Ubuntu 18:04 image.
# Manet's code can be found here: https://github.com/vbauer/manet

FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive
EXPOSE 8891

ENV NVM_DIR      /root/.nvm
ENV NODE_VERSION v18.20.5
ENV NODE_PATH    $NVM_DIR/versions/node/$NODE_VERSION/lib/node_modules
ENV PATH         $NVM_DIR/versions/node/$NODE_VERSION/bin:$PATH

RUN apt-get update && \
    apt-get -y install --no-install-recommends \
    build-essential xvfb libfontconfig1 ca-certificates wget && \
    wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash && \
    . $NVM_DIR/nvm.sh && \
    nvm install $NODE_VERSION && \
    nvm alias default $NODE_VERSION && \
    nvm use default && \
    npm config set prefix /usr/local && \
    npm install -g slimerjs@1.0.0 && \
    npm install -g phantomjs-prebuilt@2.1.16 && \
    npm install -g manet@0.4.23 && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/usr/local/bin/manet", "--port", "8891"]

FROM scratch
ADD centos-7.4.1708-docker.tar.xz /

LABEL name="Python Base Image" \
    vendor="Jacky" \
    build-date="20180215"

# ensure local python is preferred over distribution python
# ENV PATH /usr/local/bin:$PATH
ARG NODE_VERSION=8.9.4

# http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
ENV LANG=zh_CN.UTF-8 \
    PATH=/app/node-v${NODE_VERSION}-linux-x64/bin:$PATH

COPY node-v${NODE_VERSION}-linux-x64.tar.xz /

RUN set -ex \
	&& mkdir -p /app/node-v${NODE_VERSION}-linux-x64 \
	&& tar -xJC /app/node-v${NODE_VERSION}-linux-x64 --strip-components=1 -f node-v${NODE_VERSION}-linux-x64.tar.xz \
	&& rm node-v${NODE_VERSION}-linux-x64.tar.xz \
        \
        && echo $PATH \
	&& npm install -g cnpm --registry=https://registry.npm.taobao.org \
	&& cnpm install -g vue-cli \
	&& cnpm install -g element-ui 


CMD ["/bin/bash"]

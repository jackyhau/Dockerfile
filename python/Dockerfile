FROM scratch
ADD centos-7.4.1708-docker.tar.xz /

LABEL name="Python Base Image" \
    vendor="Jacky" \
    build-date="20180215"

# ensure local python is preferred over distribution python
# ENV PATH /usr/local/bin:$PATH

# http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
ENV LANG=zh_CN.UTF-8 \
    PYTHON_VERSION=3.6.4 \
    LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib \
    PATH=/usr/local/bin:$PATH

COPY Python-$PYTHON_VERSION.tar.xz /

RUN set -ex \
	&& yum -y install make gcc readline-devel zlib-devel tk tk-devel tcl-devel gdbm-devel sqlite-devel openssl-devel bzip2-devel xz-devel libffi-devel pax \
        && yum clean all \
        \
	&& mkdir -p /usr/src/python \
	&& tar -xJC /usr/src/python --strip-components=1 -f Python-$PYTHON_VERSION.tar.xz \
	&& rm Python-$PYTHON_VERSION.tar.xz \
	\
	&& cd /usr/src/python \
	&& ./configure \
		--enable-loadable-sqlite-extensions \
		--enable-shared \
		--with-system-expat \
		--with-system-ffi \
#		--without-ensurepip \
	&& make -j "$(nproc)" \
	&& make install \
	&& ldconfig \
	\
	&& find /usr/local -depth \
		\( \
			\( -type d -a \( -name test -o -name tests \) \) \
			-o \
			\( -type f -a \( -name '*.pyc' -o -name '*.pyo' \) \) \
		\) -exec rm -rf '{}' + \
	&& rm -rf /usr/src/python \
    \
    && mkdir -p /app

# make some useful symlinks that are expected to exist
RUN cd /usr/local/bin \
	&& ln -s idle3 idle \
	&& ln -s pydoc3 pydoc \
	&& ln -s python3 python \
	&& ln -s python3-config python-config \
        \        
        && pip3 install tornado 


CMD ["/bin/bash"]

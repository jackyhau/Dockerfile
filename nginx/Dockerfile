FROM scratch
ADD centos-7.4.1708-docker.tar.xz /

LABEL name="Nginx Base Image" \
    vendor="Jacky" \
    build-date="20180215"

# ensure local python is preferred over distribution python
# ENV PATH /usr/local/bin:$PATH

# http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
ENV LANG=zh_CN.UTF-8 


RUN set -ex \
	&& yum -y install epel-release \
	&& yum -y install nginx \
        && yum clean all \
        \
        && mkdir -p /app


# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Define working directory.
#WORKDIR /etc/nginx


# Expose ports.
EXPOSE 80
#EXPOSE 443


STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
#CMD ["nginx"]



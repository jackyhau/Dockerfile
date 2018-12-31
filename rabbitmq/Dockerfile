FROM scratch
ADD centos-7.4.1708-docker.tar.xz /

LABEL name="Rabbitmq Base Image" \
    vendor="Jacky" \
    build-date="20181231"

# ensure local python is preferred over distribution python
ENV PATH /usr/lib/rabbitmq/bin:$PATH

# http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
ENV LANG=en_US.UTF-8 

# COPY
COPY Dockerfile docker-entrypoint.sh docker-compose.yml /
COPY *.rpm /

RUN set -ex \
	&& rm -rf /etc/localtime \
	&& ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& yum -y install socat logrotate pwgen net-tools \
        && yum clean all \
        && rpm -ivh /erlang-19.0.4-1.el7.centos.x86_64.rpm ./rabbitmq-server-3.6.15-1.el7.noarch.rpm \
        && rm -rf ./erlang-19.0.4-1.el7.centos.x86_64.rpm ./rabbitmq-server-3.6.15-1.el7.noarch.rpm \
        && rabbitmq-plugins enable --offline rabbitmq_management 


# Define mountable directories.
VOLUME ["/var/lib/rabbitmq", "/var/log/rabbitmq"]

# Define working directory.
WORKDIR /var/lib/rabbitmq


# Expose ports.
EXPOSE 4369 5671 5672 25672

# endpoint
# ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/docker-entrypoint.sh"]






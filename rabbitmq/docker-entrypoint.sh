#!/bin/bash
# Add by Jacky Hao <jackyhau@sina.cn>


# setup cookie file
default_cookiefile='/var/lib/rabbitmq/.erlang.cookie'
if [ ! -z "${RABBITMQ_ERLANG_COOKIE}" ]
then
    echo "Update cookie file ..."
    if [ -f ~/.erlang.cookie ]
    then
        echo "${RABBITMQ_ERLANG_COOKIE}" > ~/.erlang.cookie 
        chmod 600 ~/.erlang.cookie
    else
        echo "${RABBITMQ_ERLANG_COOKIE}" > "${default_cookiefile}"
        chmod 600 "${default_cookiefile}"
    fi
    echo "Finished updating cookie file."
fi

    
# setup hostname
echo "Set up /etc/hosts ..."
container_id=`hostname`
container_ip=`grep ${container_id} /etc/hosts| awk '{ print $1 }'`
echo "${container_ip} ${HOSTNAME}" >> /etc/hosts
echo "Finished setting /etc/hosts."


# run rabbitmq-server
echo "Start to run rabbitmq-server ..."
rabbitmq-server


# setup user
# After rabbitmq-server up, need to set up user with the following cmd
#rabbitmqctl add_user admin admin_pass
#rabbitmqctl set_user_tags admin administrator
#rabbitmqctl  set_permissions -p /  admin '.*' '.*' '.*'



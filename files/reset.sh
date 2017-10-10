#!/bin/bash

set -x

cd ~
service rabbitmq-server stop
ps waux | grep rabbitmq | awk '{print $2}' | xargs -n1 kill
apt-get remove -y rabbitmq-server --purge
apt-get -y autoremove
rm -Rf /var/lib/rabbitmq /etc/rabbitmq /var/log/rabbitmq

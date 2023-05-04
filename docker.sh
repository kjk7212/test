#!/bin/sh

yum -y update
yum install vim

yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum-config-manager --enable docker-ce-nightly
yum -y install docker-ce docker-ce-cli containerd.io
systemctl start docker

FROM ubuntu:16.04

RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y \
 	heimdal-clients -y \
 	openssh-client -y \
 && apt-get clean \
 && mkdir /root/sharefiles

RUN apt-get install -y \
	python-software-properties -y \
 	software-properties-common  -y \
 && apt-get clean

RUN add-apt-repository ppa:openafs/stable \
 && apt-get clean

COPY krb5.conf /root/
COPY ssh_config /etc/ssh/

RUN chmod 644 /etc/ssh/ssh_config
RUN export KRB5_CONFIG=/root/krb5.conf \
 && rm /root/krb5.conf


FROM ubuntu:16.04
RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y \
 	heimdal-clients -y \
 	openssh-client -y \
 && mkdir /root/sharefiles

COPY krb5.conf /root/
COPY ssh_config /etc/ssh/
RUN chmod 644 /etc/ssh/ssh_config 

RUN export KRB5_CONFIG=~/root/krb5.conf


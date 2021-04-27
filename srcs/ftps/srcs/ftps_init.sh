#!/bin/sh

adduser -D yo
mv /tmp/catch_me_if_you_can_haha.txt /home/yo/
echo "yo:yopwd" | chpasswd

#start openrc tool
openrc

# starting vsftpd with openrc as per linux wiki reco
rc-update add vsftpd default
touch /run/openrc/softlevel
rc-service vsftpd restart

touch /var/log/vsftpd.log

tail -f /var/log/vsftpd.log
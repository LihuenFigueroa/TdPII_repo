#!/bin/bash

sudo apt-get install vsftpd

sudo sed -i 's/#write_enable=YES/write_enable=YES' /etc/vsftpd.conf

sudo sed -i 's/#chroot_local_user=YES/chroot_local_user=YES' /etc/vsftpd.conf

sudo sed -i '/chroot_local_user=YES/ a allow_writeable_chroot=YES' /etc/vsftpd.conf

sudo sed -i '$ a pasv_enable=YES' /etc/vsftpd.conf

sudo service vsftpd restart

mkdir /var/www/RoR_TDP2
useradd tdp2
passwd Culosucio
chown –R tdp2 /var/www/mydomain.com
groupadd tdp2
gpasswd -a tdp2 tdp2
chgrp -R tdp2 /var/www/RoR_TDP2
chmod -R g+rw /var/www/RoR_TDP2
usermod -d /var/www/RoR_TDP2/ tdp2

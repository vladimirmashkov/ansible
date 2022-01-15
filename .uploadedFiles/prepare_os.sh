#!/bin/bash
groupadd vpn_admin

sed -i "s/SELINUX=permissive/SELINUX=disabled/g" /etc/selinux/config
sed -i "s/PasswordAuthentication yes/#PasswordAuthentication yes/g" /etc/ssh/sshd_config
echo "PasswordAuthentication no" >>  /etc/ssh/sshd_config
echo "AllowGroups root vpn_admin vmashkov" >>  /etc/ssh/sshd_config

chmod 0640 /etc/sudoers 
echo "vmashkov  ALL=(ALL)   NOPASSWD:   ALL" >> /etc/sudoers 
echo "ocserv    ALL=(ALL)   NOPASSWD:   ALL" >> /etc/sudoers 
chmod 0440 /etc/sudoers 

# echo "8.8.8.8" > "/etc/resolv.conf"
# echo "8.8.4.4" >> "/etc/resolv.conf"

# echo "deb http://deb.debian.org/debian/ bullseye main" > "/etc/apt/sources.list"
# echo "deb-src http://deb.debian.org/debian/ bullseye main" >> "/etc/apt/sources.list"

# echo "deb http://security.debian.org/debian-security bullseye-security main contrib" >> "/etc/apt/sources.list"
# echo "deb-src http://security.debian.org/debian-security bullseye-security main contrib" >> "/etc/apt/sources.list"

# echo "deb http://deb.debian.org/debian/ bullseye-updates main contrib" >> "/etc/apt/sources.list"
# echo "deb-src http://deb.debian.org/debian/ bullseye-updates main contrib" >> "/etc/apt/sources.list"

# ==============================================================================
# perl -e 'print crypt("password", "thisIsSaltValueForLinuxPawwsord:)"),"\n"'
# deluser --remove-home vmashkov

useradd -p thwulhKQDeGoc -m -s /bin/bash -U vmashkov
usermod -aG root vmashkov
mkdir -p -m 0644 /home/vmashkov/.ssh/
# curl -k -o "mashkov_key.pub" "https://github.com/vladimirmashkov.keys"
# curl -k -o "vmashkov_key.pub" "https://github.com/dev-vladimirmashkov.keys"
chmod 700 /home/vmashkov/.ssh/
touch /home/vmashkov/.ssh/authorized_keys
touch /home/vmashkov/.Xauthority
cd ~/.uploadedFiles
cat mashkov_key.pub > /home/vmashkov/.ssh/authorized_keys
cat vmashkov_key.pub >> /home/vmashkov/.ssh/authorized_keys
rm mashkov_key.pub vmashkov_key.pub
cd ..
chmod 600 /home/vmashkov/.ssh/authorized_keys
chown vmashkov:vmashkov /home/vmashkov/ -R
# ==============================================================================

useradd -p thcyi2sFzJOYU -m -s /bin/bash -U ocserv
usermod -aG root ocserv
mkdir -p -m 0644 /home/ocserv/.ssh/
chmod 700 /home/ocserv/.ssh/
touch /home/ocserv/.ssh/authorized_keys
touch /home/ocserv/.Xauthority
cat /home/vmashkov/.ssh/authorized_keys > /home/ocserv/.ssh/authorized_keys
chmod 600 /home/ocserv/.ssh/authorized_keys
chown ocserv:ocserv /home/ocserv/ -R

systemctl restart sshd

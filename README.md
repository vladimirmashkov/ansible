# Prepare Server

```
useradd -m vmashkov -G wheel
usermod -aG wheel vmashkov
usermod -aG root vmashkov
mkdir -p -m 0644 /home/vmashkov/.ssh/
chmod 700 /home/vmashkov/.ssh/
touch /home/vmashkov/.ssh/authorized_keys
curl "https://raw.githubusercontent.com/vladimirmashkov/key/master/vmashkov.pub"  --output vmashkov.pub
cat vmashkov.pub > /home/vmashkov/.ssh/authorized_keys
chmod 600 /home/vmashkov/.ssh/authorized_keys
chown vmashkov:vmashkov /home/vmashkov/.ssh/ -R
echo "vmashkov" | passwd vmashkov --stdin
echo
```

# Prepare for Ansible
####CentOS 7
```bash 
yum install -y epel-release && \
yum install -y update && \
yum install -y upgrade && \
yum install -y ansible
```

####Ubuntu
```bash
apt-add-repository -y ppa:ansible/ansible && \
apt-get update -y && \
apt-get upgrade -y  && \
apt-get install -y ansible
```

# ansible

## install ansible
```shell
sudo apt-add-repository ppa:ansible/ansible     #ubuntu
sudo apt -y update
sudo apt -y upgrade
sudo apt -y install ansible sshpass
========================================
sudo yum -y install epel-release
sudo yum -y update
sudo yum -y install ansible sshpass
```
## ping new servers
```shell
ansible -i hosts.cfg new -m ping
```

##
```shell
ansible -i hosts.cfg new -m setup
```

## inventory
```shell
ansible-inventory --list
```

## playbook
```shell
ansible-playbook
```


## helper
```shell
ansible -i hosts.cfg new -m shell -a "uptime"
ansible -i hosts.cfg new -m command -a "uptime"
```




# Ansible example exercising

## To check all servers

```shell
ansible all -m ping
ansible all -m setup
```
## Ad hoc command
```
ansible all -m shell -a "ip a | grep \"inet .* brd .*\" && python --version"
```

## Playbooks

```ps
ansible-playbook playbook/update.yaml
```


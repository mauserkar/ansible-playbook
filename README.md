## Requirements
- Ansible
- Set inventory files/inventory.ini
- Create ssh key: `ssh-keygen -t rsa -b 4096 -f files/ansible.key`

## Requirements local (devlop)
- Virtualbox (Environment local, dev folder)
- Vagrant (Environment local, dev folder)
- Ansible
- Create ssh key: `ssh-keygen -t rsa -b 4096 -f files/ansible.key`
- copy ansible.pub inside bootstrap.sh

## Deploy

ansible-playbook -e "hosts=vm1" -e "user=carlos" run.yml

Local: cd dev && vagrant up 
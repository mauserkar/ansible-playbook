## Requirements
- Ansible
- Set inventory files/inventory.ini
- create ssh key: `ssh-keygen -t rsa -b 4096 -f files/ansible.key`

## Deploy

ansible-playbook -e "hosts=localhost" -e "user=carlos" run.yml
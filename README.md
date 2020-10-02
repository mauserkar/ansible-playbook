## Requirements
- Ansible

### Build
- make build

### Config (if you use make build its not necesary)
- check group_vars/all/*.yml
- check an_user and an_pwd vars
- add ssh key files/
- Set you server in files/inventory.ini
- check run-pb.yml what do you want to deploy it

### Deploy
- make ap_run_pb or make ap_run_role

______________
## Requirements local (develop)
- Virtualbox (Environment local, dev folder)
- Vagrant (Environment local, dev folder)
- Ansible
  
### Build
- make build_dev
- vagrant_up

### deploy
- make ap_run_pb or make ap_run_role
- make ssh_vm1 or make ssh_vm2
AN_USER_DEPLOY ?= vagrant
AN_HOSTS ?= vm1
AN_USER_SSH_KEY ?= dev-vagrant

build:
	AN_USER_SSH_KEY
build_dev:
	AN_USER_SSH_KEY_dev
an_user_ssh_key:
	ssh-keygen -t rsa -b 4096 -f files/${AN_USER_SSH_KEY}
an_user_ssh_key_dev:
	@if [ ! -f dev/${AN_USER_SSH_KEY}.key ]; then ssh-keygen -t rsa -b 4096 -f dev/${AN_USER_SSH_KEY}.key; fi
	PUB_KEY=`cat files/${AN_USER_SSH_KEY}.pub`
	sed -i "s/paste_you_key.pub/${PUB_KEY}g" dev/bootstrap.sh
ap_run_pb:
	ansible-playbook -e "an_hosts=${AN_HOSTS}" -e "an_user_deploy=${AN_USER_DEPLOY}" run-pb.yml
vagrant_up:
	cd dev && vagrant up && cd ..
vagrant_down:
	cd dev && vagrant halt && cd ..
ssh_vm1:
	ssh -i dev/${AN_USER_SSH_KEY}.key vagrant@10.10.1.16
ssh_vm2:
	ssh -i dev/${AN_USER_SSH_KEY}.key vagrant@10.10.2.16
cmd:
	@grep '^[^#[:space:]].*:' Makefile
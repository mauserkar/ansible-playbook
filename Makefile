AN_USER ?= vagrant
AN_HOSTS ?= vm1
SSH_KEY ?= ansible

build:
	ssh_key
build_dev:
	ssh_key_dev
ssh_key:
	ssh-keygen -t rsa -b 4096 -f files/${SSH_KEY}
ssh_key_dev:
	@if [ ! -f files/${SSH_KEY}.key ]; then ssh-keygen -t rsa -b 4096 -f files/${SSH_KEY}.key; fi
	PUB_KEY=`cat files/${SSH_KEY}.pub`
	sed -i "s/paste_you_key.pub/${PUB_KEY}g" dev/bootstrap.sh
ap_run_pb:
	ansible-playbook -e "an_hosts=${AN_HOSTS}" -e "an_user=${AN_USER}" run-pb.yml
vagrant_up:
	cd dev && vagrant up && cd ..
vagrant_down:
	cd dev && vagrant halt && cd ..
ssh_vm1:
	ssh -i files/${SSH_KEY}.key vagrant@10.10.1.16
ssh_vm2:
	ssh -i files/${SSH_KEY}.key vagrant@10.10.2.16
cmd:
	@grep '^[^#[:space:]].*:' Makefile
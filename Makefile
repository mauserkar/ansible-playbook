USER ?= vagrant
HOSTS ?= vm1

build:
	ssh-keygen -t rsa -b 4096 -f files/ansible.key

build_dev:
	ssh-keygen -t rsa -b 4096 -f files/ansible.key
	PUB_KEY=$(cat files/ansible.pub)
	sed -i "s/paste_you_key.pub/${PUB_KEY}/g" dev/bootstrap.sh

ap_run:
	ansible-playbook -e "hosts=${HOSTS}" -e "user=${USER}" run.yml

vm1_ssh:
	ssh -i files/ansible.key vagrant@10.10.1.16

vm2_ssh:
	ssh -i files/ansible.key vagrant@10.10.1.16

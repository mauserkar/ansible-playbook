#!/usr/bin/env bash
apt-get update
# install python
apt-get install python python-pip -q -y

echo "paste_you_ansible.pub" >> /home/vagrant/.ssh/authorized_keys
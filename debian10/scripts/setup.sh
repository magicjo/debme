#!/bin/bash

set -o nounset
set -o errexit

SSH_USER=${SSH_USERNAME}

# Install Ansible
apt --yes update && apt --yes upgrade
apt --yes install python3-pip python-apt git
pip3 --no-cache-dir install ansible

# Change sudoers
echo "${SSH_USER} ALL=(ALL:ALL) NOPASSWD:ALL" > "/etc/sudoers.d/${SSH_USER}" \
  && chmod 0440 "/etc/sudoers.d/${SSH_USER}"

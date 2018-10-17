#!/bin/bash -e

# Install Roles
if [[ -d roles ]]; then
    rm -rf roles
fi
mkdir -p roles
ansible-galaxy --roles-path=roles install --force -r requirements.yml

# Run SOE
ansible-playbook -K soe.yml

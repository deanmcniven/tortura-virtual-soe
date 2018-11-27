#!/bin/bash -e

DOWNLOAD_ONLY='false'

if [[ "$1" == "download" ]]; then
    DOWNLOAD_ONLY='true'
fi

# Install Roles
if [[ -d roles ]]; then
    rm -rf roles
fi
mkdir -p roles
ansible-galaxy --roles-path=roles install --force -r requirements.yml

if [[ "$DOWNLOAD_ONLY" != "true" ]]; then
    # Run SOE
    ansible-playbook -K soe.yml
fi

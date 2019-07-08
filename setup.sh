#!/bin/sh

if [ ! "$(command -v ansible-playbook 2> /dev/null)" ]; then
  if [ ! "$(command -v brew 2> /dev/null)" ]; then
    echo "Please install Homebrew"
    exit 1
  else
    brew install ansible
  fi
fi
DIR=$(dirname "$0")
cd "$DIR" || exit 2
rm -f playbook.retry
ansible-playbook -i localhost, bootstrap.yml
. ~/.bash_profile
ansible-playbook -i localhost, playbook.yml 


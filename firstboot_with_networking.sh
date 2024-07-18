#!/bin/bash

apt update
apt --assume-yes install  git ansible

# The comma in the inventory list is necessary
ansible-pull --url https://github.com/rbeede/auto-raspberry-pi.git --inventory `hostname`, SOME_PLAYBOOK_HERE.yml

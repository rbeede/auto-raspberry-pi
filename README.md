# auto-raspberry-pi
Scripts to simplify setup of headless Raspberry Pi

* Assumes booting from a microSD
* Tested using a Raspberry Pi 4B

## Software

* Raspberry Pi Imager [https://www.raspberrypi.com/software/]
* Raspberry Pi OS Lite **64-bit** [https://www.raspberrypi.com/software/operating-systems/#:~:text=Archive-,Raspberry%20Pi%20OS%20(64%2Dbit,-)]

## Imaging

1. If needed enable ssh
1. Configure the keyboard
1. Configure timezone
1. Configure network connection

## Before first-boot

1. Edit file on bootfs / firstrun.sh
1. Before the line `rm -f /boot/firstrun.sh` (near end) insert the necessary hooks

## Hooks

```shell
# Insert before the rm -f /boot/firstrun.sh line in the firstrun.sh file

apt update
apt --assume-yes install  git ansible

# The comma in the inventory list is necessary
ansible-pull --url https://github.com/rbeede/auto-raspberry-pi.git --inventory `hostname`, SOME_PLAYBOOK_HERE.yml
```

## Playbooks

These can be found in the playbooks folder of the repository

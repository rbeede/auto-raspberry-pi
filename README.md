# auto-raspberry-pi
Scripts to simplify setup of headless Raspberry Pi. Similar idea to https://github.com/nmcclain/raspberian-firstboot?tab=readme-ov-file but does not require a new image build.

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
1. Before the line `rm -f /boot/firstrun.sh` (near end) insert the necessary hook below

### Hook firstrun.sh

```shell
# Insert before the rm -f /boot/firstrun.sh line in the firstrun.sh file
# Note taht in firstrun.sh networking is not yet available

```

### Add /boot/first_boot_with_networking.sh

This file will be executed after networking is available

1. Copy any content you want (see repo example) to bootfs / first_boot_with_networking.sh

## Playbooks

These can be found in the playbooks folder of the repository

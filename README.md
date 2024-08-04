# auto-raspberry-pi
Scripts to simplify setup of headless Raspberry Pi. Similar idea to https://github.com/nmcclain/raspberian-firstboot?tab=readme-ov-file but does not require a new image build.

* Assumes booting from a microSD
* Tested using a Raspberry Pi 4B

## Software

* Raspberry Pi Imager [https://www.raspberrypi.com/software/]
* Raspberry Pi OS Lite **64-bit** [https://www.raspberrypi.com/software/operating-systems/#:~:text=Archive-,Raspberry%20Pi%20OS%20(64%2Dbit,-)]

## Imaging

You must apply a customized configuration otherwise the boot sequence will not use custom shell commands on first boot.

1. If needed enable ssh
1. Configure the keyboard
1. Configure timezone
1. Configure network connection

## Before first-boot

1. Copy the repository file firstboot_with_networking.service to /boot (aka bootfs)
1. Edit the file on the Raspberry Pi imaged disk: /boot/firstrun.sh (aka bootfs / firstrun.sh)
1. Before the line `rm -f /boot/firstrun.sh` (near end) insert the necessary hook below

⚠️A bug in Raspberry Pi Imager v1.8.5 and changes in Raspberry Pi OS breaks this process. https://github.com/raspberrypi/rpi-imager/issues/637
- You may be able to fix it by changing /boot/firstrun.sh to use /boot/firmware/ instead of /boot
- A future version of the imager is going to move to cloud-init which will simplify a lot of things

### Hook firstrun.sh

```shell
# Note that in firstrun.sh networking is not yet available

cp /boot/firmware/firstboot_with_networking.service /lib/systemd/system/
cd /etc/systemd/system/multi-user.target.wants && ln -s /lib/systemd/system/firstboot_with_networking.service .
```

### Add /boot/first_boot_with_networking.sh

This file will be executed after networking is available

1. Copy any content you want (see repo example) to /boot/firmware/first_boot_with_networking.sh
1. Because /boot/firmware/ (aka bootfs) will be a FAT filesystem all the files will already have +x mode set for execution

## Playbooks

These can be found in the playbooks folder of the repository

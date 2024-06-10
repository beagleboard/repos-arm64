#!/bin/bash

if ! id | grep -q root; then
	echo "./install-micropython.sh must be run as root:"
	echo "sudo ./install-micropython.sh"
	exit
fi

remotecore="mcu-r5f0_0"

cd /opt/ti-zephyr-firmware/j722s/${remotecore}/

cp -v ./zephyr_micropython.elf /usr/lib/firmware/j722s-${remotecore}-fw

update-initramfs -uk `uname -r`
cp -v /boot/initrd.img-`uname -r` /boot/firmware/initrd.img

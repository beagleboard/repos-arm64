#!/bin/bash

if ! id | grep -q root; then
	echo "beagle-pin-mux must be run as root:"
	echo "sudo beagle-pin-mux"
	exit
fi


cp -v ./vx_app_rtos_linux_c7x_1.out /usr/lib/firmware/j722s-c71_0-fw
cp -v ./vx_app_rtos_linux_c7x_2.out /usr/lib/firmware/j722s-c71_1-fw
cp -v ./vx_app_rtos_linux_mcu2_0.out /usr/lib/firmware/j722s-main-r5f0_0-fw

sudo update-initramfs -uk `uname -r`
sudo cp /boot/initrd.img-`uname -r` /boot/firmware/initrd.img

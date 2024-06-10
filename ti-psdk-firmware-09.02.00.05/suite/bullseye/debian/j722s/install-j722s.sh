#!/bin/bash

if ! id | grep -q root; then
	echo "./install-j722s.sh must be run as root:"
	echo "sudo ./install-j722s.sh"
	exit
fi

cd /opt/ti-psdk-firmware-09.02.00.05/j722s/vision_apps_eaik/

cp -v ./vx_app_rtos_linux_c7x_1.out /usr/lib/firmware/j722s-c71_0-fw
cp -v ./vx_app_rtos_linux_c7x_2.out /usr/lib/firmware/j722s-c71_1-fw
cp -v ./vx_app_rtos_linux_mcu2_0.out /usr/lib/firmware/j722s-main-r5f0_0-fw

update-initramfs -uk `uname -r`
cp -v /boot/initrd.img-`uname -r` /boot/firmware/initrd.img

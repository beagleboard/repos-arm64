#!/bin/bash

if ! id | grep -q root; then
	echo "must be run as root"
	exit
fi

wdir="/opt/u-boot/bb-u-boot-beagleboneai64"

if [ -d /boot/firmware/ ] ; then
	mmc extcsd read /dev/mmcblk0
	mmc bootpart enable 1 2 /dev/mmcblk0
	mmc bootbus set single_backward x1 x8 /dev/mmcblk0
	echo '0' >> /sys/class/block/mmcblk0boot0/force_ro
	dd if=tiboot3.bin of=/dev/mmcblk0boot0 count=3 bs=128k
	dd if=tispl.bin of=/dev/mmcblk0boot0 seek=3 count=6 bs=128k
	dd if=u-boot.img of=/dev/mmcblk0boot0 seek=9 count=16 bs=128k
	dd if=sysfw.itb of=/dev/mmcblk0boot0 seek=25 count=3 bs=128k
fi

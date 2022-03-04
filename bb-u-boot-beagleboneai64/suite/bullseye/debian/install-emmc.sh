#!/bin/bash

if ! id | grep -q root; then
	echo "must be run as root"
	exit
fi

wdir="/opt/u-boot/bb-u-boot-beagleboneai64"

if [ -b /dev/mmcblk0 ] ; then
	#mmc extcsd read /dev/mmcblk0
	mmc bootpart enable 1 2 /dev/mmcblk0
	mmc bootbus set single_backward x1 x8 /dev/mmcblk0
	mmc hwreset enable /dev/mmcblk0

	echo '0' >> /sys/class/block/mmcblk0boot0/force_ro
	dd if=${wdir}/tiboot3.bin of=/dev/mmcblk0boot0 count=3 bs=128k

	#legacy, we just doing FS mode now...
	dd if=/dev/zero of=/dev/mmcblk0boot0 seek=3 count=6 bs=128k
	dd if=/dev/zero of=/dev/mmcblk0boot0 seek=9 count=16 bs=128k
	dd if=/dev/zero of=/dev/mmcblk0boot0 seek=25 count=3 bs=128k
fi

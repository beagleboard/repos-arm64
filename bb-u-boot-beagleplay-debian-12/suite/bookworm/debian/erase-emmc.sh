#!/bin/bash

if ! id | grep -q root; then
	echo "must be run as root"
	exit
fi

wdir="/opt/u-boot/bb-u-boot-beagleplay"

if [ -b /dev/mmcblk0 ] ; then
	#mmc extcsd read /dev/mmcblk0
	mmc bootpart enable 1 2 /dev/mmcblk0
	mmc bootbus set single_backward x1 x8 /dev/mmcblk0
	mmc hwreset enable /dev/mmcblk0

	echo "Clearing eMMC boot0"

	echo '0' >> /sys/class/block/mmcblk0boot0/force_ro

	echo "dd if=/dev/zero of=/dev/mmcblk0boot0 count=32 bs=128k"
	dd if=/dev/zero of=/dev/mmcblk0boot0 count=32 bs=128k
fi

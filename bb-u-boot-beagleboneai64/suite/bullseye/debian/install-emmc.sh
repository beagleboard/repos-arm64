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

	echo "Clearing eMMC boot0"

	echo '0' >> /sys/class/block/mmcblk0boot0/force_ro

	echo "dd if=/dev/zero of=/dev/mmcblk0boot0 count=32 bs=128k"
	dd if=/dev/zero of=/dev/mmcblk0boot0 count=32 bs=128k

	echo "dd if=${wdir}/tiboot3.bin of=/dev/mmcblk0boot0 bs=128k"
	dd if=${wdir}/tiboot3.bin of=/dev/mmcblk0boot0 bs=128k
fi

#if [ -d /boot/firmware/ ] ; then
#	cp -v /opt/u-boot/bb-k3-image-gen-j721e-evm/sysfw.itb /boot/firmware/
#	cp -v ${wdir}/tiboot3.bin /boot/firmware/
#	cp -v ${wdir}/tispl.bin /boot/firmware/
#	cp -v ${wdir}/u-boot.img /boot/firmware/
#fi

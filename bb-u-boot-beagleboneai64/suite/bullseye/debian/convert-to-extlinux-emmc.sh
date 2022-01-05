#!/bin/bash

if ! id | grep -q root; then
	echo "must be run as root"
	exit
fi

wdir="/opt/u-boot/bb-u-boot-beagleboneai64"

if [ -d /boot/firmware/ ] ; then
	mkdir -p /boot/firmware/extlinux/
	cp -v ${wdir}/emmc-extlinux.conf /boot/firmware/extlinux/extlinux.conf
	sudo cp -v /boot/Image-`uname -r` /boot/firmware/Image
	sudo cp -v /boot/*.dtb /boot/firmware/
fi

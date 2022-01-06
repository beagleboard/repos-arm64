#!/bin/bash

if ! id | grep -q root; then
	echo "must be run as root"
	exit
fi

wdir="/opt/u-boot/bb-u-boot-beagleboneai64"

if [ -d /boot/firmware/ ] ; then
	mkdir -p /boot/firmware/extlinux/
	cp -v ${wdir}/microsd-extlinux.conf /boot/firmware/extlinux/extlinux.conf
	cp -v /boot/Image-`uname -r` /boot/firmware/Image
	cp -v /boot/initrd.img-`uname -r` /boot/firmware/initrd.img
	cp -v /boot/dtbs/`uname -r`/ti/k3-j721e-*dtb /boot/firmware/
fi

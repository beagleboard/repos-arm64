#!/bin/bash

if ! id | grep -q root; then
	echo "must be run as root"
	exit
fi

wdir="/opt/u-boot/bb-u-boot-pocketbeagle2-mainline"

if [ -d /boot/firmware/ ] ; then
	cp -v ${wdir}/tiboot3.bin /boot/firmware/
	cp -v ${wdir}/tispl.bin /boot/firmware/
	cp -v ${wdir}/u-boot.img /boot/firmware/
	if [ -f /boot/firmware/extlinux/extlinux.conf ] ; then
		echo "Patching extlinux.conf"
		sed -i -s 's:ttyS4:ttyS2:g' /boot/firmware/extlinux/extlinux.conf
		sed -i -e 's:2800000:2860000:g' /boot/firmware/extlinux/extlinux.conf
		sed -i -e 's:append root:append console=ttyS2,115200n8 root:g' /boot/firmware/extlinux/extlinux.conf
	fi
	if [ ! -f /boot/firmware/ti/k3-am62-pocketbeagle2.dtb ] ; then
		echo "Missing k3-am62-pocketbeagle2.dtb using copy of k3-am6232-pocketbeagle2.dtb"
		cp -v /boot/firmware/ti/k3-am6232-pocketbeagle2.dtb /boot/firmware/ti/k3-am62-pocketbeagle2.dtb
	fi
fi

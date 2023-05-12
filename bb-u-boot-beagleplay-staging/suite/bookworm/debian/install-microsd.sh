#!/bin/bash

if ! id | grep -q root; then
	echo "must be run as root"
	exit
fi

wdir="/opt/u-boot/bb-u-boot-beagleplay-staging"

if [ -d /boot/firmware/ ] ; then
	cp -v ${wdir}/tiboot3.bin /boot/firmware/
	cp -v ${wdir}/tispl.bin /boot/firmware/
	cp -v ${wdir}/u-boot.img /boot/firmware/
	if [ ! -d /boot/firmware/ti-sysfw/ ] ; then
		mkdir -p /boot/firmware/ti-sysfw/
	fi
	cp -v ${wdir}/ti-fs-stub-firmware-am62x-gp-signed.bin /boot/firmware/ti-sysfw/
fi

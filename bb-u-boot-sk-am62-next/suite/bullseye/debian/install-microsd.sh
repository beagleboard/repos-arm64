#!/bin/bash

if ! id | grep -q root; then
	echo "must be run as root"
	exit
fi

wdir="/opt/u-boot/bb-u-boot-sk-am62-next"

if [ -d /boot/firmware/ ] ; then
	cp -v ${wdir}/tiboot3.bin /boot/firmware/
	cp -v ${wdir}/tispl.bin /boot/firmware/
	cp -v ${wdir}/u-boot.img /boot/firmware/
fi

#!/bin/bash

dl_src () {
	if [ -d ./src/ ] ; then
		rm -rf ./src/
	fi

	git clone git@github.com:beagleboard/j721e-evm.git ./src/
}

copy_all () {
	cp -v ./src${wdir}${wfile} ./suite/bullseye/debian/
}

dl_src

wfile="sysfw.itb" ; wdir="/rootfs/boot/firmware/CoreSDK-08.00.00.004/" ; copy_all
wfile="tiboot3.bin" ; wdir="/rootfs/boot/firmware/CoreSDK-08.00.00.004/" ; copy_all
wfile="tispl.bin" ; wdir="/rootfs/boot/firmware/CoreSDK-08.00.00.004/" ; copy_all
wfile="u-boot.img" ; wdir="/rootfs/boot/firmware/CoreSDK-08.00.00.004/" ; copy_all
wfile="bl31.bin" ; wdir="/rootfs/boot/firmware/CoreSDK-08.00.00.004/" ; copy_all
wfile="tee-pager_v2.bin" ; wdir="/rootfs/boot/firmware/CoreSDK-08.00.00.004/" ; copy_all

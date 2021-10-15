#!/bin/bash

version="08_00_00-2021.08.30"

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

wfile="bl31.bin"                                  ; wdir="/rootfs/boot/firmware/${version}/" ; copy_all
wfile="ipc_echo_testb_mcu1_0_release_strip.xer5f" ; wdir="/rootfs/boot/firmware/${version}/" ; copy_all
wfile="sysfw.itb"                                 ; wdir="/rootfs/boot/firmware/${version}/" ; copy_all
wfile="tee-pager_v2.bin"                          ; wdir="/rootfs/boot/firmware/${version}/" ; copy_all

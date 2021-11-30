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

wfile="10-of-symlink.rules" ; wdir="/rootfs/etc/udev/rules.d/" ; copy_all
wfile="86-remoteproc-noroot.rules" ; wdir="/rootfs/etc/udev/rules.d/" ; copy_all

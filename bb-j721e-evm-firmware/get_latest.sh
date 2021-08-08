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

wfile="j7-c66_0-fw.tisdk" ; wdir="/rootfs/lib/firmware/CoreSDK-08.00.00.004/" ; copy_all
wfile="j7-c66_1-fw.tisdk" ; wdir="/rootfs/lib/firmware/CoreSDK-08.00.00.004/" ; copy_all
wfile="j7-c71_0-fw.tisdk" ; wdir="/rootfs/lib/firmware/CoreSDK-08.00.00.004/" ; copy_all
wfile="j7-main-r5f0_0-fw.tisdk" ; wdir="/rootfs/lib/firmware/CoreSDK-08.00.00.004/" ; copy_all
wfile="j7-main-r5f0_1-fw.tisdk" ; wdir="/rootfs/lib/firmware/CoreSDK-08.00.00.004/" ; copy_all
wfile="j7-main-r5f1_0-fw.tisdk" ; wdir="/rootfs/lib/firmware/CoreSDK-08.00.00.004/" ; copy_all
wfile="j7-main-r5f1_1-fw.tisdk" ; wdir="/rootfs/lib/firmware/CoreSDK-08.00.00.004/" ; copy_all
wfile="j7-mcu-r5f0_0-fw.tisdk" ; wdir="/rootfs/lib/firmware/CoreSDK-08.00.00.004/" ; copy_all
wfile="j7-mcu-r5f0_1-fw.tisdk" ; wdir="/rootfs/lib/firmware/CoreSDK-08.00.00.004/" ; copy_all
wfile="mhdp8546.bin" ; wdir="/rootfs/lib/firmware/CoreSDK-08.00.00.004/" ; copy_all

#!/bin/bash

dl_src () {
	if [ -d ./src/ ] ; then
		rm -rf ./src/
	fi

	git clone https://openbeagle.org/beagleboard/cc33xx.git ./src/
}

copy () {
	cp -v ./src/${wfile} ./suite/bullseye/debian/
	cp -v ./src/${wfile} ./suite/bookworm/debian/
}

dl_src

wfile="cc33xx_rootfs/lib/firmware/ti-connectivity/cc33xx-conf.bin"       ; copy
wfile="cc33xx_rootfs/lib/firmware/ti-connectivity/cc33xx_2nd_loader.bin" ; copy
wfile="cc33xx_rootfs/lib/firmware/ti-connectivity/cc33xx_fw.bin"         ; copy

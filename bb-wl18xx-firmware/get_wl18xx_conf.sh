#!/bin/bash

dl_src () {
	if [ -d ./src/ ] ; then
		rm -rf ./src/
	fi

	git clone -b R8.7_SP3-bbb.io https://git.beagleboard.org/beagleboard/18xx-ti-utils.git ./src/
}

copy () {
	cp -v ./src/${wfile} ./suite/bullseye/debian/wl18xx-conf.bin
}

dl_src

wfile="wlconf/device-20221220-wl18xx-conf.bin" ; wdir="/debian/" ; copy

#!/bin/bash

dl_src () {
	if [ -d ./src/ ] ; then
		rm -rf ./src/
	fi

	git clone https://git.beagleboard.org/beagleboard/raspi-config.git ./src/
}

copy_all () {
	cp -v ./src/${wfile} ./suite/bullseye/debian/
}

dl_src

wfile="LICENSE" ; copy_all
wfile="raspi-config" ; copy_all

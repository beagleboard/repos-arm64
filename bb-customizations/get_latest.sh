#!/bin/bash

dl_src () {
	if [ -d ./src/ ] ; then
		rm -rf ./src/
	fi

	git clone https://openbeagle.org/beagleboard/usr-customizations.git ./src/
}

copy_all () {
	cp -v ./src${wdir}${wfile} ./suite/bullseye/debian/
	cp -v ./src${wdir}${wfile} ./suite/bookworm/debian/
	cp -v ./src${wdir}${wfile} ./suite/noble/debian/
	cp -v ./src${wdir}${wfile} ./suite/trixie/debian/
	cp -v ./src${wdir}${wfile} ./suite/forky/debian/
}

dl_src

wfile="10-of-symlink.rules" ; wdir="/arm64/etc/udev/rules.d/" ; copy_all
wfile="83-counter-noroot.rules" ; wdir="/arm64/etc/udev/rules.d/" ; copy_all

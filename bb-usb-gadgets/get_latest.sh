#!/bin/bash

dl_src () {
	if [ -d ./src/ ] ; then
		rm -rf ./src/
	fi

	git clone https://openbeagle.org/beagleboard/usr-customizations.git ./src/
}

copy_all () {
	cp -v ./src${wdir}${wfile} ./suite/bookworm/debian/
	cp -v ./src${wdir}${wfile} ./suite/trixie/debian/
	cp -v ./src${wdir}${wfile} ./suite/forky/debian/
	cp -v ./src${wdir}${wfile} ./suite/noble/debian/
}

dl_src

wfile="bb-start-acm-ncm-rndis-old-gadget"     ; wdir="/arm64/usr/bin/" ; copy_all
wfile="bb-start-usb-gadgets"                  ; wdir="/arm32/usr/bin/" ; copy_all
